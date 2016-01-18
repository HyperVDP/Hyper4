parser start {
  return ingress;
}

action a_trunc(val) {
    truncate(val);
}

table trunc {
    actions {
        a_trunc;
    }
}

action set_egr(port) {
  modify_field(standard_metadata.egress_port, port);
}

table fwd {
  actions {
    set_egr;
  }
}

control ingress {
//  apply(fwd);
}

control egress {
  apply(trunc);
}
