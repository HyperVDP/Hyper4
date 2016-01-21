// header_test:  what is neat about this test is that it shows we can use
//  header stacks instead of metadata for internal packet processing purposes,
//  and header stacks are arrays, while metadata cannot be used as arrays.

header_type h_t {
  fields {
    data : 8;
  }
}

header h_t h[20];

parser start {
  return ingress;
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
  apply(set_header);
  apply(set_egress);
}
