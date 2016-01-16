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

header_type extra_t {
  fields {
    preamble : 64;
    instance_type : 8;
    egress : 8;
  }
}

header ethernet_t ethernet;
header extra_t extra;
metadata meta_t meta;

parser start {
  return select(current(0, 64)) {
    0: parse_extra;
    default: parse_ethernet;
  }
}

parser parse_extra {
  extract(extra);
  return parse_ethernet;
}

parser parse_ethernet {
  extract(ethernet);
  return ingress;
}

field_list clone_fl {
   standard_metadata;
   meta;
   extra;
}

action do_add_extra() {
  add_header(extra);
}

table add_extra { actions { do_add_extra; }}

action do_update_extra() {
  modify_field(extra.instance_type, standard_metadata.instance_type);
}

table update_extra { actions { do_update_extra; }}

action do_clone(clone_spec) {
  clone_ingress_pkt_to_egress(clone_spec, clone_fl);
}

table clone { actions { do_clone; }}

action do_mod_meta(value) {
  modify_field(meta.egress, value);
}

table mod_meta { actions { do_mod_meta; }}

action do_forward(port) {
  modify_field(standard_metadata.egress_spec, port);
}

table forward {
  reads {
    standard_metadata.ingress_port : exact;
  }
  actions {
    do_forward;
  }
}

control ingress {
  if(not valid(extra)) {
    apply(add_extra);
  }
  apply(update_extra);
  apply(clone);
  apply(mod_meta);
  apply(forward);
}

action do_finalize() {
  modify_field(extra.egress, meta.egress);
}

table finalize { actions { do_finalize; }}

control egress {
  apply(finalize);
}
