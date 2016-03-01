/*
David Hancock
FLUX Research Group
University of Utah
dhancock@cs.utah.edu

HyPer4: A P4 Program to Run Other P4 Programs

multicast.p4: Provide multicast support.  The method is less efficient than
              a switch-specific mechanism, but it is portable.  The code
              here sets up multicasting, while hp4.p4 is where it is carried
              out.
*/

action a_multicast(seq_id, highport) {
  modify_field(meta_ctrl.multicast_seq_id, seq_id);
  modify_field(meta_ctrl.multicast_current_egress, highport);
  modify_field(meta_ctrl.do_multicast, 1);
  modify_field(standard_metadata.egress_spec, highport);
}

table t_multicast_11 {
  reads {
    meta_ctrl.program : exact;
  }
  actions {
    a_multicast;
  }
}

table t_multicast_12 {
  reads {
    meta_ctrl.program : exact;
  }
  actions {
    a_multicast;
  }
}

table t_multicast_13 {
  reads {
    meta_ctrl.program : exact;
  }
  actions {
    a_multicast;
  }
}

table t_multicast_21 {
  reads {
    meta_ctrl.program : exact;
  }
  actions {
    a_multicast;
  }
}

table t_multicast_22 {
  reads {
    meta_ctrl.program : exact;
  }
  actions {
    a_multicast;
  }
}

table t_multicast_23 {
  reads {
    meta_ctrl.program : exact;
  }
  actions {
    a_multicast;
  }
}

table t_multicast_31 {
  reads {
    meta_ctrl.program : exact;
  }
  actions {
    a_multicast;
  }
}

table t_multicast_32 {
  reads {
    meta_ctrl.program : exact;
  }
  actions {
    a_multicast;
  }
}

table t_multicast_33 {
  reads {
    meta_ctrl.program : exact;
  }
  actions {
    a_multicast;
  }
}

control do_multicast_11 {
  apply(t_multicast_11);
}

control do_multicast_12 {
  apply(t_multicast_12);
}

control do_multicast_13 {
  apply(t_multicast_13);
}

control do_multicast_21 {
  apply(t_multicast_21);
}

control do_multicast_22 {
  apply(t_multicast_22);
}

control do_multicast_23 {
  apply(t_multicast_23);
}

control do_multicast_31 {
  apply(t_multicast_31);
}

control do_multicast_32 {
  apply(t_multicast_32);
}

control do_multicast_33 {
  apply(t_multicast_33);
}