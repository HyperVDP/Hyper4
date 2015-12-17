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
