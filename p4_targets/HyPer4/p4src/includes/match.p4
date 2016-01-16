#include "switch_meta.p4"
#include "switch_stdmeta.p4"

action set_program_state(action_ID, primitive_index, stage_state) {
  modify_field(meta_prog_state.action_ID, action_ID);
  modify_field(meta_prog_state.primitive_index, primitive_index);
  modify_field(meta_ctrl.stage_state, stage_state);
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
    meta.field00 : exact;
    meta.field01 : exact;
    meta.field02 : exact;
    meta.field03 : exact;
    meta.field04 : exact;
    meta.field05 : exact;
    meta.field06 : exact;
    meta.field07 : exact;
  }
  actions {
    set_program_state;
  }
}

table t2_extracted_exact {
  reads {
    extracted.data : ternary;
  }
  actions {
    set_program_state;
  }
}

table t2_metadata_exact {
  reads {
    meta.field00 : exact;
    meta.field01 : exact;
    meta.field02 : exact;
    meta.field03 : exact;
    meta.field04 : exact;
    meta.field05 : exact;
    meta.field06 : exact;
    meta.field07 : exact;
  }
  actions {
    set_program_state;
  }
}


table t3_extracted_exact {
  reads {
    extracted.data : ternary;
  }
  actions {
    set_program_state;
  }
}

table t3_metadata_exact {
  reads {
    meta.field00 : exact;
    meta.field01 : exact;
    meta.field02 : exact;
    meta.field03 : exact;
    meta.field04 : exact;
    meta.field05 : exact;
    meta.field06 : exact;
    meta.field07 : exact;
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

table t2_stdmeta_exact { actions { set_stdmeta_match; } }
table t3_stdmeta_exact { actions { set_stdmeta_match; } }

control match_1 {
// target match -> set program state
  if(meta_ctrl.next_table == EXTRACTED_EXACT) {
    apply(t1_extracted_exact);
  }
  else if(meta_ctrl.next_table == METADATA_EXACT) {
    switch_meta_1;
    apply(t1_metadata_exact);
  }
  else if(meta_ctrl.next_table == STDMETA_EXACT) {
    apply(t1_stdmeta_exact);
    switch_stdmeta_1;
  }
  // ... TODO: (other t1 match tables)
}

control match_2 {
// target match -> set program state
  if(meta_ctrl.next_table == EXTRACTED_EXACT) {
    apply(t2_extracted_exact);
  }
  else if(meta_ctrl.next_table == METADATA_EXACT) {
    switch_meta_2;
    apply(t2_metadata_exact);
  }
  else if(meta_ctrl.next_table == STDMETA_EXACT) {
    apply(t2_stdmeta_exact);
    switch_stdmeta_2;
  }
  // ... TODO: (other t2 match tables)
}

control match_3 {
// target match -> set program state
  if(meta_ctrl.next_table == EXTRACTED_EXACT) {
    apply(t3_extracted_exact);
  }
  else if(meta_ctrl.next_table == METADATA_EXACT) {
    switch_meta_3;
    apply(t3_metadata_exact);
  }
  else if(meta_ctrl.next_table == STDMETA_EXACT) {
    apply(t3_stdmeta_exact);
    switch_stdmeta_3;
  }
  // ... TODO: (other t3 match tables)
}
