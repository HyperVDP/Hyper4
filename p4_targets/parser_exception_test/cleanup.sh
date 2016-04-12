#!/bin/bash

sudo mn -c
sudo pkill -f 'simple_switch'
redis-cli FLUSHALL
