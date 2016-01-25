// Surprisingly, we can bitshift with the right operand being an action
// parameter.  Not sure this will be supported broadly - need to check
// the language spec.

header_type tmeta_t {
  fields {
    data : 32;
    check : 32;
  }
}

metadata tmeta_t tmeta;

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

action a_isolate(leftshift, rightshift) {
  modify_field(tmeta.check, tmeta.data);
  modify_field(tmeta.check, tmeta.check << leftshift);
  modify_field(tmeta.check, tmeta.check >> rightshift);
}

table isolate {
  actions {
    a_isolate;
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
  apply(isolate);
  apply(check_tmeta);
}

control egress {
}
