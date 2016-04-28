action a_addh_prep(remaining) {
  modify_field(meta_primitive_state.hmanip_remaining, remaining);
}

table t_addh_prep_11 {
  reads {
    meta_ctrl.program : exact;
  }
  actions {
    a_addh_prep;
  }
}

action a_add_header_00_1() {
  add_header(ext[0]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_00_4() {
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
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
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_01_1() {
  add_header(ext[1]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_01_4() {
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
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
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action_profile addhs {
  actions {
    a_add_header_00_1;
    a_add_header_00_4;
    a_add_header_00_20;
    a_add_header_01_1;
    a_add_header_01_4;
    a_add_header_01_20;
  }
}

table t_add_header_11_1 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_11_2 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_11_3 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

control do_add_header_11 {
  apply(t_addh_prep_11);
  apply(t_add_header_11_1);
  if (meta_primitive_state.hmanip_remaining > 0) {
    apply(t_add_header_11_2);
    if (meta_primitive_state.hmanip_remaining > 0) {
      apply(t_add_header_11_3);
      // etc.
    }
  }
}
