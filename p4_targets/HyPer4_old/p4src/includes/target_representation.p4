/* TODO: Split out control functions, tables, and actions specific
         to modify_field; create similar files for other primitives
*/

#define A_MODIFY_FIELD		0
#define A_ADD_HEADER		1
#define A_COPY_HEADER		2
#define A_REMOVE_HEADER		3
#define A_MODIFY_FIELD_WITH_HBO	4
#define A_TRUNCATE		5
#define A_DROP			6
#define A_NO_OP			7
#define A_PUSH			8
#define A_POP			9
#define A_COUNT			10
#define A_METER			11
#define A_GENERATE_DIGEST	12
#define A_RECIRCULATE		13
#define A_RESUBMIT		14
#define A_CLONE_INGRESS_INGRESS	15
#define A_CLONE_EGRESS_INGRESS	16
#define A_CLONE_INGRESS_EGRESS	17
#define A_CLONE_EGRESS_EGRESS	18

// Controller must populate t_mod with entries for each of these
//  such that if tmetameta.subtype is one of these values, the
//  corresponding action is invoked
// We could take care of this in control functions instead...
//  This alternative approach would result in separate tables
//  for each primitive, matchless tables, for which the
//  controller would still have to set the default action
#define MODFIELD_SUB_META_STDMETA_INGRESSPORT	0
#define MODFIELD_SUB_META_STDMETA_PACKETLENGTH	1
#define MODFIELD_SUB_META_STDMETA_EGRESSSPEC	2
#define MODFIELD_SUB_META_STDMETA_EGRESSPORT	3
#define MODFIELD_SUB_META_STDMETA_EGRESSINST	4
#define MODFIELD_SUB_META_STDMETA_INSTTYPE	5
#define MODFIELD_SUB_META_STDMETA_PARSERSTAT	6
#define MODFIELD_SUB_META_STDMETA_PARSERERROR	7
#define MODFIELD_SUB_STDMETA_EGRESSSPEC_META	8
#define MODFIELD_SUB_META_PARAM			9
#define MODFIELD_SUB_META_META			10
#define MODFIELD_SUB_META_CONST			11

// The 't' prefix in the following stands for 'target', as in, 'the target P4
//  program we are running in HyPer4'

register tmeta_8_r {
  width: 8;
  instance_count: 1000;
}

register tmeta_16_r {
  width: 16;
  instance_count: 1000;
}

header_type tmeta_8_meta_t {
  fields {
    dstbyteindex : 16; // capable of indexing 65535 bytes of target metadata
    srcbyteindex : 16;
  }
}

header_type tmeta_16_meta_t {
  fields {
    dstbyteindex : 16; // capable of indexing 65535 bytes of target metadata
    srcbyteindex : 16;
  }
}

header_type tmetameta_t {
  fields {
    size : 8;
    subtype : 8;
  }
}

header_type tprimitives_t {
  fields {
    UID : 16;
    actiontype : 8;
  }
}

header_type tprogramstate_t {
  fields {
    table : 8;
    compound_action: 8;
    primitive : 8;
  }
}

metadata tmeta_8_meta_t tmeta_8_meta;
metadata tmeta_16_meta_t tmeta_16_meta;
metadata tmetameta_t tmetameta;
metadata tprimitives_t tprimitives;
metadata tprogramstate_t tprogramstate;

// We don't know how wide the standard_metadata fields are.  It looks like 16 bits is generally a safe bet.
action mod_meta_stdmeta_ingressport() { 
  register_write(tmeta_16_r, tmeta_16_tmeta.dstbyteindex, standard_metadata.ingress_port);
}
action mod_meta_stdmeta_packetlength() {
  register_write(tmeta_16_r, tmeta_16_tmeta.dstbyteindex, standard_metadata.packet_length);
}
action mod_meta_stdmeta_egressspec() {
  register_write(tmeta_16_r, tmeta_16_tmeta.dstbyteindex, standard_metadata.egress_spec);
}
action mod_meta_stdmeta_egressport() {
  register_write(tmeta_16_r, tmeta_16_tmeta.dstbyteindex, standard_metadata.egress_port);
}
action mod_meta_stdmeta_egressinst() {
  register_write(tmeta_16_r, tmeta_16_tmeta.dstbyteindex, standard_metadata.egress_instance);
}
action mod_meta_stdmeta_insttype() {
  register_write(tmeta_16_r, tmeta_16_tmeta.dstbyteindex, standard_metadata.instance_type);
}
action mod_meta_stdmeta_parserstat() {
  register_write(tmeta_16_r, tmeta_16_tmeta.dstbyteindex, standard_metadata.parser_status);
}
action mod_meta_stdmeta_parsererror() {
  register_write(tmeta_16_r, tmeta_16_tmeta.dstbyteindex, standard_metadata.parser_error_location);
}

table t_mod_11 {
  reads{
    tmetameta.numbytes : exact;
    tmetameta.subtype : exact;
  }
  actions { //TODO replace w/ action profile
    mod_meta_stdmeta_ingressport;
    mod_meta_stdmeta_packetlength;
    mod_meta_stdmeta_egressspec;
    mod_meta_stdmeta_egressport;
    mod_meta_stdmeta_egressinst;
    mod_meta_stdmeta_insttype;
    mod_meta_stdmeta_parserstat;
    mod_meta_stdmeta_parsererror;
    // a good start!  but TODO need to take care of the other types
  }
}

action a_mod_prep_8(subtype, dstindex, srcindex, numbytes) {
  modify_field(tmetameta.subtype, subtype);
  modify_field(tmetameta.numbytes, numbytes);
  modify_field(tmeta_8_meta.dstbyteindex, dstindex);
  modify_field(tmeta_8_meta.srcbyteindex, srcindex);
}

action a_mod_prep_16(subtype, dstindex, srcindex, numbytes) {
  modify_field(tmetameta.subtype, subtype);
  modify_field(tmetameta.numbytes, numbytes);
  modify_field(tmeta_16_meta.dstbyteindex, dstindex);
  modify_field(tmeta_16_meta.srcbyteindex, srcindex);
}

table t_mod_prep_11 {
  reads {
    tprimitives.UID : exact;
  }
  actions {
    a_mod_prep_8;
    a_mod_prep_16;
  }
}

// because a table may only be invoked once...
table t_set_primitive_data_12{ actions{ set_primitive_data; }}
table t_set_primitive_data_13{ actions{ set_primitive_data; }}
table t_set_primitive_data_14{ actions{ set_primitive_data; }}
table t_set_primitive_data_15{ actions{ set_primitive_data; }}
table t_set_primitive_data_16{ actions{ set_primitive_data; }}
table t_set_primitive_data_17{ actions{ set_primitive_data; }}
table t_set_primitive_data_18{ actions{ set_primitive_data; }}
table t_set_primitive_data_19{ actions{ set_primitive_data; }}
table t_set_primitive_data_22{ actions{ set_primitive_data; }}
table t_set_primitive_data_23{ actions{ set_primitive_data; }}
table t_set_primitive_data_24{ actions{ set_primitive_data; }}
table t_set_primitive_data_25{ actions{ set_primitive_data; }}
table t_set_primitive_data_26{ actions{ set_primitive_data; }}
table t_set_primitive_data_27{ actions{ set_primitive_data; }}
table t_set_primitive_data_28{ actions{ set_primitive_data; }}
table t_set_primitive_data_29{ actions{ set_primitive_data; }}

// label suffix: xy
//  x: high-level matching stage
//  y: how many times this primitive will have been executed after this time
control do_modify_field_11 {  
  apply(t_mod_prep_11);
  apply(t_mod_11);
}
control do_modify_field_12 {  
  // TODO: create these tables
  apply(t_mod_prep_12);
  apply(t_mod_12);
}

// this will go in the main HyPer4 file but we're just trying things out
//  right now
action set_primitive_data(UID, actiontype) {
  modify_field(tprimitives.UID, UID);
  modify_field(tprimitives.actiontype, actiontype);
}

table t1_A {
  reads {
    local_meta.data : ternary;
  }
  actions {
    set_primitiveUID;
  }
}

control ingress {
  // ...
  apply(t1_A);
  if(tprimitives.actiontype == A_MODIFY_FIELD) {
    do_modify_field_11;
  }
  else if(tprimitives.actiontype == A_ADD_HEADER) {
    do_add_header_11;
  }
  else if(tprimitives.actiontype == A_COPY_HEADER) {
    do_copy_header_11;
  }
  // ...
  apply(t_set_primitive_data_12);
  if(tprimitives.actiontype == A_MODIFY_FIELD) {
    do_modify_field_12;
  }
  else if(tprimitives.actiontype == A_ADD_HEADER) {
    do_add_header_12;
  }
  else if(tprimitives.actiontype == A_COPY_HEADER) {
    do_copy_header_12;
  }
  apply(t2_A);
  if(tprimitives.actiontype == A_MODIFY_FIELD) {
    do_modify_field_21;
  }
  else if(tprimitives.actiontype == A_ADD_HEADER) {
    do_add_header_21;
  }
  else if(tprimitives.actiontype == A_COPY_HEADER) {
    do_copy_header_21;
  }
  // ...
}
