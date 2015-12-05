#!/usr/bin/python

import subprocess
import sys
import signal
import argparse
import time
import numpy as np
import math

FORWARD = 0
REVERSE = 1

parser = argparse.ArgumentParser(description='Hobfs controller')
parser.add_argument('--period', help='Duration of each permutation in milliseconds',
                    type=int, action="store", default=1000)
parser.add_argument('--seed', help='Seed for initializing psuedorandom permutation generation',
                    type=int, action="store", default=True)
parser.add_argument('--thrift-port', help='Thrift server port for table updates',
                    type=str, action="store", default="22222")
parser.add_argument('--length', help='Length of permutation in bytes',
                    type=int, action="store", default=14)
parser.add_argument('--mode', help='0 or 1 indicating forward or reverse obfuscation',
                    type=int, action="store", default=0)
parser.add_argument('--init', help='initialize the switch for normal operations', action="store_true")
parser.add_argument('--secure', help='commence secure communications', action="store_true")
parser.add_argument('--unsecure', help='cease secure mode and communicate normally', action="store_true")

args = parser.parse_args()

period = args.period / 1000.0
periodinv = period ** -1

cmd = "./run_cli.bash"
cmd_arg1 = args.thrift_port

def signal_handler(signal, frame):
  print("Dynamic header obfuscation stopped; communications may be insecure.")
  sys.exit(0)

# From WolframH via http://stackoverflow.com/questions/9185768/inverting-permutations-in-python
def inv(perm):
  inverse = [0] * len(perm)
  for i, p in enumerate(perm):
    inverse[p] = i
  return inverse

def update(permgen, lt):
  p4_cli_cmd = "set_default_action obfsl2 a_obfsl2"
  p = subprocess.Popen([cmd, cmd_arg1], stdin=subprocess.PIPE)
  permgen.seed(args.seed + int(periodinv * lt))
  perm = permgen.permutation(args.length)
  if args.mode == REVERSE:
    perm = inv(perm)
  for x in perm:
    p4_cli_cmd += " " + str(x)
  p.communicate(p4_cli_cmd)

def main():
  signal.signal(signal.SIGINT, signal_handler)
  if args.init:
    print("Initializing switch at port " + cmd_arg1 + " for normal operations")
    p = subprocess.Popen([cmd, cmd_arg1], stdin=subprocess.PIPE)
    p.communicate("add_entry forward 1 set_egr 2")
    p = subprocess.Popen([cmd, cmd_arg1], stdin=subprocess.PIPE)
    p.communicate("add_entry forward 2 set_egr 1")
    p = subprocess.Popen([cmd, cmd_arg1], stdin=subprocess.PIPE)
    p.communicate("set_default_action modecheck unsecure")
    p = subprocess.Popen([cmd, cmd_arg1], stdin=subprocess.PIPE)
    p.communicate("set_default_action obfsprep a_obfsprep")
    p = subprocess.Popen([cmd, cmd_arg1], stdin=subprocess.PIPE)
    p.communicate("set_default_action obfsfinish a_obfsfinish")
    p = subprocess.Popen([cmd, cmd_arg1], stdin=subprocess.PIPE)
    p.communicate("set_default_action obfsl2 a_obfsl2 0 1 2 3 4 5 6 7 8 9 10 11 12 13")

  if args.unsecure:
    p = subprocess.Popen([cmd, cmd_arg1], stdin=subprocess.PIPE)
    p.communicate("set_default_action obfsl2 a_obfsl2 0 1 2 3 4 5 6 7 8 9 10 11 12 13")
    p = subprocess.Popen([cmd, cmd_arg1], stdin=subprocess.PIPE)
    p.communicate("set_default_action modecheck unsecure")

  if args.secure:  
    p = subprocess.Popen([cmd, cmd_arg1], stdin=subprocess.PIPE)
    p.communicate("set_default_action modecheck secure")
    permgen = np.random.RandomState()
    ct = time.time()
    time.sleep( period - (ct * periodinv - int(ct * periodinv)) / periodinv )
    lt = time.time()
    while True:
      update(permgen, lt)
      ct = time.time()
      time.sleep( period - (ct * periodinv - int(ct * periodinv)) / periodinv )
      lt = time.time()

if __name__ == '__main__':
    main()
