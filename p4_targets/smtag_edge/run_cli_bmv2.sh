#!/bin/bash

THIS_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

source $THIS_DIR/../../env.sh

PROJ=${PWD##*/}

ARG1=$1

if [ "$#" -gt "0" ]; then
  if [[ $ARG1 == p4f ]]; then
    BMV2_PATH=$THIS_DIR/../p4factory/submodules/bm
    ARG1=$2
  fi
fi

CLI_PATH=$BMV2_PATH/targets/simple_switch/sswitch_CLI

$CLI_PATH $PROJ.json $ARG1
