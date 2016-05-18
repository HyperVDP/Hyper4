#!/bin/bash

# This file is a modification of the original run_switch.sh scripts
# in various projects under tutorials/examples/ in the tutorials
# repo at https://github.com/p4lang/tutorials.git
# Modified by David Hancock.  Original license notice:
#
# Copyright 2013-present Barefoot Networks, Inc. 
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

THIS_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# env.sh found two levels above project directory
source $THIS_DIR/../../env.sh
# note that the above command changes $THIS_DIR to the directory of env.sh

PROJ=${PWD##*/}

if [ "$#" -gt "0" ]; then
  if [[ $1 == p4f ]]; then
    BMV2_PATH=$THIS_DIR/../p4factory/submodules/bm
    P4C_BM_PATH=$THIS_DIR/../p4factory/submodules/p4c-bm
  fi
fi

CLI_PATH=$BMV2_PATH/targets/simple_switch/sswitch_CLI

P4C_BM_SCRIPT=$P4C_BM_PATH/p4c_bm/__main__.py

SWITCH_PATH=$BMV2_PATH/targets/simple_switch/simple_switch

$P4C_BM_SCRIPT p4src/$PROJ.p4 --json $PROJ.json
sudo PYTHONPATH=$PYTHONPATH:$BMV2_PATH/mininet/ \
    python $THIS_DIR/mininet/topo.py \
    --behavioral-exe $SWITCH_PATH \
    --json $PROJ.json \
    --cli $CLI_PATH
