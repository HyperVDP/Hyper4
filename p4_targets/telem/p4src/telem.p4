header_type mdata_t {
  fields {
    preamble : 64;
    ingress : 8;
  }
}

header mdata_t mdata;

parser start {
  return select(current(0, 64)) {
    0: parse_head;
    default: ingress;
  }
}

parser parse_head {
  extract(mdata);
  return ingress;
}

action set_egr(egress_spec) {
    modify_field(mdata.ingress, standard_metadata.ingress_port);
    modify_field(standard_metadata.egress_spec, egress_spec);
}

table forward {
    reads {
        standard_metadata.ingress_port : exact;
    }
    actions {
        set_egr;
    }
}

control ingress {
    apply(forward);
}

control egress {
}
