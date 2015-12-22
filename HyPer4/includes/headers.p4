// new_headers.p4

header_type meta_parse_t {
  fields {
    parse_width : 16;
  }
}

header_type meta_ctrl_t {
  fields {
    stage : 8; // e.g. INIT, NORM, etc.
    next_table : 8;
    stage_state : 8; // e.g. CONTINUE, COMPLETE
  }
}

header_type meta_prog_state_t {
  fields {
    action_ID : 8;
    primitive_index : 8;
  }
}

header_type meta_primitive_metadata_t {
  fields {
    type : 8;
    subtype : 8;
  }
}

header_type stdmeta_match_t {
  fields {
    stdmeta_ID : 8;
  }
}

header_type extracted_t {
  fields {
    data : 768;
  }
}

header_type meta_t {
  fields {
    width : 8;
    num : 8;

    // indices for tmeta_8_r / tmeta_16_r
    i_0 : 8;
    i_1 : 8;
    i_2 : 8;
    i_3 : 8;
    i_4 : 8;
    i_5 : 8;
    i_6 : 8;
    i_7 : 8;
    i_8 : 8;
    i_9 : 8;
    i_10 : 8;
    i_11 : 8;
    i_12 : 8;
    i_13 : 8;
    i_14 : 8;
    i_15 : 8;

    // store values pulled from tmeta_8_r / tmeta_16_r
    field00 : 16;
    field01 : 16;
    field02 : 16;
    field03 : 16;
    field04 : 16;
    field05 : 16;
    field06 : 16;
    field07 : 16;
    field08 : 16;
    field09 : 16;
    field10 : 16;
    field11 : 16;
    field12 : 16;
    field13 : 16;
    field14 : 16;
    field15 : 16;
  }
}

header_type tmeta_8_meta_t {
  fields {
    dstbyteindex : 16;
    srcbyteindex : 16;
  }
}

header_type tmeta_16_meta_t {
  fields {
    dstbyteindex : 16;
    srcbyteindex : 16;
  }
}

header_type bitfield_256_t {
  fields {
    data : 256;
  }
}

header_type bitfield_512_t {
  fields {
    data : 512;
  }
}

header_type bitfield_768_t {
  fields {
    data : 768;
  }
}
