header_type meta_t {
  fields {
    egress : 8;
    seq_id : 8;
  }
}

metadata meta_t meta;

parser start {
  return ingress;
}

action a_hub(seq_id, startport) {
  modify_field(standard_metadata.egress_spec, startport);
  modify_field(meta.egress, startport);
  modify_field(meta.seq_id, seq_id);
}

table t_hub {
  reads {
    standard_metadata.ingress_port : exact;
  }
  actions {
    a_hub;
  }
}

control ingress {
  apply(t_hub);
}

field_list clone_fl {
  standard_metadata;
  meta;
}

action a_next(nextport) {
  modify_field(meta.egress, nextport);
  clone_egress_pkt_to_egress(nextport, clone_fl);
}

action _no_op() {
  no_op();
}

table t_next {
  reads {
    meta.seq_id : exact;
    meta.egress : exact;
  }
  actions {
    a_next;
    _no_op;
  }
}

control egress {
  apply(t_next); 
}
