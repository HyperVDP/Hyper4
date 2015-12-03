#!/bin/sh

prefix='run'
dash='-'
ext='.pcap'
switch=$1
iface1='eth1'
iface2='eth2'

tcpdump -w $prefix$2$dash$iface1$ext -i $switch$dash$iface1 &
tcpdump -w $prefix$2$dash$iface2$ext -i $switch$dash$iface2 &
