/*
David Hancock
FLUX Research Group
University of Utah
dhancock@cs.utah.edu

HyPer4: A P4 Program to Run Other P4 Programs

setup.p4:
- Check the need to initialize local metadata for the current packet
  - this includes the parse width; after this is set, we resubmit so we can
    extract the proper number of bits
- Normalize extracted data to a standard width bitfield (e.g. 256 -> 768)
- Set program and first table
*/

/*
action a_norm_256() {
  modify_field(extracted.data, bitfield_256.data);
}

action a_norm_512() {
  modify_field(extracted.data, bitfield_512.data);
}

action a_norm_768() {
  modify_field(extracted.data, bitfield_768.data);
}
*/

table t_norm {
  reads {
    meta_ctrl.program : exact;
  }
  actions {

  }
}

/*
// ------ Initialize local metadata and resubmit
field_list f_packet_init {
  meta_parse;
  meta_ctrl;
  standard_metadata;
}
*/

/*
// ------ Set program and first table and parse width
action set_program(program, table_ID, parse_width) {
  modify_field(meta_ctrl.program, program);
  modify_field(meta_ctrl.next_table, table_ID);
  //modify_field(meta_parse.parse_width, parse_width);
  //resubmit(f_packet_init);
}
*/

action set_program(program) {
  modify_field(meta_ctrl.program, program);
}

table t_prog_select {
  reads {
    standard_metadata.ingress_port : exact; // range not yet supported by bmv2
    //standard_metadata.packet_length : exact; // range not yet supported by bmv2
    //standard_metadata.instance_type : exact; // range not yet supported by bmv2
    //extracted.data : ternary;
  }
  actions {
    set_program;
  }
}

action set_next_action(next_action) {
  modify_field(parse_ctrl.next_action, next_action);
}

field_list fl_extract_more {
  meta_ctrl;
  parse_ctrl;
  standard_metadata;
}

action extract_more(numbytes, state) {
  modify_field(parse_ctrl.numbytes, numbytes);
  modify_field(parse_ctrl.state, state);
  modify_field(parse_ctrl.next_action, EXTRACT_MORE);
  resubmit(fl_extract_more);
}

table parse_control {
  reads {
    parse_ctrl.numbytes : exact;
    parse_ctrl.state : exact;
  }
  actions {
    set_next_action;
    extract_more;
  }
}

// SEB: standard extracted bytes, selectable
//  at code generation time
table t_inspect_SEB {
  reads {
    meta_ctrl.program : ternary;
    ext[0].data : ternary;
    ext[1].data : ternary;
    ext[2].data : ternary;
    ext[3].data : ternary;
    ext[4].data : ternary;
    ext[5].data : ternary;
    ext[6].data : ternary;
    ext[7].data : ternary;
    ext[8].data : ternary;
    ext[9].data : ternary;
    ext[10].data : ternary;
    ext[11].data : ternary;
    ext[12].data : ternary;
    ext[13].data : ternary;
    ext[14].data : ternary;
    ext[15].data : ternary;
    ext[16].data : ternary;
    ext[17].data : ternary;
    ext[18].data : ternary;
    ext[19].data : ternary;
  }
  actions {
    set_next_action;
    extract_more;
  }
}

table t_inspect_20_29 {
  reads {
    meta_ctrl.program : ternary;
    parse_ctrl.state : exact;
    ext[20].data : ternary;
    ext[21].data : ternary;
    ext[22].data : ternary;
    ext[23].data : ternary;
    ext[24].data : ternary;
    ext[25].data : ternary;
    ext[26].data : ternary;
    ext[27].data : ternary;
    ext[28].data : ternary;
    ext[29].data : ternary;
  }
  actions {
    set_next_action;
    extract_more;
  }
}

table t_inspect_30_39 {
  reads {
    meta_ctrl.program : ternary;
    parse_ctrl.state : exact;
    ext[30].data : ternary;
    ext[31].data : ternary;
    ext[32].data : ternary;
    ext[33].data : ternary;
    ext[34].data : ternary;
    ext[35].data : ternary;
    ext[36].data : ternary;
    ext[37].data : ternary;
    ext[38].data : ternary;
    ext[39].data : ternary;
  }
  actions {
    set_next_action;
    extract_more;
  }
}

table t_inspect_40_49 {
  reads {
    meta_ctrl.program : ternary;
    parse_ctrl.state : exact;
    ext[40].data : ternary;
    ext[41].data : ternary;
    ext[42].data : ternary;
    ext[43].data : ternary;
    ext[44].data : ternary;
    ext[45].data : ternary;
    ext[46].data : ternary;
    ext[47].data : ternary;
    ext[48].data : ternary;
    ext[49].data : ternary;
  }
  actions {
    set_next_action;
    extract_more;
  }
}

table t_inspect_50_59 {
  reads {
    meta_ctrl.program : ternary;
    parse_ctrl.state : exact;
    ext[50].data : ternary;
    ext[51].data : ternary;
    ext[52].data : ternary;
    ext[53].data : ternary;
    ext[54].data : ternary;
    ext[55].data : ternary;
    ext[56].data : ternary;
    ext[57].data : ternary;
    ext[58].data : ternary;
    ext[59].data : ternary;
  }
  actions {
    set_next_action;
    extract_more;
  }
}

table t_inspect_60_69 {
  reads {
    meta_ctrl.program : ternary;
    parse_ctrl.state : exact;
    ext[60].data : ternary;
    ext[61].data : ternary;
    ext[62].data : ternary;
    ext[63].data : ternary;
    ext[64].data : ternary;
    ext[65].data : ternary;
    ext[66].data : ternary;
    ext[67].data : ternary;
    ext[68].data : ternary;
    ext[69].data : ternary;
  }
  actions {
    set_next_action;
    extract_more;
  }
}

table t_inspect_70_79 {
  reads {
    meta_ctrl.program : ternary;
    parse_ctrl.state : exact;
    ext[70].data : ternary;
    ext[71].data : ternary;
    ext[72].data : ternary;
    ext[73].data : ternary;
    ext[74].data : ternary;
    ext[75].data : ternary;
    ext[76].data : ternary;
    ext[77].data : ternary;
    ext[78].data : ternary;
    ext[79].data : ternary;
  }
  actions {
    set_next_action;
    extract_more;
  }
}

table t_inspect_80_89 {
  reads {
    meta_ctrl.program : ternary;
    parse_ctrl.state : exact;
    ext[80].data : ternary;
    ext[81].data : ternary;
    ext[82].data : ternary;
    ext[83].data : ternary;
    ext[84].data : ternary;
    ext[85].data : ternary;
    ext[86].data : ternary;
    ext[87].data : ternary;
    ext[88].data : ternary;
    ext[89].data : ternary;
  }
  actions {
    set_next_action;
    extract_more;
  }
}

table t_inspect_90_99 {
  reads {
    meta_ctrl.program : ternary;
    parse_ctrl.state : exact;
    ext[90].data : ternary;
    ext[91].data : ternary;
    ext[92].data : ternary;
    ext[93].data : ternary;
    ext[94].data : ternary;
    ext[95].data : ternary;
    ext[96].data : ternary;
    ext[97].data : ternary;
    ext[98].data : ternary;
    ext[99].data : ternary;
  }
  actions {
    set_next_action;
    extract_more;
  }
}

action a_set_first_table(tableID) {
  modify_field(meta_ctrl.next_table, tableID);
}

table t_set_first_table {
  reads {
    meta_ctrl.program : exact;
    parse_ctrl.state : exact;
  }
  actions {
    a_set_first_table;
  }
}

// ------ Setup
control setup {
/*
  if (meta_ctrl.stage == INIT) { //_condition_0
    apply(t_prog_select);
  }
  else if ( meta_ctrl.stage == NORM ) { //_condition_1
    apply(t_norm);
  }
*/
  if (meta_ctrl.stage == INIT) {
    apply(t_prog_select);
  }
  apply(parse_control);
  if(parse_ctrl.next_action == INSPECT_SEB) { 
    apply(t_inspect_SEB);
  }
  if(parse_ctrl.next_action == INSPECT_20_29) { 
    apply(t_inspect_20_29);
  }
  if(parse_ctrl.next_action == INSPECT_30_39) { 
    apply(t_inspect_30_39);
  }
  if(parse_ctrl.next_action == INSPECT_40_49) { 
    apply(t_inspect_40_49);
  }
  if(parse_ctrl.next_action == INSPECT_50_59) { 
    apply(t_inspect_50_59);
  }
  if(parse_ctrl.next_action == INSPECT_60_69) { 
    apply(t_inspect_60_69);
  }
  if(parse_ctrl.next_action == INSPECT_70_79) { 
    apply(t_inspect_70_79);
  }
  if(parse_ctrl.next_action == INSPECT_80_89) { 
    apply(t_inspect_80_89);
  }
  if(parse_ctrl.next_action == INSPECT_90_99) { 
    apply(t_inspect_90_99);
  }
  if(parse_ctrl.next_action == PROCEED) { 
    apply(t_norm);
    apply(t_set_first_table);
  }
}
