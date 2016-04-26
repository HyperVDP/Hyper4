header_type ext_t {
  fields {
    data : 8;
  }
}

header ext_t ext[2];
header ext_t ext_cpy[2];

parser start {
  extract(ext[next]);
  extract(ext[next]);
  return ingress;
}

action a_mod_extracted(val0, val1) {
  modify_field(ext[0].data, val0);
  modify_field(ext[1].data, val1);
}

table t_mod_extracted {
  actions {
    a_mod_extracted;
  }
}

action _no_op() {
}

table check_ext_values {
  reads {
    ext[0].data : exact;
    ext[1].data : exact;
  }
  actions {
    _no_op;
  }
}

action a_allocate_and_init_ext_cpy() {
  push(ext_cpy, 1);
  modify_field(ext_cpy[0].data, 0xCC);
  // this should not work because the dest field's parent header is invalid:
  modify_field(ext_cpy[1].data, 0xDD);
}

table t_allocate_and_init_ext_cpy {
  actions {
    a_allocate_and_init_ext_cpy;
  }
}

table check_ext_cpy_validity {
  reads {
    ext_cpy[0] : valid;
    ext_cpy[1] : valid;
  }
  actions {
    _no_op;
  }
}

table check_ext_cpy_values {
  reads {
    ext_cpy[0].data : exact;
    ext_cpy[1].data : exact;
  }
  actions {
    _no_op;
  }
}

action a_copy_from_ext_cpy_to_ext() {
  //modify_field(ext[0].data, ext_cpy[0].data);
  //modify_field(ext[1].data, ext_cpy[1].data);
  modify_field(ext[0].data, 0);
  modify_field(ext[1].data, 0);
  add_to_field(ext[0].data, ext_cpy[0].data);
  add_to_field(ext[1].data, ext_cpy[1].data);
}

table t_copy_from_ext_cpy_to_ext {
  actions {
    a_copy_from_ext_cpy_to_ext;
  }
}

table check_ext_final {
  reads {
    ext[0].data : exact;
    ext[1].data : exact;
  }
  actions {
    _no_op;
  }
}

control ingress {
  // overwrite the two extracted bytes, e.g., with 0xAA and 0xBB:
  apply(t_mod_extracted);

  // make sure the values (e.g., 0xAA and 0xBB) were written:
  apply(check_ext_values); 
  // RESULT: behaves as expected

  // push a single element into ext_cpy, attempt to write 0xCC to the first
  // element's data field, and 0xDD to the second element's data field:
  apply(t_allocate_and_init_ext_cpy);

  // examine validity of the two-element ext_cpy header stack, expecting that
  // the first element is valid and the second is invalid:
  apply(check_ext_cpy_validity);
  // RESULT: behaves as expected; only first element is valid

  // examine the values in the data fields of ext_cpy elements:
  apply(check_ext_cpy_values);
  // RESULT: seemingly behaves as expected (matches on ext[0].data == 0xCC,
  // ext[1].data == 0x00), but the match result may be misleading as it appears
  // from later tests that ext[1].data in fact == 0xDD, but likely matches on
  // 0x00 because ext[1] is invalid

  // use modify_field to copy the values in ext_cpy's element's data fields to
  // ext's element's data fields:
  apply(t_copy_from_ext_cpy_to_ext);

  // examine the values of the data fields of ext's elements:
  apply(check_ext_final);
  // RESULT: does not behave as expected:
  // modify_field(ext[1].data, ext_cpy[1].data) should not have taken effect
  // because ext_cpy[1] is invalid.  FURTHERMORE we discover that the
  // modify_field(ext_cpy[1].data, 0xDD) in a_allocate_and_init_ext_cpy took
  // effect even though ext_cpy[1] is invalid.

  // CONCLUSION:
  //  modify_field proceeds even when the source field's parent header is invalid;
  //  modify_field proceeds even when the dest field's parent header is invalid.
}
