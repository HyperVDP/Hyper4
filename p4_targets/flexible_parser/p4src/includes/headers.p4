#define PROCEED       0
#define INSPECT_SEB   1
#define INSPECT_20_29 2
#define INSPECT_30_39 3
#define INSPECT_40_49 4
#define EXTRACT_MORE  5

header_type intrinsic_metadata_t {
    fields {
        mcast_grp : 4;
        egress_rid : 4;
        mcast_hash : 16;
        lf_field_list : 32;
        resubmit_flag : 16;
    }
}

header_type parse_ctrl_t {
  fields {
    numbytes : 16;
    state : 8;
    next_action : 8;
  }
}

header_type ext_t {
  fields {
    data : 8;
  }
}
