//#include "headers.p4"
//#include "parser.p4"

register parse_width {
  width : 14;
  instance_count : 1;
}

header_type local_metadata_t {
  fields {
    parse_width : 14;
    data : 768;
  }
}

header_type bitfield_256_t {
  fields {
    data : 256;
  }
}

header_type bitfield_512_t {
  fields {
    data : 512;
  }
}

header_type bitfield_768_t {
  fields {
    data : 768;
  }
}

header bitfield_256_t bitfield_256;
header bitfield_512_t bitfield_512;
header bitfield_768_t bifield_768;

metadata local_metadata_t local_metadata;

// challenge is to selectively parse according to currently desired number of bits
//  can't declare register with default initial value
//  parsers can only extract or set_metadata, and set_metadata doesn't work on registers
//  we might assume that registers are set to 0 when declared
//  selecting on the register value tells us whether it has been initialized
//  if 0, go initialize it; requires detour into control -> table -> default action -> resubmit
// in fact this approach won't work because we can't select on a register, and the only way to
//  set a metadata field is after parsing, and we could do that but then we'd have to resubmit
//  every single packet always.  Gross.  Perhaps we should abandon any attempt to parse at all
//  and simply use current(const, const).  But that doesn't work either because we need to use
//  variables, not consts.
// you know what?  skip parsing altogether.  current(const, const) actually will work - we just
//  have like, three of them (e.g. current(0, 256) | current(0, 512) | current(0, 768)) and we
//  select the appropriate one to use according to the register field set by the initialization
//  process.
// this doesn't work, though.  current can only be used in a parser function.  The only way
//  to get at packet data is during parsing, whether we extract or use set_metadata.  This
//  means HyPer4 will have to use resubmit on every packet always (gross, but necessary).

parser start {
  return select( local_metadata.parse_width ) {
    0 : c_packet_init;
    256 : parse_256;
    512 : parse_512;
    768 : parse_768;
  }
}

parser parse_256 {
  extract(bitfield_256);
  return main;
}

parser parse_512 {
  extract(bitfield_512);
  return main;
}

parser parse_768 {
  extract(bitfield_768);
  return main;
}

// initialize the switch
action sw_init(pw) {
  register_write(parse_width, 0, pw);
}

// Set local_metadata as necessary
//action normal() {
//  register_read(local_metadata.parse_width, parse_width, 0);
//}

action _no_op() {
  no_op();
}

table switch_init {
  actions {
    sw_init; // <- set as default when necessary; parameters:
    _no_op;
  }
}

// initialize local metadata for packet processing
table packet_init {
  actions {
  }
}

action a_t01_A(){
}

action a_t01_B(){
}

action a_t01_Z(){
}

table set_table_01 {
  actions {
    a_t01_A;
    a_t01_B;
    // ...
    a_t01_Z;
  }
}

table t_t01_A {
  reads { data : ternary; }
  actions { prep_complex; }
}

table t_t01_B {
}

table t_t01_Z {
}

control c_packet_init {
  apply(switch_init); // initialize switch?
  apply(packet_init);  
}

control main {
 // ... 
 apply(set_table_01) {
    t01_A { apply(t_t01_A); }
    t01_B { apply(t_t01_B); }
    t01_Z { apply(t_t01_Z); }
  }
}
