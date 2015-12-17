#include "switch_stdmeta.p4"

action set_program_state(action_ID, primitive_index) {
  modify_field(meta_prog_state.action_ID, action_ID);
  modify_field(meta_prog_state.primitive_index, primitive_index);
}

table t1_extracted_exact {
  reads {
    extracted.data : ternary;
  }
  actions {
    set_program_state;
  }
}

table t1_metadata_exact {
  reads {
    meta.data : ternary;
  }
  actions {
    set_program_state;
  }
}

action set_stdmeta_match(stdmeta_ID) {
  modify_field(stdmeta_match.stdmeta_ID, stdmeta_ID);
}

table t1_stdmeta_exact {
  actions {
    set_stdmeta_match;
  }
}

control match_1 {
// target match -> set program state
  if(meta_ctrl.next_table == EXTRACTED_EXACT) {
    apply(t1_extracted_exact);
  }
  else if(meta_ctrl.next_table == METADATA_EXACT) {
    // TODO: figure out how this should work
    // ex. Merge all target metadata into one field, apply ternary match
    //    just like we did with extracted data
    apply(t1_metadata_exact);
  }
  else if(meta_ctrl.next_table == STDMETA_EXACT) {
    apply(t1_stdmeta_exact);
    switch_stdmeta_1;
  }
  // ... TODO: (other t1 match tables)
}
