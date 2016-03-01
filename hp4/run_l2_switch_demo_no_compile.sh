#!/bin/bash

# Execute L2 switch demo without first compiling the .json
# This allows testing of the .json produced by compiling the source
#  code produced by the template-based scripts

THIS_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

source $THIS_DIR/../env.sh

SWITCH_PATH=$BMV2_PATH/targets/simple_switch/simple_switch

CLI_PATH=$BMV2_PATH/targets/simple_switch/sswitch_CLI

sudo PYTHONPATH=$PYTHONPATH:$BMV2_PATH/mininet/ \
    python $THIS_DIR/mininet/topo.py \
    --behavioral-exe $BMV2_PATH/targets/simple_switch/simple_switch \
    --json hp4.json \
    --cli $CLI_PATH \
    --commands $THIS_DIR/hp4/targets/hp4t_l2_switch/commands.txt
