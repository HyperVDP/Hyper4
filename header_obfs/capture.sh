#!/bin/sh

prefix='run'
dash='-'
ext='.pcap'
switch='s1'
iface1='eth1'
iface2='eth2'

tcpdump -w $prefix$1$dash$iface1$ext -c 12 -i $switch$dash$iface1 "not arp && not udp && not ip6" &
tcpdump -w $prefix$1$dash$iface2$ext -c 12 -i $switch$dash$iface2 "not arp && not udp && not ip6" &
