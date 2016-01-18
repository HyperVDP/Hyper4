#define NO_BROADCAST 4

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
  modify_field(meta.egress, NO_BROADCAST);
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

action _no_op() {
  no_op();
}

table clone {
  reads {
    meta.egress : exact;
  }
  actions {
    mod_and_clone;
    _no_op;
    _drop;
  }
}

control egress {
  apply(clone);
}
