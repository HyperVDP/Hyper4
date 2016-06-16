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

DEMO_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# env.sh found two levels above project directory
source $DEMO_DIR/../../env.sh
# note that the above command changes $THIS_DIR to the directory of env.sh

if [ "$#" -gt "0" ]; then
  if [[ $1 == p4f ]]; then
    BMV2_PATH=$THIS_DIR/../p4factory/submodules/bm
    P4C_BM_PATH=$THIS_DIR/../p4factory/submodules/p4c-bm
  fi
fi

CLI_PATH=$BMV2_PATH/targets/simple_switch/sswitch_CLI

P4C_BM_SCRIPT=$P4C_BM_PATH/p4c_bm/__main__.py

SWITCH_PATH=$BMV2_PATH/targets/simple_switch/simple_switch

$P4C_BM_SCRIPT $DEMO_DIR/../hp4t_l2_switch/p4src/hp4t_l2_switch.p4 --json $DEMO_DIR/../hp4t_l2_switch/hp4t_l2_switch.json

$P4C_BM_SCRIPT $DEMO_DIR/../d1_C_s2_native/p4src/d1_C_s2_native.p4 --json $DEMO_DIR/../d1_C_s2_native/d1_C_s2_native.json

sudo PYTHONPATH=$PYTHONPATH:$BMV2_PATH/mininet/ \
    python $THIS_DIR/mininet/topo_mix.py \
    --behavioral-exe $SWITCH_PATH \
    --jsons $DEMO_DIR/../hp4t_l2_switch/hp4t_l2_switch.json \
      $DEMO_DIR/../d1_C_s2_native/d1_C_s2_native.json \
      $DEMO_DIR/../hp4t_l2_switch/hp4t_l2_switch.json \
    --cli $CLI_PATH \
    --commands commands_s1.txt commands_s2.txt commands_s3.txt

#sudo PYTHONPATH=$PYTHONPATH:$BMV2_PATH/mininet/ \
#    python $THIS_DIR/mininet/topo_mix.py \
#    --behavioral-exe $SWITCH_PATH \
#    --jsons $DEMO_DIR/../passthrough/passthrough.json \
#      $DEMO_DIR/../passthrough/passthrough.json \
#      $DEMO_DIR/../passthrough/passthrough.json \
#    --cli $CLI_PATH

