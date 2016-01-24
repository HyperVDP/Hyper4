/*
David Hancock
FLUX Research Group
University of Utah
dhancock@cs.utah.edu

HyPer4: A P4 Program to Run Other P4 Programs

modify_field.p4: Carry out the various subtypes of the modify_field primitive,
                 where 'subtype' refers to a distinct combination of parameter
                 types.
*/

action mod_meta_stdmeta_ingressport(tmeta_mask) { 
  modify_field(tmeta.data, standard_metadata.ingress_port, tmeta_mask);
}
action mod_meta_stdmeta_packetlength(tmeta_mask) {
  modify_field(tmeta.data, standard_metadata.packet_length, tmeta_mask);
}
action mod_meta_stdmeta_egressspec(tmeta_mask) {
  modify_field(tmeta.data, standard_metadata.egress_spec, tmeta_mask);
}
action mod_meta_stdmeta_egressport(tmeta_mask) {
  modify_field(tmeta.data, standard_metadata.egress_port, tmeta_mask);
}
action mod_meta_stdmeta_egressinst(tmeta_mask) {
  modify_field(tmeta.data, standard_metadata.egress_instance, tmeta_mask);
}
action mod_meta_stdmeta_insttype(tmeta_mask) {
  modify_field(tmeta.data, standard_metadata.instance_type, tmeta_mask);
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
action mod_stdmeta_egressspec_meta(c1, c2) {
  // TODO: implement a method by which we isolate the bytes in tmeta.data that
  //       correspond to the embedded field which should be used to set the
  //       value of standard_metadata.egress_spec.  Two ideas I've come up
  //       with both involve first left shifting to get rid of irrelevant
  //       MSBs and then right shifting to get rid of irrelevant LSBs and
  //       to right-align the embedded field, which can then be used directly
  //       in a mod_destfield_tmetasource operation.  Of course we'll work
  //       with a copy of tmeta.data to preserve tmeta.data.
  //       idea 1: use header stacks and pops and pushes;
  //       idea 2: use metadata and left shifts and right shifts <- problem
  //       with this is we can only do left shifts / right shifts using consts
  //       (I think; need to verify), so we'd have to create a separate action
  //       for every case
}
action mod_meta_const(val, tmeta_mask) {
  modify_field(tmeta.data, val, tmeta_mask);
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
    meta_primitive_state.match_ID : exact;
  }
  action_profile : mod_actions;
}

table t_mod_12 { reads { meta_primitive_state.subtype : exact; meta_primitive_state.match_ID : exact;}
  action_profile : mod_actions;}

table t_mod_13 { reads { meta_primitive_state.subtype : exact; meta_primitive_state.match_ID : exact;}
  action_profile : mod_actions;}

table t_mod_21 { reads { meta_primitive_state.subtype : exact; meta_primitive_state.match_ID : exact;}
  action_profile : mod_actions;}

table t_mod_22 { reads { meta_primitive_state.subtype : exact; meta_primitive_state.match_ID : exact;}
  action_profile : mod_actions;}

table t_mod_23 { reads { meta_primitive_state.subtype : exact; meta_primitive_state.match_ID : exact;}
  action_profile : mod_actions;}

table t_mod_31 { reads { meta_primitive_state.subtype : exact; meta_primitive_state.match_ID : exact;}
  action_profile : mod_actions;}

table t_mod_32 { reads { meta_primitive_state.subtype : exact; meta_primitive_state.match_ID : exact;}
  action_profile : mod_actions;}

table t_mod_33 { reads { meta_primitive_state.subtype : exact; meta_primitive_state.match_ID : exact;}
  action_profile : mod_actions;}

action a_mod_prep_8(dstindex, srcindex) {
  modify_field(tmeta_8_meta.dstbyteindex, dstindex);
  modify_field(tmeta_8_meta.srcbyteindex, srcindex);
}

action a_mod_prep_16(dstindex, srcindex) {
  modify_field(tmeta_16_meta.dstbyteindex, dstindex);
  modify_field(tmeta_16_meta.srcbyteindex, srcindex);
}

action _no_op() {
  no_op();
}

action_profile mod_prep_actions {
  actions {
    a_mod_prep_8;
    a_mod_prep_16;
    _no_op;
  }
}

table t_mod_prep_11 {
  reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : mod_prep_actions;
}

table t_mod_prep_12 {
  reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : mod_prep_actions;
}

table t_mod_prep_13 {
  reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : mod_prep_actions;
}

table t_mod_prep_21 {
  reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : mod_prep_actions;
}

table t_mod_prep_22 {
  reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : mod_prep_actions;
}

table t_mod_prep_23 {
  reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : mod_prep_actions;
}

table t_mod_prep_31 {
  reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : mod_prep_actions;
}

table t_mod_prep_32 {
  reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : mod_prep_actions;
}

table t_mod_prep_33 {
  reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : mod_prep_actions;
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
