action a_set_primitive_metadata(primitive, primitive_subtype) {
  modify_field(meta_primitive_state.primitive, primitive);
  modify_field(meta_primitive_state.subtype, primitive_subtype);
}

table set_primitive_metadata_11 {
  reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_set_primitive_metadata;
  }
}
