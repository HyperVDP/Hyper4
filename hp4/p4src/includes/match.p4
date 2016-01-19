#include "switch_meta.p4"
#include "switch_stdmeta.p4"

action init_program_state(action_ID, match_ID, primitive_index, stage_state, next_table) {
  modify_field(meta_primitive_state.action_ID, action_ID);
  modify_field(meta_primitive_state.match_ID, match_ID);
  modify_field(meta_primitive_state.primitive_index, primitive_index);
  modify_field(meta_ctrl.stage_state, stage_state);
  modify_field(meta_ctrl.next_table, next_table);
}

action set_program_state(action_ID, primitive_index, stage_state, next_table) {
  modify_field(meta_primitive_state.action_ID, action_ID);
  modify_field(meta_primitive_state.primitive_index, primitive_index);
  modify_field(meta_ctrl.stage_state, stage_state);
  modify_field(meta_ctrl.next_table, next_table);
}

table t1_extracted_exact {
  reads {
    extracted.data : ternary;
  }
  actions {
    init_program_state;
  }
}

table t1_metadata_exact {
  reads {
    tmeta.field00 : exact;
    tmeta.field01 : exact;
    tmeta.field02 : exact;
    tmeta.field03 : exact;
    tmeta.field04 : exact;
    tmeta.field05 : exact;
    tmeta.field06 : exact;
    tmeta.field07 : exact;
  }
  actions {
    init_program_state;
  }
}

table t2_extracted_exact {
  reads {
    extracted.data : ternary;
  }
  actions {
    init_program_state;
  }
}

table t2_metadata_exact {
  reads {
    tmeta.field00 : exact;
    tmeta.field01 : exact;
    tmeta.field02 : exact;
    tmeta.field03 : exact;
    tmeta.field04 : exact;
    tmeta.field05 : exact;
    tmeta.field06 : exact;
    tmeta.field07 : exact;
  }
  actions {
    init_program_state;
  }
}


table t3_extracted_exact {
  reads {
    extracted.data : ternary;
  }
  actions {
    init_program_state;
  }
}

table t3_metadata_exact {
  reads {
    tmeta.field00 : exact;
    tmeta.field01 : exact;
    tmeta.field02 : exact;
    tmeta.field03 : exact;
    tmeta.field04 : exact;
    tmeta.field05 : exact;
    tmeta.field06 : exact;
    tmeta.field07 : exact;
  }
  actions {
    init_program_state;
  }
}


action set_meta_stdmeta(stdmeta_ID) {
  modify_field(meta_stdmeta.stdmeta_ID, stdmeta_ID);
}

table t1_stdmeta_exact {
  actions {
    set_meta_stdmeta;
  }
}

table t2_stdmeta_exact { actions { set_meta_stdmeta; } }
table t3_stdmeta_exact { actions { set_meta_stdmeta; } }

control match_1 {
// target match -> set program state
  if(meta_ctrl.next_table == EXTRACTED_EXACT) { // condition_3
    apply(t1_extracted_exact);
  }
  else if(meta_ctrl.next_table == METADATA_EXACT) {
    switch_tmeta_1();
    apply(t1_metadata_exact);
  }
  else if(meta_ctrl.next_table == STDMETA_EXACT) {
    apply(t1_stdmeta_exact);
    switch_stdmeta_1();
  }
  // ... TODO: (other t1 match tables)
}

control match_2 {
// target match -> set program state
  if(meta_ctrl.next_table == EXTRACTED_EXACT) { // c_24
    apply(t2_extracted_exact);
  }
  else if(meta_ctrl.next_table == METADATA_EXACT) { // c_25
    switch_tmeta_2();
    apply(t2_metadata_exact);
  }
  else if(meta_ctrl.next_table == STDMETA_EXACT) { // c_27
    apply(t2_stdmeta_exact);
    switch_stdmeta_2();
  }
  // ... TODO: (other t2 match tables)
}

control match_3 {
// target match -> set program state
  if(meta_ctrl.next_table == EXTRACTED_EXACT) {
    apply(t3_extracted_exact);
  }
  else if(meta_ctrl.next_table == METADATA_EXACT) {
    switch_tmeta_3();
    apply(t3_metadata_exact);
  }
  else if(meta_ctrl.next_table == STDMETA_EXACT) {
    apply(t3_stdmeta_exact);
    switch_stdmeta_3();
  }
  // ... TODO: (other t3 match tables)
}
