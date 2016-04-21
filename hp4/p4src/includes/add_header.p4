action a_addh_prep(remaining) {
  modify_field(meta_primitive_state.hmanip_remaining, remaining);
}

table t_addh_prep_XY { actions { a_addh_prep; }}

action a_add_header_00_1() {
  add_header(ext[0]);
}

action a_add_header_00_4() {
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
}

action a_add_header_00_20() {
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
}

action a_add_header_01_1() {
  add_header(ext[1]);
}

action a_add_header_01_4() {
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
}

action a_add_header_01_20() {
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
}

table t_add_header_XY_1 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_add_header_00_1;
    a_add_header_00_4;
    a_add_header_00_20;
    a_add_header_01_1;
    a_add_header_01_4;
    a_add_header_01_20;
    // etc. but use action profile
  }
}

control do_add_header_XY {
  apply(t_addh_prep_XY);
  apply(t_add_header_XY_1);
  if (meta_primitive_state.hmanip_remaining > 0) {
    apply(t_add_header_XY_2);
    if (meta_primitive_state.hmanip_remaining > 0) {
      apply(t_add_header_XY_3);
      // etc.
    }
  }
}
