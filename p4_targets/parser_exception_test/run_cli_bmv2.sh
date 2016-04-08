#!/bin/bash

THIS_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

source $THIS_DIR/../../env.sh

PROJ=${PWD##*/}

CLI_PATH=$BMV2_PATH/targets/simple_switch/sswitch_CLI

#JSON argument
JS=

#Thrift port argument
TP=

ARG1=$1

if [ "$#" -gt "0" ]; then
  if [[ $ARG1 == p4f ]]; then
    BMV2_PATH=$THIS_DIR/../p4factory/submodules/bm
    CLI_PATH=$BMV2_PATH/targets/simple_switch/runtime_CLI
    JS="--json"
    TP="--thrift-port"
    ARG1=$2
  fi
fi

$CLI_PATH $JS $PROJ.json $TP $ARG1
