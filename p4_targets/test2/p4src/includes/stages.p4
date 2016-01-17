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

control stage1 {
  match_1();

  apply(set_primitive_metadata_11);

  switch_primitivetype_11();

  apply(set_program_state_11);
  // either there is no way that meta_ctrl.stage_state can be altered before this line...
  if(meta_ctrl.stage_state != COMPLETE) { // or nothing that happens after is significant
    apply(set_program_state_12);
  }
}
