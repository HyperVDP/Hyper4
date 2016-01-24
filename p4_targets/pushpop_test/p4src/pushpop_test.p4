header_type tmeta_t {
  fields {
    data : 32;
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
  modify_field(tmeta.data, val1, m1);
  modify_field(tmeta.data, val2, m2);
  modify_field(tmeta.data, val3, m3);
  modify_field(tmeta.data, val4, m4);
}

table set_tmeta {
  actions {
    a_set_tmeta;
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
    tmeta.data : exact;
  }
  actions {
    _no_op;
    _drop;
  }
}

control ingress {
  apply(forward);
  apply(set_tmeta);
  apply(check_tmeta);
}

control egress {
}
