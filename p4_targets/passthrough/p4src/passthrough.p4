header_type extracted_t {
  fields {
    data : 96;
  }
}

header extracted_t extracted;

parser start {
  extract(extracted);
  return ingress;
}

action _no_op() {
}

table test {
  reads {
    extracted.data : exact;
  }
  actions {
    _no_op;
  }
}

action set_egr(egress_spec) {
    modify_field(standard_metadata.egress_spec, egress_spec);
}

table fwd {
    reads {
        standard_metadata.ingress_port : exact;
    }
    actions {
        set_egr;
    }
}

control ingress {
    apply(test);
    apply(fwd);
}

control egress {
}
