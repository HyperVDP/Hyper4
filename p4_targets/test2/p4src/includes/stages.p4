#include "action.p4"
#include "switch_primitivetype.p4"

table set_program_state_11 {
  reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    set_program_state; // match.p4
  }
}

table set_program_state_12 {
  reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    set_program_state; // match.p4
  }
}

table set_program_state_13 {
  reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    set_program_state; // match.p4
  }
}

control stage1 {
  match_1();

  apply(set_primitive_metadata_11);

  switch_primitivetype_11();

  apply(set_program_state_11);

  if(meta_ctrl.stage_state != COMPLETE) {
    apply(set_primitive_metadata_12); // action.p4
    switch_primitivetype_12();          // switch_primitivetype.p4
    apply(set_program_state_12);
    if(meta_ctrl.stage_state != COMPLETE) {
      apply(set_primitive_metadata_13); // action.p4
      switch_primitivetype_13();          // switch_primitivetype.p4
      apply(set_program_state_13);
      // ...
    }
  }
}
