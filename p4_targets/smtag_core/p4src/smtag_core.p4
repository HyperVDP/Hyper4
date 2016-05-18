/* Core smtag switch */

#define NO_BROADCAST 3

header_type ethernet_t {
  fields {
    dst_addr : 48;
    src_addr : 48;
    ethertype : 16;
  } // 14 B / 112 b
}

// simple mTag
header_type smTag_t {
  fields {
    up : 8;
    down : 8;
    ethertype : 16; // Ethertype of encapped packet
  }
}

header_type meta_t {
  fields {
    egress : 8;
  }
}

header ethernet_t ethernet;
header smTag_t smtag;
metadata meta_t meta;

parser start {
  extract(ethernet);
  return select(ethernet.ethertype) {
    0xbaaa: smtag;
    default: ingress;
  }
}

parser smtag {
  extract(smtag);
  return ingress;
}

action _no_op() {
}

action a_fwd(port) {
  modify_field(standard_metadata.egress_spec, port);
  modify_field(meta.egress, NO_BROADCAST);
}

table smtag_fwd {
  reads {
    smtag.down : exact;
  }
  actions {
    a_fwd;
    _no_op;
  }
}

action smtag_is_present() {
}

action no_smtag() {
}

table is_smtag_present {
  reads {
    smtag : valid;
  }
  actions {
    smtag_is_present;
    no_smtag;
  }
}

action broadcast(port) {
  modify_field(standard_metadata.egress_spec, port);
  modify_field(meta.egress, port);
}

table eth_fwd {
  reads {
    ethernet.dst_addr : exact;
  }
  actions {
    a_fwd;
    broadcast;
  }
}

control ingress {
  apply(is_smtag_present) {
    smtag_is_present {
      apply(smtag_fwd);
    }
    no_smtag {
      apply(eth_fwd);
    }
  }
}

field_list clone_fl {
  standard_metadata;
  meta;
}

action mod_and_clone(port) {
  modify_field(meta.egress, port);
  clone_egress_pkt_to_egress(port, clone_fl);
}

action _drop() {
  drop();
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
