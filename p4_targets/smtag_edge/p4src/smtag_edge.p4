/* Edge smtag switch */

#define NO_BROADCAST 4

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

action a_strip_smtag() {
  modify_field(ethernet.ethertype, smtag.ethertype);
  remove_header(smtag);
}

table strip_smtag {
  reads {
    smtag : valid;
  }
  actions {
    a_strip_smtag;
    _no_op;
  }
}

action a_local_switching(port) {
  modify_field(standard_metadata.egress_spec, port);
  modify_field(meta.egress, NO_BROADCAST);
}

action add_smTag(up, down) {
  add_header(smtag);
  // Copy ethertype to smTag
  modify_field(smtag.ethertype, ethernet.ethertype);

  // Set ethernet.ethertype to sigal smTag
  modify_field(ethernet.ethertype, 0xbaaa);

  // Add the tag source routing information
  modify_field(smtag.up, up);
  modify_field(smtag.down, down);

  // Set the destination egress port as well from the tag info
  modify_field(standard_metadata.egress_spec, up);
}

action broadcast(port) {
  modify_field(standard_metadata.egress_spec, port);
  modify_field(meta.egress, port);
}

table switching {
  reads {
    ethernet.dst_addr : exact;
  }
  actions {
    a_local_switching;
    add_smTag;
    broadcast;
  }
}

control ingress {
  apply(strip_smtag);
  apply(switching);
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
