// Demo range bug

header_type tmeta_t {
  fields {
    data : 8;
  }
}

header_type extracted_t {
  fields {
    data : 8;
  }
}

header extracted_t extracted;
metadata tmeta_t tmeta;

parser start {
  extract(extracted);
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

action a_set_tmeta(val) {
  modify_field(tmeta.data, val);
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

table check_extracted {
  reads {
    extracted.data : exact;
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
  apply(check_extracted);
}

control egress {
}
