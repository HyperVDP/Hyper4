/*
DAVID HANCOCK
dhancock@cs.utah.edu
Flux Research Group
University of Utah

Define headers required by HyPer4
*/

// meta_parse: stores the parse width (e.g. 256 | 512 | 768): # bits to
// extract
header_type meta_parse_t {
  fields {
    parse_width : 16;
  }
}

// meta_ctrl: stores control stage (e.g. INIT, NORM), next table, stage
// state (e.g. CONTINUE, COMPLETE… to track whether a sequence of primitives
// is complete)
header_type meta_ctrl_t {
  fields {
    stage : 8; // e.g. INIT, NORM, etc.
    next_table : 8;
    stage_state : 8; // e.g. CONTINUE, COMPLETE
    multicast_current_egress : 8;
  }
}

// meta_primitive_state: information about a specific target primitive
header_type meta_primitive_state_t {
  fields {
    action_ID : 8; // identifies the compound action being executed
    match_ID : 8; // identifies the match entry
    primitive_index : 8; // place within compound action
    primitive : 8; // e.g. modify_field, add_header, etc.
    subtype : 8; // maps to a set identifying the parameters' types
  }
}

// meta_stdmeta: stores ID of standard metadata field on which to match during
// matching (when meta_ctrl.next_table == STDMETA_EXACT)
header_type meta_stdmeta_t {
  fields {
    stdmeta_ID : 8;
  }
}

// extracted: stores extracted data in a standard width field
header_type extracted_t {
  fields {
    data : 768;
  }
}

// meta: temporary storage for target metadata for use in matching
header_type tmeta_t {
  fields {
    tm_width : 8;
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

// tmeta_8_meta: for working with HyPer4's representation of the target's
// metadata
header_type tmeta_8_meta_t {
  fields {
    dstbyteindex : 16;
    srcbyteindex : 16;
  }
}

// tmeta_16_meta: for working with HyPer4's representation of the target's
// metadata
header_type tmeta_16_meta_t {
  fields {
    dstbyteindex : 16;
    srcbyteindex : 16;
  }
}

/*
header_type bitfield_8_t {
  fields {
    data : 8;
  }
}

header_type bitfield_32_t {
  fields {
    data : 32;
  }
}
*/

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
