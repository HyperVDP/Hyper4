#include "match.p4"
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

table set_program_state_12 { reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact; }
  actions { set_program_state; } }
table set_program_state_13 { reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact; }
  actions { set_program_state; } }

table set_program_state_21 { reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact; }
  actions { set_program_state; } }
table set_program_state_22 { reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact; }
  actions { set_program_state; } }
table set_program_state_23 { reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact; }
  actions { set_program_state; } }

table set_program_state_31 { reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact; }
  actions { set_program_state; } }
table set_program_state_32 { reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact; }
  actions { set_program_state; } }
table set_program_state_33 { reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact; }
  actions { set_program_state; } }

control stage1 {
  match_1(); // match.p4

  // set primitive meta data
  apply(set_primitive_metadata_11); // action.p4

  // divert control flow based on primitive type
  switch_primitivetype_11(); // switch_primitivetype.p4

  // set program state using current state
  apply(set_program_state_11);

  // next primitive
  if(meta_ctrl.stage_state != COMPLETE) { // conditional_node 14
    // set primitive meta data
    apply(set_primitive_metadata_12); // action.p4
    switch_primitivetype_12();          // switch_primitivetype.p4
    apply(set_program_state_12);
    if(meta_ctrl.stage_state != COMPLETE) { // conditional_node 
      apply(set_primitive_metadata_13); // action.p4
      switch_primitivetype_13();          // switch_primitivetype.p4
      apply(set_program_state_13);
      // ...
    }
  }
}

control stage2 {
  match_2(); // match.p4

  apply(set_primitive_metadata_21);  // action.p4
  switch_primitivetype_21();           // switch_primitivetype.p4
  apply(set_program_state_21);

  // next primitive
  if(meta_ctrl.stage_state != COMPLETE) {
    // set primitive meta data
    apply(set_primitive_metadata_22);  // action.p4
    switch_primitivetype_22();           // switch_primitivetype.p4
    apply(set_program_state_22);
    if(meta_ctrl.stage_state != COMPLETE) {
      apply(set_primitive_metadata_23);  // action.p4
      switch_primitivetype_23();           // switch_primitivetype.p4
      apply(set_program_state_23);
    }
  }
}

control stage3 {
  match_3(); // match.p4

  apply(set_primitive_metadata_31);
  switch_primitivetype_31();  // switch_primitivetype.p4
  apply(set_program_state_31);

  // next primitive
  if(meta_ctrl.stage_state != COMPLETE) {
    // set primitive meta data
    apply(set_primitive_metadata_32);
    switch_primitivetype_32();
    apply(set_program_state_32);
    if(meta_ctrl.stage_state != COMPLETE) {
      apply(set_primitive_metadata_33);
      switch_primitivetype_33();
      apply(set_program_state_33);
    }
  }
}
