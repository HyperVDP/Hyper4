#!/bin/sh

./hobfs_ctrl.py --thrift-port 22222 --init
read -n 1 -s
./hobfs_ctrl.py -h
read -n 1 -s
./hobfs_ctrl.py --thrift-port 22222 --secure --dir 0 --seed 42 --period 2000 --length 14
