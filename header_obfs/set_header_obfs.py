#!/usr/bin/python

import numpy as np
import os
import sys

seed = None

if len(sys.argv) > 1:
  seed = int(sys.argv[1])
  print("beep!  seed = %i" % seed)

np.random.seed(seed)
perm = np.random.permutation(14)

outstr = "python ../../cli/pd_cli.py -p header_obfs -i p4_pd_rpc.header_obfs -s $PWD/tests/pd_thrift:$PWD/../../testutils -m \"add_entry obfsl2 1 a_obfsl2"

for x in perm:
  outstr += " " + str(x)

outstr += "\" -c localhost:22222"

print(outstr)

os.system(outstr)
