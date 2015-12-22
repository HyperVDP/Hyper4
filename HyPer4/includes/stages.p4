#include "defines.p4"
#include "match.p4"
#include "action.p4"

control stage1 {
  match_1; // match.p4

  // set primitive meta data
  apply(set_primitive_metadata_11);

  // divert control flow based on primitive type
  switch_primitivetype_11;

  // set program state using current state
  apply(set_program_state_11);

  // next primitive
  if(meta_ctrl.stage_state != COMPLETE) {
    // set primitive meta data
    apply(set_primitive_metadata_12);
    switch_primitivetype_12;
    apply(set_program_state_12);
    if(meta_ctrl.stage_state != COMPLETE) {
      apply(set_primitive_metadata_13);
      switch_primitivetype_13;
      apply(set_program_state_13);
      // ...
    }
  }
}

control stage2 {
  match_2; // match.p4

  apply(set_primitive_metadata_21);
  switch_primitivetype_21;
  apply(set_program_state_21);

  // next primitive
  if(meta_ctrl.stage_state != COMPLETE) {
    // set primitive meta data
    apply(set_primitive_metadata_22);
    switch_primitivetype_22;
    apply(set_program_state_22);
    if(meta_ctrl.stage_state != COMPLETE) {
      apply(set_primitive_metadata_23);
      switch_primitivetype_23;
      apply(set_program_state_23);
    }
  }
}

control stage3 {
  match_3; // match.p4

  apply(set_primitive_metadata_31);
  switch_primitivetype_31;
  apply(set_program_state_31);

  // next primitive
  if(meta_ctrl.stage_state != COMPLETE) {
    // set primitive meta data
    apply(set_primitive_metadata_32);
    switch_primitivetype_32;
    apply(set_program_state_32);
    if(meta_ctrl.stage_state != COMPLETE) {
      apply(set_primitive_metadata_33);
      switch_primitivetype_33;
      apply(set_program_state_33);
    }
  }
}
