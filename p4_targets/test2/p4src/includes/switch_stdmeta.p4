table t1_stdmeta_ingressport {
  reads {
    standard_metadata.ingress_port : exact;
  }
  actions {
    set_program_state;
  }
}

table t1_stdmeta_packetlength {
  reads {
    standard_metadata.packet_length : exact;
  }
  actions {
    set_program_state;
  }
}

table t1_stdmeta_insttype {
  reads {
    standard_metadata.instance_type : exact;
  }
  actions {
    set_program_state;
  }
}

control switch_stdmeta_1 {
  if(meta_stdmeta.stdmeta_ID == STDMETA_INGRESSPORT) {
    apply(t1_stdmeta_ingressport);
  }
  else if(meta_stdmeta.stdmeta_ID == STDMETA_PACKETLENGTH) {
    apply(t1_stdmeta_packetlength);
  }
  else if(meta_stdmeta.stdmeta_ID == STDMETA_INSTTYPE) {
    apply(t1_stdmeta_insttype);
  }
}
