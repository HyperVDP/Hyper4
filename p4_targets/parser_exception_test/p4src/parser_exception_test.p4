header_type big_t {
  fields {
    data : 512;
  }
}

header_type small_t {
  fields {
    data : 32;
  }
}

header big_t big;
header small_t small;

parser start {
  extract(big);
  return ingress;
}

parser_exception p4_pe_out_of_packet {
  return ingress;
}

action _no_op() {
  no_op();
}

action _drop() {
  drop();
}

action a_set_egress(port) {
  modify_field(standard_metadata.egress_spec, port);
}

table set_egress {
  reads {
    standard_metadata.ingress_port : exact;
  }
  actions {
    a_set_egress;
  }
}

control ingress {
  apply(set_egress);
}
