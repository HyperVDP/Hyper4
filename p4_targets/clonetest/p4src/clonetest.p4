parser start {
  return ingress;
}

field_list clone_fl {
  standard_metadata;
}

action cf(port, mirror_id) {
    modify_field(standard_metadata.egress_spec, port);
    clone_ingress_pkt_to_egress(mirror_id, clone_fl);
}

table clone_and_forward {
    reads {
        standard_metadata.ingress_port : exact;
    }
    actions {
        cf;
    }
}

control ingress {
    apply(clone_and_forward);
}

control egress {
}
