/* SETUP
   Check the need to initialize local metadata for the current packet
   - this includes the parse width; after this is set, we resubmit so we can
     extract the proper number of bits
   Normalize extracted data to a standard width bitfield (e.g. 256 -> 768)
   Set first table
*/

// ------ Initialize local metadata and resubmit
field_list f_packet_init {
  meta_parse;
}

action a_packet_init(parse_width) {
  modify_field(meta_parse.parse_width, parse_width);
  resubmit(f_packet_init);
}

table t_packet_init {
  actions {
    a_packet_init;
  }
}

// ------ Normalize data to 768-bit bitfield
action a_norm_256() {
  modify_field(extracted.data, bitfield_256.data);
}

action a_norm_512() {
  modify_field(extracted.data, bitfield_512.data);
}

action a_norm_768() {
  modify_field(extracted.data, bitfield_768.data);
}

table t_norm {
  actions {
    a_norm_256;
    a_norm_512;
    a_norm_768;
  }
}

// ------ Set first table
action set_first_table(table_ID) {
  modify_field(meta_ctrl.next_table, table_ID);
}

table t_set_first_table {
  actions {
    set_first_table;
  }
}

// ------ Setup
control setup {
  if (meta_ctrl.stage == INIT) {
    apply(t_packet_init);
  }
  else if ( meta_ctrl.stage == NORM ) {
    apply(t_norm);
    apply(t_set_first_table);
  }
}
