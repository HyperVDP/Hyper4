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
action mod_stdmeta_egressspec_meta() {
  register_read(standard_metadata.egress_spec, tmeta_16_r, tmeta_16_meta.srcbyteindex);
}
action mod_meta_const(val) {
  register_write(tmeta_16_r, tmeta_16_meta.dstbyteindex, val);
}
action mod_stdmeta_egressspec_const(val) {
  modify_field(standard_metadata.egress_spec, val);
}

action_profile mod_actions {
  actions {
    mod_meta_stdmeta_ingressport;
    mod_meta_stdmeta_packetlength;
    mod_meta_stdmeta_egressspec;
    mod_meta_stdmeta_egressport;
    mod_meta_stdmeta_egressinst;
    mod_meta_stdmeta_insttype;
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
