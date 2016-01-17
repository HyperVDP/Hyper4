// ------ Initialize local metadata and resubmit
action a_packet_init(parse_width) {
  modify_field(meta_parse.parse_width, parse_width);
}

table t_packet_init {
  actions {
    a_packet_init;
  }
}

field_list f_packet_init {
  meta_parse.parse_width;
}

action a_resubmit() {
  resubmit(f_packet_init);
}

table t_resubmit {
  actions {
    a_resubmit;
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
  reads {
    meta_parse.parse_width : exact;
  }
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
    apply(t_resubmit);
  }
  else if ( meta_ctrl.stage == NORM ) {
    apply(t_norm);
  }

  apply(t_set_first_table);
}
