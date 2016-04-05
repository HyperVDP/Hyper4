/*
This test examines the result of modify_field(X, Y) and modify_field(Y, X) when
X is wider than Y
*/

header_type extracted_t {
  fields {
    data : 256;
  }
}

header_type meta_t {
  fields {
    data : 768;
  }
}

header extracted_t extracted;
metadata meta_t meta;

parser start {
  extract(extracted);
  return ingress;
}

action a_cpy() {
  modify_field(meta.data, extracted.data);
}

table t_cpy {
  actions {
    a_cpy;
  }
}

action a_erase_extracted() {
  modify_field(extracted.data, 0);
}

table t_erase_extracted {
  actions {
    a_erase_extracted;
  }
}
/*
action a_mod(msk, val) {
  modify_field(meta.data, (meta.data & ~msk) | (val & msk));
}

table t_mod {
  actions {
    a_mod;
  }
}
*/

action a_fwd(port) {
  modify_field(standard_metadata.egress_spec, port);
}

table t_fwd {
  reads {
    standard_metadata.ingress_port : exact;
  }
  actions {
    a_fwd;
  }
}

action _no_op() {
}

/*
table t_inspect_meta {
  reads {
    meta.data : exact;
  }
  actions {
    _no_op;
  }
}
*/

control ingress {
  apply(t_cpy);
  apply(t_erase_extracted);

  // debug; technique is supplying test match entries via commands.txt, then
  //        examining nano output to see which entry caused a TABLE_HIT (or
  //        look for TABLE_MISS)
  //apply(t_inspect_meta);

//  apply(t_mod);
  apply(t_fwd);
}

action a_prep_deparse() {
  modify_field(extracted.data, meta.data);
}

table t_prep_deparse {
  actions {
    a_prep_deparse;
  }
}

/*
table t_inspect_meta_2 {
  reads {
    meta.data : exact;
  }
  actions {
    _no_op;
  }
}
*/
table t_inspect_extracted {
  reads {
    extracted.data : exact;
  }
  actions {
    _no_op;
  }
}


control egress {
  apply(t_inspect_extracted);
  apply(t_prep_deparse);
//  apply(t_inspect_meta_2);
//  apply(t_inspect_extracted);
}
