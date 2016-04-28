/*
add_header implementation test
*/

header_type ext_t {
  fields {
    data : 8;
  }
}

header_type meta_ctrl_t {
  fields {
    program : 8;
  }
}

header_type meta_primitive_state_t {
  fields {
    action_ID : 8;
    primitive_index : 8;
    hmanip_remaining : 8;
  }
}

header ext_t ext[100];
metadata meta_ctrl_t meta_ctrl;
metadata meta_primitive_state_t meta_primitive_state;

parser start {
  return ingress;
}

action a_addh_prep(remaining) {
  modify_field(meta_primitive_state.hmanip_remaining, remaining);
}

table t_addh_prep_XY {
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

action_profile acts {
  actions {
    a_add_header_00_1;
    a_add_header_00_4;
    a_add_header_00_20;
  }
}

table t_add_header_XY_1 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : acts;
}

control do_add_header_X_Y {
  apply(t_addh_prep_XY);
  apply(t_add_header_XY_1);
}

control ingress {
  do_add_header_X_Y();
}
