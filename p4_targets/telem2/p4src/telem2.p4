#define INIT	0
#define FORWARD	1
#define NOTYET	0
#define YES	1

header_type meta_ctrl_t {
  fields {
    stage : 8;
    has_resubmitted : 8;
  }
}

header_type intrinsic_metadata_t {
  fields {
        mcast_grp : 4;
        egress_rid : 4;
        mcast_hash : 16;
        lf_field_list : 32;
        resubmit_flag : 16;
  }
}

metadata meta_ctrl_t meta_ctrl;
metadata intrinsic_metadata_t intrinsic_metadata;

parser start {
  return select(meta_ctrl.has_resubmitted) {
    YES: parse_update_stage;
    default: ingress;
  }
}

parser parse_update_stage {
  set_metadata(meta_ctrl.stage, FORWARD);
  return ingress;
}

action set_egr(egress_spec) {
    modify_field(standard_metadata.egress_spec, egress_spec);
}

table forward {
    reads {
        standard_metadata.ingress_port : exact;
    }
    actions {
        set_egr;
    }
}

field_list f_packet_init {
  meta_ctrl;
  standard_metadata;
}

action a_packet_init() {
  modify_field(meta_ctrl.has_resubmitted, YES);
  resubmit(f_packet_init);
}

table t_packet_init {
  actions {
    a_packet_init;
  }
}

control ingress {
  if (meta_ctrl.stage == INIT) {
    apply(t_packet_init);
  } else if (meta_ctrl.stage == FORWARD) {
    apply(forward);
  }
}

control egress {
}
