#include "defines.p4"

table t1_stdmeta_ingressport_1 {
  reads {
    standard_metadata.ingress_port : exact;
  }
  actions {
    set_program_state;
  }
}

table t1_stdmeta_packetlength_1 {
  reads {
    standard_metadata.packet_length : exact;
  }
  actions {
    set_program_state;
  }
}

table t1_stdmeta_insttype_1 {
  reads {
    standard_metadata.instance_type : exact;
  }
  actions {
    set_program_state;
  }
}

table t1_stdmeta_parserstat_1 {
  reads {
    standard_metadata.parser_status : exact;
  }
  actions {
    set_program_state;
  }
}

table t1_stdmeta_parsererror_1 {
  reads {
    standard_metadata.parser_error_location : exact;
  }
  actions {
    set_program_state;
  }
}

control switch_stdmeta_1 {
  if(stdmeta_match.stdmeta_ID == STDMETA_INGRESSPORT) {
    apply(t1_stdmeta_ingressport_1);
  }
  else if(stdmeta_match.stdmeta_ID == STDMETA_PACKETLENGTH) {
    apply(t1_stdmeta_packetlength_1);
  }
  else if(stdmeta_match.stdmeta_ID == STDMETA_INSTTYPE) {
    apply(t1_stdmeta_insttype_1);
  }
  else if(stdmeta_match.stdmeta_ID == STDMETA_PARSERSTAT) {
    apply(t1_stdmeta_parserstat_1);
  }
  else if(stdmeta_match.stdmeta_ID == PARSERERROR) {
    apply(t1_stdmeta_parsererror_1);
  }
}
