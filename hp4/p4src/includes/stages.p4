/*
David Hancock
FLUX Research Group
University of Utah
dhancock@cs.utah.edu

HyPer4: A P4 Program to Run Other P4 Programs

stages.p4: Each control function executes a single match-action stage of a
           target P4 program.

           The set_program_state tables guide execution from one primtive to
           the next.
*/

#include "match.p4"
#include "action.p4"
#include "switch_primitivetype.p4"

action set_program_state(action_ID, primitive_index, stage_state, next_stage) {
  modify_field(meta_primitive_state.action_ID, action_ID);
  modify_field(meta_primitive_state.primitive_index, primitive_index);
  modify_field(meta_ctrl.stage_state, stage_state);
  modify_field(meta_ctrl.next_stage, next_stage);
}

table set_program_state_11 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    set_program_state;
  }
}

table set_program_state_12 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    set_program_state;
  }
}

table set_program_state_13 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    set_program_state;
  }
}

table set_program_state_21 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    set_program_state;
  }
}

table set_program_state_22 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    set_program_state;
  }
}

table set_program_state_23 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    set_program_state;
  }
}

table set_program_state_31 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    set_program_state;
  }
}

table set_program_state_32 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    set_program_state;
  }
}

table set_program_state_33 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    set_program_state;
  }
}

control stage1 {
  match_1();
  apply(set_primitive_metadata_11);
  switch_primitivetype_11();
  apply(set_program_state_11);
  if(meta_ctrl.stage_state != COMPLETE) {
    apply(set_primitive_metadata_12);
    switch_primitivetype_12();
    apply(set_program_state_12);
    if(meta_ctrl.stage_state != COMPLETE) {
      apply(set_primitive_metadata_13);
      switch_primitivetype_13();
      apply(set_program_state_13);
    }
  }
}

control stage2 {
  match_2();
  apply(set_primitive_metadata_21);
  switch_primitivetype_21();
  apply(set_program_state_21);
  if(meta_ctrl.stage_state != COMPLETE) {
    apply(set_primitive_metadata_22);
    switch_primitivetype_22();
    apply(set_program_state_22);
    if(meta_ctrl.stage_state != COMPLETE) {
      apply(set_primitive_metadata_23);
      switch_primitivetype_23();
      apply(set_program_state_23);
    }
  }
}

control stage3 {
  match_3();
  apply(set_primitive_metadata_31);
  switch_primitivetype_31();
  apply(set_program_state_31);
  if(meta_ctrl.stage_state != COMPLETE) {
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

