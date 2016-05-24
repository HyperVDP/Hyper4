/*
David Hancock
FLUX Research Group
University of Utah
dhancock@cs.utah.edu

HyPer4: A P4 Program to Run Other P4 Programs

headers.p4: Define the headers required by HP4.
*/

header_type csum_t {
  fields {
    sum : 32;
    rshift : 16;
    div : 8;
    final : 16;
    csmask : 768;
  }
}

// Unfortunately, despite the stated goal of HyPer4 to provide target independent features,
//  bmv2 requires this intrinsic metadata structure in order to do a resubmit
header_type intrinsic_metadata_t {
  fields {
        mcast_grp : 4;
        egress_rid : 4;
        mcast_hash : 16;
        lf_field_list : 32;
        resubmit_flag : 16;
        recirculate_flag : 16;
  }
}

header_type parse_ctrl_t {
  fields {
    numbytes : 16;
    state : 16;
    next_action : 8;
  }
}

// meta_ctrl: stores control stage (e.g. INIT, NORM), next table, stage
// state (e.g. CONTINUE, COMPLETE… to track whether a sequence of primitives
// is complete)
header_type meta_ctrl_t {
  fields {
    program : 8; // identifies which program to run
    stage : 8; // e.g. INIT, NORM, etc.
    next_table : 8;
    stage_state : 8; // e.g. CONTINUE, COMPLETE
    multicast_current_egress : 8;
    multicast_seq_id : 8;
    do_multicast : 8;
    stdmeta_ID : 8;
    next_stage : 8;
    virt_net : 8;
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
    hmanip_remaining : 8;
  }
}

// tmeta: HyPer4's representation of the target's metadata
header_type tmeta_t {
  fields {
    data : 256;
    dcpy : 256;
  }
}

header_type ext_t {
  fields {
    data : 8;
  }
}

// extracted: stores extracted data in a standard width field
header_type extracted_t {
  fields {
    data : 800;
    dcpy : 800;
    validbits : 80;
  }
}
