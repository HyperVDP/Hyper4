// header_test:  what is neat about this test is that it shows we can use
//  header stacks instead of metadata for internal packet processing purposes,
//  and header stacks are arrays, where metadata cannot be used as arrays.
// UPDATE: NOT SO FAST - header stacks are actually not terribly useful for
//  this purpose because we can only use constants and 'last' as indices.
// Demo that bitshift is allowed.

header_type h_t {
  fields {
    data : 8;
  }
}

header_type tmeta_t {
  fields {
    data : 8;
  }
}

header h_t h[20];
metadata tmeta_t tmeta;

parser start {
  return ingress;
}

action a_set_tmeta(val1, val2) {
  add(tmeta.data, val1 << 4, val2);
}

table set_tmeta {
  actions {
    a_set_tmeta;
  }
}

action a_set_header(port) {
  add_header(h[0]);
  modify_field(h[0].data, port);
}

table set_header {
  reads {
    standard_metadata.ingress_port : exact;
  }
  actions {
    a_set_header;
  }
}

action _no_op() {
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

action a_set_egress() {
  modify_field(standard_metadata.egress_spec, h[0].data);
  remove_header(h[0]);
}

table set_egress {
  actions {
    a_set_egress;
  }
}

control ingress {
  apply(set_tmeta);
  apply(set_header);
  apply(set_egress);
  apply(check_tmeta);
}
