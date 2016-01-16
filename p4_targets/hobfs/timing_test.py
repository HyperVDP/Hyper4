import time
import argparse
import sys

parser = argparse.ArgumentParser(description='Test code for hobfs controller')
parser.add_argument('--period', help='Duration of each permutation in milliseconds',
                    type=float, action="store", default=1000)

args = parser.parse_args()

period = args.period / 1000.0
periodinv = period ** -1

def func(t):
  print(str(t))

def main():
  ct = time.time()
  time.sleep( period - (ct * periodinv - int(ct * periodinv)) / periodinv )
  lt = time.time()
  while True:
    func(lt)
    ct = time.time()
    time.sleep( period - (ct * periodinv - int(ct * periodinv)) / periodinv )
    lt = time.time()

if __name__ == '__main__':
    main()
