/*
David Hancock
FLUX Research Group
University of Utah
dhancock@cs.utah.edu

HyPer4: A P4 Program to Run Other P4 Programs

add_header.p4: Carry out the add_header primitive
*/

action a_addh(sz, offset, msk, vbits) {
  modify_field(extracted.dcpy, extracted.data);
  modify_field(extracted.data, extracted.data >> (sz*8));
  modify_field(extracted.data, 0, msk);
  modify_field(extracted.data, extracted.dcpy, (~msk >> (32 - (offset*8))) << (32 - (offset*8)));
  modify_field(parse_ctrl.numbytes, parse_ctrl.numbytes + sz);
  modify_field(extracted.validbits, extracted.validbits | vbits);
}

table t_addh_11 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_addh;
  }
}

table t_addh_12 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_addh;
  }
}

table t_addh_13 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_addh;
  }
}

table t_addh_21 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_addh;
  }
}

table t_addh_22 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_addh;
  }
}

table t_addh_23 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_addh;
  }
}

table t_addh_31 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_addh;
  }
}

table t_addh_32 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_addh;
  }
}

table t_addh_33 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_addh;
  }
}

control do_add_header_11 {
  apply(t_addh_11);
}

control do_add_header_12 {
  apply(t_addh_12);
}

control do_add_header_13 {
  apply(t_addh_13);
}

control do_add_header_21 {
  apply(t_addh_21);
}

control do_add_header_22 {
  apply(t_addh_22);
}

control do_add_header_23 {
  apply(t_addh_23);
}

control do_add_header_31 {
  apply(t_addh_31);
}

control do_add_header_32 {
  apply(t_addh_32);
}

control do_add_header_33 {
  apply(t_addh_33);
}

