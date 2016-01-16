header_type extra_t {
  fields {
    preamble : 64;
    f1 : 8;
  }
}

header_type meta_t {
  fields {
    tmp : 8;
  }
}

header extra_t extra;
metadata meta_t meta;

parser start {
  return select(current(0, 64)) {
    0: parse_extra;
    default: ingress;
  }
}

parser parse_extra {
  extract(extra);
  return ingress;
}

field_list clone_fl {
   standard_metadata;
   extra;
}

action do_add_extra() {
  add_header(extra);
}

table add_extra { actions { do_add_extra; }}

action do_update_extra(value) {
  modify_field(extra.f1, value);
}

table update_extra { actions { do_update_extra; }}

action do_clone(clone_spec) {
  clone_ingress_pkt_to_egress(clone_spec, clone_fl);
}

table clone { actions { do_clone; }}

action do_mod_meta(value) {
  modify_field(meta.tmp, value);
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
  if(valid(extra)) {
    apply(add_extra);
  }
  apply(update_extra);
  apply(clone);
  apply(mod_meta);
  apply(forward);
}

action do_finalize() {
  modify_field(extra.f1, meta.tmp);
}

table finalize { actions { do_finalize; }}

control egress {
  apply(finalize);
}
