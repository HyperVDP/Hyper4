// next_action codes
#define PROCEED       0
#define INSPECT_SEB   1
#define INSPECT_20_29 2
#define INSPECT_30_39 3
#define INSPECT_40_49 4
#define INSPECT_50_59 5
#define INSPECT_60_69 6
#define INSPECT_70_79 7
#define INSPECT_80_89 8
#define INSPECT_90_99 9
#define EXTRACT_MORE  10

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
    state : 16; // this field is for the user; distinguishes states that can't be distinguished by numbytes alone
    next_action : 8;
  }
}

header_type ext_t {
  fields {
    data : 8;
  }
}
