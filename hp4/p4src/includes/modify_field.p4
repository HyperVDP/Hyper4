action mod_meta_stdmeta_ingressport() { 
  register_write(tmeta_16_r, tmeta_16_meta.dstbyteindex, standard_metadata.ingress_port);
}
action mod_meta_stdmeta_packetlength() {
  register_write(tmeta_16_r, tmeta_16_meta.dstbyteindex, standard_metadata.packet_length);
}
action mod_meta_stdmeta_egressspec() {
  register_write(tmeta_16_r, tmeta_16_meta.dstbyteindex, standard_metadata.egress_spec);
}
action mod_meta_stdmeta_egressport() {
  register_write(tmeta_16_r, tmeta_16_meta.dstbyteindex, standard_metadata.egress_port);
}
action mod_meta_stdmeta_egressinst() {
  register_write(tmeta_16_r, tmeta_16_meta.dstbyteindex, standard_metadata.egress_instance);
}
action mod_meta_stdmeta_insttype() {
  register_write(tmeta_16_r, tmeta_16_meta.dstbyteindex, standard_metadata.instance_type);
}
/*
these standard_metadata fields not supported in bmv2 / p4c-bm?

action mod_meta_stdmeta_parserstat() {
  register_write(tmeta_16_r, tmeta_16_meta.dstbyteindex, standard_metadata.parser_status);
}

action mod_meta_stdmeta_parsererror() {
  register_write(tmeta_16_r, tmeta_16_meta.dstbyteindex, standard_metadata.parser_error_location);
}
*/
action mod_stdmeta_egressspec_meta() {
  register_read(standard_metadata.egress_spec, tmeta_16_r, tmeta_16_meta.srcbyteindex);
}
action mod_meta_const(val) {
  register_write(tmeta_16_r, tmeta_16_meta.dstbyteindex, val);
}
action mod_stdmeta_egressspec_const(val) {
  modify_field(standard_metadata.egress_spec, val);
}
// TODO: add rest of the modify_field actions


/* Purpose of action_profile is to share parameter sets among tables; that's
   not likely necessary here, but using an action_profile also reduces the
   size of the duplicate code just specifying all of the actions available
   to each mod table
   Impact is operational - instead of adding one entry to the appropriate
   mod table, we first add an entry to the action_profile with all of the
   parameter values, and then add an entry to the appropriate mod table
   with the match value(s) and the action_profile entry handle
*/
action_profile mod_actions {
  actions {
    mod_meta_stdmeta_ingressport;
    mod_meta_stdmeta_packetlength;
    mod_meta_stdmeta_egressspec;
    mod_meta_stdmeta_egressport;
    mod_meta_stdmeta_egressinst;
    mod_meta_stdmeta_insttype;
    //mod_meta_stdmeta_parserstat;
    mod_stdmeta_egressspec_meta;
    mod_meta_const;
    mod_stdmeta_egressspec_const;
    // TODO: add the rest of the modify_field subtypes
  }
}

table t_mod_11 {
  reads {
    meta_primitive_state.subtype : exact;
  }
  action_profile : mod_actions;
}

table t_mod_12 { reads { meta_primitive_state.subtype : exact; }
  action_profile : mod_actions;}

table t_mod_13 { reads { meta_primitive_state.subtype : exact; }
  action_profile : mod_actions;}

table t_mod_21 { reads { meta_primitive_state.subtype : exact; }
  action_profile : mod_actions;}

table t_mod_22 { reads { meta_primitive_state.subtype : exact; }
  action_profile : mod_actions;}

table t_mod_23 { reads { meta_primitive_state.subtype : exact; }
  action_profile : mod_actions;}

table t_mod_31 { reads { meta_primitive_state.subtype : exact; }
  action_profile : mod_actions;}

table t_mod_32 { reads { meta_primitive_state.subtype : exact; }
  action_profile : mod_actions;}

table t_mod_33 { reads { meta_primitive_state.subtype : exact; }
  action_profile : mod_actions;}

action a_mod_prep_8(dstindex, srcindex) {
  modify_field(tmeta_8_meta.dstbyteindex, dstindex);
  modify_field(tmeta_8_meta.srcbyteindex, srcindex);
}

action a_mod_prep_16(dstindex, srcindex) {
  modify_field(tmeta_16_meta.dstbyteindex, dstindex);
  modify_field(tmeta_16_meta.srcbyteindex, srcindex);
}

table t_mod_prep_11 {
  reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_mod_prep_8;
    a_mod_prep_16;
  }
}

table t_mod_prep_12 {
  reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_mod_prep_8;
    a_mod_prep_16;
  }
}

table t_mod_prep_13 {
  reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_mod_prep_8;
    a_mod_prep_16;
  }
}

table t_mod_prep_21 {
  reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_mod_prep_8;
    a_mod_prep_16;
  }
}

table t_mod_prep_22 {
  reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_mod_prep_8;
    a_mod_prep_16;
  }
}

table t_mod_prep_23 {
  reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_mod_prep_8;
    a_mod_prep_16;
  }
}

table t_mod_prep_31 {
  reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_mod_prep_8;
    a_mod_prep_16;
  }
}

table t_mod_prep_32 {
  reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_mod_prep_8;
    a_mod_prep_16;
  }
}

table t_mod_prep_33 {
  reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_mod_prep_8;
    a_mod_prep_16;
  }
}

control do_modify_field_11 {
  apply(t_mod_prep_11);
  apply(t_mod_11);
}

control do_modify_field_12 {
  apply(t_mod_prep_12);
  apply(t_mod_12);
}

control do_modify_field_13 {
  apply(t_mod_prep_13);
  apply(t_mod_13);
}

control do_modify_field_21 {
  apply(t_mod_prep_21);
  apply(t_mod_21);
}

control do_modify_field_22 {
  apply(t_mod_prep_22);
  apply(t_mod_22);
}

control do_modify_field_23 {
  apply(t_mod_prep_23);
  apply(t_mod_23);
}

control do_modify_field_31 {
  apply(t_mod_prep_31);
  apply(t_mod_31);
}

control do_modify_field_32 {
  apply(t_mod_prep_32);
  apply(t_mod_32);
}

control do_modify_field_33 {
  apply(t_mod_prep_33);
  apply(t_mod_33);
}
