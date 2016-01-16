#!/bin/bash

SCRIPT="../../cli/pd_cli.py"
OPTS="-p passthrough -i p4_pd_rpc.passthrough -s $PWD/tests/pd_thrift:$PWD/../../testutils -c localhost:"

python $SCRIPT $OPTS$1
