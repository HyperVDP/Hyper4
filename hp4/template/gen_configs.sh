#!/bin/bash

for i in `seq 1 $2`;
do
  for j in `seq 1 $1`;
  do
    rm -rf ../p4src/config_$j$i
    mkdir ../p4src/config_$j$i
    mkdir ../p4src/config_$j$i/includes
    ./hp4_template.py --numstages $j --numprimitives $i --test $j$i
    cloc ../p4src/config_$j$i/ --force-lang="C",p4 --report-file=../p4src/config_$j$i/results_byfile.csv --csv --by-file
    cloc ../p4src/config_$j$i/ --force-lang="C",p4 --report-file=../p4src/config_$j$i/results_sum.csv --csv
  done
done
