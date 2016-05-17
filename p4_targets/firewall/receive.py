from scapy.all import *

def handle_pkt(pkt):
"""
  These lines are an example of how we might filter out
  unwanted packets:

  pktstr = str(pkt)
  preamble = pktstr[:8]
  preamble_exp = "\x00" * 8
  if preamble != preamble_exp: return
"""
  hexdump(pkt)

sniff(iface = "eth0", prn = lambda x: handle_pkt(x))
