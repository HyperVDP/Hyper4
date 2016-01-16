#!/bin/bash

SCRIPT="../../cli/pd_cli.py"
OPTS="-p hobfs -i p4_pd_rpc.hobfs -s $PWD/tests/pd_thrift:$PWD/../../testutils -c localhost:"

python $SCRIPT $OPTS$1
