header_type HyPer4Test_t {
  fields {
    preamble : 64;
  }
}

header_type msg_t {
  fields {
    letter : 8;
  }
}

header HyPer4Test_t HyPer4Test;
header msg_t msg[4];

parser start {
  return select(current(0, 64)) {
    0 : parse_head;
    default : ingress;
  }
}

parser parse_head {
  extract(HyPer4Test);
  return parse_msg;
}

parser parse_msg {
  extract(msg[next]);
  extract(msg[next]);
  extract(msg[next]);
  extract(msg[next]);
  return ingress;
}

action a_mod_msg() {
  modify_field(standard_metadata.egress_spec, 2);
  modify_field(msg[1].letter, 0x75);
  modify_field(msg[2].letter, 0x72);
}

action _drop() {
  drop();
}

table mod_msg {
  reads {
    msg[3] : valid;
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
