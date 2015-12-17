action a_set_primitive_metadata(primitive_type, primitive_subtype) {
  modify_field(meta_primitive_metadata.type, primitive_type);
  modify_field(meta_primitive_metadata.subtype, primitive_subtype);
}

table set_primitive_metadata_11 {
  reads {
    meta_prog_state.actionID : exact;
    meta_prog_state.primitive_index : exact;
  }
  actions {
    a_set_primitive_metadata;
  }
}
