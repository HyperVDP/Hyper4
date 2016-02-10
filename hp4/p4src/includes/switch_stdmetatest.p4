/*
David Hancock
FLUX Research Group
University of Utah
dhancock@cs.utah.edu

HyPer4: A P4 Program to Run Other P4 Programs

switch_stdmeta.p4: Handles table matching: exact, using standard metadata
*/


table t1_stdmeta_ingressport {
  reads {
    meta_ctrl.program : exact;
    standard_metadata.ingressport : exact;
  }
  actions {
    init_program_state;
  }
}

table t1_stdmeta_packetlength {
  reads {
    meta_ctrl.program : exact;
    standard_metadata.packetlength : exact;
  }
  actions {
    init_program_state;
  }
}

table t1_stdmeta_insttype {
  reads {
    meta_ctrl.program : exact;
    standard_metadata.insttype : exact;
  }
  actions {
    init_program_state;
  }
}

table t1_stdmeta_egressspec {
  reads {
    meta_ctrl.program : exact;
    standard_metadata.egressspec : exact;
  }
  actions {
    init_program_state;
  }
}

table t2_stdmeta_ingressport {
  reads {
    meta_ctrl.program : exact;
    standard_metadata.ingressport : exact;
  }
  actions {
    init_program_state;
  }
}

table t2_stdmeta_packetlength {
  reads {
    meta_ctrl.program : exact;
    standard_metadata.packetlength : exact;
  }
  actions {
    init_program_state;
  }
}

table t2_stdmeta_insttype {
  reads {
    meta_ctrl.program : exact;
    standard_metadata.insttype : exact;
  }
  actions {
    init_program_state;
  }
}

table t2_stdmeta_egressspec {
  reads {
    meta_ctrl.program : exact;
    standard_metadata.egressspec : exact;
  }
  actions {
    init_program_state;
  }
}

table t3_stdmeta_ingressport {
  reads {
    meta_ctrl.program : exact;
    standard_metadata.ingressport : exact;
  }
  actions {
    init_program_state;
  }
}

table t3_stdmeta_packetlength {
  reads {
    meta_ctrl.program : exact;
    standard_metadata.packetlength : exact;
  }
  actions {
    init_program_state;
  }
}

table t3_stdmeta_insttype {
  reads {
    meta_ctrl.program : exact;
    standard_metadata.insttype : exact;
  }
  actions {
    init_program_state;
  }
}

table t3_stdmeta_egressspec {
  reads {
    meta_ctrl.program : exact;
    standard_metadata.egressspec : exact;
  }
  actions {
    init_program_state;
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
  else if(meta_stdmeta.stdmeta_ID == STDMETA_EGRESSSPEC) {
    apply(t1_stdmeta_egressspec);
  }
}

control switch_stdmeta_2 {
  if(meta_stdmeta.stdmeta_ID == STDMETA_INGRESSPORT) {
    apply(t2_stdmeta_ingressport);
  }
  else if(meta_stdmeta.stdmeta_ID == STDMETA_PACKETLENGTH) {
    apply(t2_stdmeta_packetlength);
  }
  else if(meta_stdmeta.stdmeta_ID == STDMETA_INSTTYPE) {
    apply(t2_stdmeta_insttype);
  }
  else if(meta_stdmeta.stdmeta_ID == STDMETA_EGRESSSPEC) {
    apply(t2_stdmeta_egressspec);
  }
}

control switch_stdmeta_3 {
  if(meta_stdmeta.stdmeta_ID == STDMETA_INGRESSPORT) {
    apply(t3_stdmeta_ingressport);
  }
  else if(meta_stdmeta.stdmeta_ID == STDMETA_PACKETLENGTH) {
    apply(t3_stdmeta_packetlength);
  }
  else if(meta_stdmeta.stdmeta_ID == STDMETA_INSTTYPE) {
    apply(t3_stdmeta_insttype);
  }
  else if(meta_stdmeta.stdmeta_ID == STDMETA_EGRESSSPEC) {
    apply(t3_stdmeta_egressspec);
  }
}