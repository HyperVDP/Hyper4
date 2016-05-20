#!/usr/bin/python

import argparse

parser = argparse.ArgumentParser(description='HP4 Commands Annotation Stripper')
parser.add_argument('--input', help='Annotated hp4 commands file',
                    type=str, action="store", required=True)
parser.add_argument('--output', help='Where to write hp4-ready commands file',
                    type=str, action="store", required=True)
parser.add_argument('--progID', help='Program ID',
                    type=str, action="store", default='1')

args = parser.parse_args()

f_ac = open(args.input, 'r')
f_c = open(args.output, 'w')

sr = {}

# TODO: add more
sr['[program ID]'] = args.progID
sr['[DONE]'] = '0'
sr['[EXTRACTED_EXACT]'] = '1'
sr['[STDMETA_EXACT]'] = '3'
sr['[EXTRACTED_VALID]'] = '4'
sr['[INSPECT_SEB]'] = '1'
sr['[INSPECT_20_29]'] = '2'
sr['[PROCEED]'] = '0'
sr['[STDMETA_INGRESS_PORT]'] = '1'
sr['[COMPLETE]'] = '1'
sr['[MODIFY_FIELD]'] = '0'
sr['[DROP]'] = '6'
sr['[NO_OP]'] = '7'

for line in f_ac:
  if line == '# SEARCH AND REPLACE\n':
    found_sr = True
    break

if(found_sr):
  line = f_ac.next()
  while line != '\n':
    linetoks = line.split()
    sr[linetoks[1]] = linetoks[3]
    line = f_ac.next()

f_ac.seek(0)

for line in f_ac:
  if line[0] == '#' or line[0] == '\n':
    continue
  i = line.find('#')
  if i != -1:
    line = line[0:i]
    while line.endswith(' '):
      line = line[0:-1]
    line += '\n'
  for key in sr.keys():
    line = line.replace(key, sr[key])
  f_c.write(line)

f_c.close()
f_ac.close()
