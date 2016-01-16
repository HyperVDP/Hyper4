#!/bin/bash

THIS_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

NANO_PATH=$THIS_DIR/../tools/nanomsg_client.py

PROJ=${PWD##*/}

sudo $NANO_PATH --json $PROJ.json --socket ipc:///tmp/bm-0-log.ipc
