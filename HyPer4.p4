//#include "headers.p4"
//#include "parser.p4"

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

register myreg {
  width : 14;
  instance_count : 1;
}

header_type local_metadata_t {
  fields {
    parse_width : 14;
  }
}

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

parser start {
  set_metadata(local_metadata.parse_width, 0);
  return select(local_metadata.parse_width) { 
    0 : c_initialize;
    256 : parse256;
    512 : parse512;
  }
}

header bitfield_256_t bitfield_256;
header bitfield_512_t bitfield_512;
header bitfield_768_t bitfield_768;

parser parse256 {
  extract(bitfield_256);
  return main;
}

parser parse512 {
  extract(bitfield_512);
  return main;
}

parser parse768 {
  extract(bitfield_768);
  return main;
}

action a_initialize() {
  modify_field(myreg[0], 0);
  // what else?
}

table t_initialize {
  actions {
    a_initialize;
  }
}

action a_resubmit() {
  resubmit();
}

table t_resubmit {
  actions {
    a_resubmit;
  }
}

control c_initialize {
  apply(t_initialize);
  apply(t_resubmit);
}

control main {
}
