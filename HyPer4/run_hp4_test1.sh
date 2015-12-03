#!/bin/sh

sudo python ~/p4factory/submodules/bm/mininet/1sw_demo.py \
  --behavioral-exe ~/p4factory/submodules/bm/targets/simple_switch/simple_switch \
  --json ~/Documents/p4-hypervisor/src/hp4_test1.json
