#!/usr/bin/python

import csv
import argparse

parser = argparse.ArgumentParser(description='HP4 LoC Reporter')
parser.add_argument('--numstages', help='Max number of match-action stages',
                    type=int, action="store", default=5)
parser.add_argument('--numprimitives', help='Max number of primitives per compound action',
                    type=int, action="store", default=9)

args = parser.parse_args()

r = open('results_prims.csv', 'w')
writer = csv.writer(r)
headerrow = []
for i in range(1, args.numstages + 1):
  toappend = str(i) + " stage"
  if i > 1:
    toappend += "s"
  headerrow.append(toappend)
writer.writerow(headerrow)

for npps in range(1, args.numprimitives + 1):
  nppslist = []
  for ns in range(1, args.numstages + 1):
    total = 0
    fname = './config_' + str(ns) + str(npps) + '/results_byfile.csv'
    f = open(fname, 'r')
    reader = csv.reader(f)
    reader.next()
    # modify_field
    total += int(reader.next()[4])
    for i in range(4):
      reader.next()
    # add_header
    total += int(reader.next()[4])
    # add_to_field
    total += int(reader.next()[4])
    for i in range(4):
      reader.next()
    # truncate
    total += int(reader.next()[4])
    # drop
    total += int(reader.next()[4])
    avg = float(total) / 5.0
    nppslist.append(avg)
    f.close()
  writer.writerow(nppslist)

r.close()
