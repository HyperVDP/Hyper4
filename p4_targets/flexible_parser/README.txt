FLEXIBLE PARSER

The flexible parser project implements runtime programmable parsing in P4.
It extracts X bytes by default.  Y bytes may be extracted, where Y > X,
either as a static policy or as a result of values found in already-extracted
bytes, and this process may be repeated multiple times, up to Z maximum bytes.
That is, after extracting Y bytes, the flexible parser can be instructed to
then extract Y' bytes where Y' > Y, and subsequently Y'' where Y'' > Y', etc.

X and Z can be changed at code generation time (not yet implemented; currently,
X = 20, Z = 100).  Y, Y', Y'', etc., are provided by the user at runtime.

The parse_ctrl metadata object has the following fields:
- numbytes: used to indicate how many bytes to extract the next time the
  packet is resubmitted to the parser, or indicates how many bytes were
  extracted when no resubmission is pending.
- state: this can be used in any way necessary, but the typical case is
  to distinguish the state of extraction in terms of the specific set
  of headers that have been extracted.  A sensible practice is to use the
  left-most digit (or digits) to indicate the type of a lower-layer header
  present, and each digit (or group of digits) to the right of that
  identifies the next higher-layer header type present.  For example, if
  the user is working with the traditional protocol stack, s/he might
  define states like this:
    1: IPv4
    2: IPv6
    11: IPv4-ICMP
    12: IPv4-UDP
    13: IPv4-TCP
    131: IPv4-TCP-HTTP
    21: IPv6-ICMPv6
    22: IPv6-UDP
    221: IPv6-UDP-MDNS
- next_action: indicates what the flexible parser should do next as a result
  of a table hit in one of the match tables used to inspect packet values.

The user can program the tables to support any of the following use cases:
1. Standard extraction (e.g., 20 bytes) is sufficient; the application
   does not need any more under any circumstances.
2. More than the default number of bytes are required, but the amount is
   predetermined / static / does not depend on anything to be found in
   the default bytes extracted from the packet.
3. Inspecting the default bytes extracted may determine that more bytes
   should be extracted.
4. Inspecting a part of the packet beyond the default bytes extracted is
   necessary to determine whether more should be extracted (and how many).

Tests, in the form of bmv2 CLI commands, have been written for each use
case above and are named accordingly (e.g., test01.txt corresponds to
use case #1, etc.).
