#!/usr/bin/python

import sys

def mysum(a, b, c, current, target, count):
  if current == target:
    return count
  elif current > target:
    return 1000
  else:
    opt_a = mysum(a, b, c, current + a, target, count + 1)
    opt_b = mysum(a, b, c, current + b, target, count + 1)
    opt_c = mysum(a, b, c, current + c, target, count + 1)
    return min(opt_a, opt_b, opt_c)

def search(rng):
  solution = []
  best = 1000
  j = 1
  for k in range(2, rng):
    print("k: %d" % k)
    for l in range(k+1, rng+1):
      vals = []
      for i in range(1, rng + 1):
        vals.append(mysum(j, k, l, 0, i, 0))
      #score = sum(vals) / float(len(vals))
      score = max(vals)
      if score < best:
        solution = [j, k, l, score]
        best = score
        #print("new best with %d, %d, %d: %f" % (j, k, l, score))
  return solution

t = 25
print(("Solution for %d: " + str(search(t))) % t)
