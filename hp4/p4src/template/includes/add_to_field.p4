/*
David Hancock
FLUX Research Group
University of Utah
dhancock@cs.utah.edu

HyPer4: A P4 Program to Run Other P4 Programs

add_to_field.p4: Implements HP4 support for adding to a field.  This is a
                 language spec v1.0.2 feature removed from v1.1.  For now,
                 it is still useful to help HP4 support v1.1's expressions.
*/

action a_add2f_extracted_const(val, leftshift, rightshift, emask) {
  modify_field(extracted.dcpy, (extracted.data << leftshift) >> rightshift);
  modify_field(extracted.dcpy, extracted.dcpy + val);
  modify_field(extracted.data, (extracted.data & ~emask) | ( ((extracted.dcpy << rightshift) >> leftshift) & emask));
}

table t_add_to_field_11 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.subtype : exact;
    meta_primitive_state.match_ID : exact;
  }
  actions {
    a_add2f_extracted_const;
  }
}

table t_add_to_field_12 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.subtype : exact;
    meta_primitive_state.match_ID : exact;
  }
  actions {
    a_add2f_extracted_const;
  }
}

table t_add_to_field_13 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.subtype : exact;
    meta_primitive_state.match_ID : exact;
  }
  actions {
    a_add2f_extracted_const;
  }
}

table t_add_to_field_21 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.subtype : exact;
    meta_primitive_state.match_ID : exact;
  }
  actions {
    a_add2f_extracted_const;
  }
}

table t_add_to_field_22 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.subtype : exact;
    meta_primitive_state.match_ID : exact;
  }
  actions {
    a_add2f_extracted_const;
  }
}

table t_add_to_field_23 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.subtype : exact;
    meta_primitive_state.match_ID : exact;
  }
  actions {
    a_add2f_extracted_const;
  }
}

table t_add_to_field_31 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.subtype : exact;
    meta_primitive_state.match_ID : exact;
  }
  actions {
    a_add2f_extracted_const;
  }
}

table t_add_to_field_32 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.subtype : exact;
    meta_primitive_state.match_ID : exact;
  }
  actions {
    a_add2f_extracted_const;
  }
}

table t_add_to_field_33 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.subtype : exact;
    meta_primitive_state.match_ID : exact;
  }
  actions {
    a_add2f_extracted_const;
  }
}

control do_add_to_field_11 {
  apply(t_add_to_field_11);
}

control do_add_to_field_12 {
  apply(t_add_to_field_12);
}

control do_add_to_field_13 {
  apply(t_add_to_field_13);
}

control do_add_to_field_21 {
  apply(t_add_to_field_21);
}

control do_add_to_field_22 {
  apply(t_add_to_field_22);
}

control do_add_to_field_23 {
  apply(t_add_to_field_23);
}

control do_add_to_field_31 {
  apply(t_add_to_field_31);
}

control do_add_to_field_32 {
  apply(t_add_to_field_32);
}

control do_add_to_field_33 {
  apply(t_add_to_field_33);
}