parser start {
  return ingress;
}

action set_brp(egress_spec) {
    modify_field(standard_metadata.egress_spec, egress_spec);
}

table fwd {
    reads {
        standard_metadata.ingress_port : exact;
    }
    actions {
        set_brp;
    }
}

control ingress {
    apply(fwd);
}

control egress {
}
