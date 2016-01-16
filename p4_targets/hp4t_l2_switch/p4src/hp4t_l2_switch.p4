header_type ethernet_t {
    fields {
        dstAddr : 48;
        srcAddr : 48;
        etherType : 16;
    }
}

header_type meta_t {
  fields {
    egress : 8;
  }
}

header ethernet_t ethernet;
metadata meta_t meta;

parser start {
  extract(ethernet);
  return ingress;
}

action _drop() {
  drop();
}

action forward(port) {
  modify_field(standard_metadata.egress_spec, port);
}

field_list clone_fl {
  standard_metadata;
  meta;
}

action broadcast(port) {
  modify_field(standard_metadata.egress_spec, port);
  modify_field(meta.egress, port);
}

table dmac {
  reads {
      ethernet.dstAddr : exact;
  }
  actions {
      forward;
      broadcast;
      _drop;
  }
  size : 512;
}

control ingress {
  apply(dmac);
}

action mod_and_clone(port) {
  modify_field(meta.egress, port);
  clone_egress_pkt_to_egress(port, clone_fl);
}

table clone {
  reads {
    meta.egress : exact;
  }
  actions {
    mod_and_clone;
  }
}

table t_drop { actions { _drop; }}

control egress {
  if(meta.egress > 0) {
    apply(clone);
  } else {
    apply(t_drop);
  }
}
