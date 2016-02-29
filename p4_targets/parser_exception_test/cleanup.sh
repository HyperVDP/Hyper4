#!/bin/bash

sudo mn -c
sudo killall lt-simple_switch
redis-cli FLUSHALL
