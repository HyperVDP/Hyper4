header_type hp4test_t {
  fields {
    preamble : 64;
  }
}

header_type msg_t {
  fields {
    letter1 : 8;
    letter2 : 8;
    letter3 : 8;
    letter4 : 8;
  }
}

parser start {
  return select(current(0, 64)) {
    0 : parse_head;
    default : ingress;
  }
}

header hp4test_t hp4test;
header msg_t msg;

parser parse_head {
  extract(hp4test);
  extract(msg);
  return ingress;
}

action a_mod_msg(p) {
  modify_field(standard_metadata.egress_spec, p);
  modify_field(msg.letter2, 0x75);
  modify_field(msg.letter3, 0x72);
}

action _drop() {
  drop();
}

table mod_msg {
  reads {
    msg : valid;
    standard_metadata.ingress_port : exact;
  }
  actions {
    a_mod_msg;
    _drop;
  }
}


control ingress {
  apply(mod_msg);
}

control egress {
}
