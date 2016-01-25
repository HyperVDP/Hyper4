header_type tmeta_t {
  fields {
    data : 32;
    check : 32;
  }
}

header_type h_t {
  fields {
    data : 8;
  }
}

metadata tmeta_t tmeta;
header h_t h[4];

parser start {
  return ingress;
}

action set_egress(port) {
  modify_field(standard_metadata.egress_spec, port);
}

table forward {
  reads {
    standard_metadata.ingress_port : exact;
  }
  actions {
    set_egress;
  }
}

action a_set_tmeta(val1, val2, val3, val4, m1, m2, m3, m4) {
  modify_field(tmeta.data, (tmeta.data & ~m1) | (val1 & m1));
  modify_field(tmeta.data, (tmeta.data & ~m2) | (val2 & m2));
  modify_field(tmeta.data, (tmeta.data & ~m3) | (val3 & m3));
  modify_field(tmeta.data, (tmeta.data & ~m4) | (val4 & m4));
}

table set_tmeta {
  actions {
    a_set_tmeta;
  }
}

/*
table_add check_tmeta _no_op 0xbb =>
table_set_default pushpop a_pushpop 1 3
*/

// push is like <<; pop is like >>
action a_pushpop(pushcount, popcount) {
  add_header(h[0]);
  add_header(h[1]);
  add_header(h[2]);
  add_header(h[3]);
  modify_field(h[0].data, tmeta.data & 0x000000FF);
  modify_field(h[1].data, (tmeta.data & 0x0000FF00) >> 8);
  modify_field(h[2].data, (tmeta.data & 0x00FF0000) >> 16);
  modify_field(h[3].data, (tmeta.data & 0xFF000000) >> 24);
  //push(h, pushcount);
  pop(h, popcount);
  //modify_field(tmeta.check, h[2].data);
  add_to_field(tmeta.check, h[0].data);
  add_to_field(tmeta.check, h[1].data << 8);
  add_to_field(tmeta.check, h[2].data << 16);
  add_to_field(tmeta.check, h[3].data << 24);
}

table pushpop {
  actions {
    a_pushpop;
  }
}

action _no_op(){
  no_op();
}

action _drop() {
  drop();
}

table check_tmeta {
  reads {
    tmeta.check : exact;
  }
  actions {
    _no_op;
    _drop;
  }
}

control ingress {
  apply(forward);
  apply(set_tmeta);
  apply(pushpop);
  apply(check_tmeta);
}

control egress {
}
