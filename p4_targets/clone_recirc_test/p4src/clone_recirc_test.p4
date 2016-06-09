// Demo that a packet can be marked for both cloning AND recirculation

header_type meta_t {
  fields {
    val1 : 8;
    val2 : 8;
  }
}

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

metadata meta_t meta;
metadata intrinsic_metadata_t intrinsic_metadata;

parser start {
  return ingress;
}

action a_set_egress(port) {
  modify_field(standard_metadata.egress_spec, port);
}

table set_egress {
  reads {
    standard_metadata.ingress_port : exact;
  }
  actions {
    a_set_egress;
  }
}

control ingress {
  apply(set_egress);
}

field_list fl_clone {
  standard_metadata;
  meta.val1;
}

field_list fl_recirc {
  standard_metadata;
  meta.val2;
}

action clone_and_recirc(port) {
  modify_field(meta.val1, 1);
  modify_field(meta.val2, 1);
  recirculate(fl_recirc);
  clone_egress_pkt_to_egress(port, fl_clone);
}

action _no_op() {
}

table check {
  reads {
    standard_metadata.egress_port : exact;
    meta.val1 : exact;
    meta.val2 : exact;
  }
  actions {
    clone_and_recirc;
    _no_op;
  }
}

control egress {
  apply(check);
}
