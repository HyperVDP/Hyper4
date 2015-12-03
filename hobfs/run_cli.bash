#!/bin/bash

SCRIPT="../../cli/pd_cli.py"
OPTS="-p hobfs -i p4_pd_rpc.hobfs -s $PWD/tests/pd_thrift:$PWD/../../testutils -c localhost:"
A="0"

if [ $1 = "1" ];
then
  A="22222"
else if [ $1 = "2" ];
    then A="33333"
  else
    echo usage: $0 "<1|2>"
    exit
  fi
fi
python $SCRIPT $OPTS$A
