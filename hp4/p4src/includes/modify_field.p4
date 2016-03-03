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

// 1
action mod_meta_stdmeta_ingressport(leftshift, tmeta_mask) { 
  modify_field(tmeta.data, (tmeta.data & ~tmeta_mask) | ((standard_metadata.ingress_port << leftshift) & tmeta_mask)); // last "& mask" probably unnecessary
}

// 2
action mod_meta_stdmeta_packetlength(leftshift, tmeta_mask) {
  modify_field(tmeta.data, (tmeta.data & ~tmeta_mask) | ((standard_metadata.packet_length << leftshift) & tmeta_mask));
}

// 3
action mod_meta_stdmeta_egressspec(leftshift, tmeta_mask) {
  modify_field(tmeta.data, (tmeta.data & ~tmeta_mask) | ((standard_metadata.egress_spec << leftshift) & tmeta_mask));
}

// 4
action mod_meta_stdmeta_egressport(leftshift, tmeta_mask) {
  modify_field(tmeta.data, (tmeta.data & ~tmeta_mask) | ((standard_metadata.egress_port << leftshift) & tmeta_mask));
}

// 5
action mod_meta_stdmeta_egressinst(leftshift, tmeta_mask) {
  modify_field(tmeta.data, (tmeta.data & ~tmeta_mask) | ((standard_metadata.egress_instance << leftshift) & tmeta_mask));
}

// 6
action mod_meta_stdmeta_insttype(leftshift, tmeta_mask) {
  modify_field(tmeta.data, (tmeta.data & ~tmeta_mask) | ((standard_metadata.instance_type << leftshift) & tmeta_mask));
}

// 7
action mod_stdmeta_egressspec_meta() {
  modify_field(standard_metadata.egress_spec, tmeta.dcpy);
}

// 8
action mod_meta_const(val, leftshift, tmeta_mask) {
  modify_field(tmeta.data, (tmeta.data & ~tmeta_mask) | ((val << leftshift) & tmeta_mask));
}

// 9
action mod_stdmeta_egressspec_const(val) {
  modify_field(standard_metadata.egress_spec, val);
}

// 10
action mod_extracted_const(val, leftshift, emask) {
    modify_field(extracted.data, (extracted.data & ~emask) | ((val << leftshift) & emask));
}
// TODO: add rest of the modify_field actions

// result: tmeta.dcpy is the value of a field embedded within tmeta.data
action a_mod_prep(leftshift, rightshift) {
  modify_field(tmeta.dcpy, tmeta.data);
  modify_field(tmeta.dcpy, tmeta.dcpy << leftshift);
  modify_field(tmeta.dcpy, tmeta.dcpy >> rightshift);
}

action _no_op() {
  no_op();
}

table t_mod_11 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.subtype : exact;
    meta_primitive_state.match_ID : exact;
  }
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
    mod_extracted_const;
  }
}

table t_mod_12 { reads { 
  meta_ctrl.program : exact; meta_primitive_state.subtype : exact; meta_primitive_state.match_ID : exact;}
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
    mod_extracted_const;
  }
}

table t_mod_13 { reads {
  meta_ctrl.program : exact; meta_primitive_state.subtype : exact; meta_primitive_state.match_ID : exact;}
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
    mod_extracted_const;
  }
}

table t_mod_21 { reads {
  meta_ctrl.program : exact; meta_primitive_state.subtype : exact; meta_primitive_state.match_ID : exact;}
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
    mod_extracted_const;
  }
}

table t_mod_22 { reads {
  meta_ctrl.program : exact; meta_primitive_state.subtype : exact; meta_primitive_state.match_ID : exact;}
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
    mod_extracted_const;
  }
}

table t_mod_23 { reads {
  meta_ctrl.program : exact; meta_primitive_state.subtype : exact; meta_primitive_state.match_ID : exact;}
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
    mod_extracted_const;
  }
}

table t_mod_31 { reads {
  meta_ctrl.program : exact; meta_primitive_state.subtype : exact; meta_primitive_state.match_ID : exact;}
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
    mod_extracted_const;
  }
}

table t_mod_32 { reads {
  meta_ctrl.program : exact; meta_primitive_state.subtype : exact; meta_primitive_state.match_ID : exact;}
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
    mod_extracted_const;
  }
}

table t_mod_33 { reads {
  meta_ctrl.program : exact; meta_primitive_state.subtype : exact; meta_primitive_state.match_ID : exact;}
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
    mod_extracted_const;
  }
}

/*
action_profile mod_prep_actions {
  actions {
    a_mod_prep;
    _no_op;
  }
}
*/

table t_mod_prep_11 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_mod_prep;
    _no_op;
  }
}

table t_mod_prep_12 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_mod_prep;
    _no_op;
  }
}

table t_mod_prep_13 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_mod_prep;
    _no_op;
  }
}

table t_mod_prep_21 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_mod_prep;
    _no_op;
  }
}

table t_mod_prep_22 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_mod_prep;
    _no_op;
  }
}

table t_mod_prep_23 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_mod_prep;
    _no_op;
  }
}

table t_mod_prep_31 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_mod_prep;
    _no_op;
  }
}

table t_mod_prep_32 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_mod_prep;
    _no_op;
  }
}

table t_mod_prep_33 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_mod_prep;
    _no_op;
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
