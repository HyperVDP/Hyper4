// maps virtual port to physical port
action prep_phys_egress_single(port) {
  modify_field(standard_metadata.egress_spec, port);
  // modify_field(meta_ctrl.mc_flag, 0);
}

action prep_virt_egress_single(port) {
  modify_field(standard_metadata.egress_spec, standard_metadata.ingress_port);
  modify_field(meta_ctrl.virt_egress_port, port);
  // modify_field(meta_ctrl.mc_flag, 0);
}

action prep_phys_egress_mc(mcgrp) {
  modify_field(intrinsic_metadata.mcast_grp, mcgrp);
  modify_field(meta_ctrl.mc_flag, 1);
  // modify_field(meta_ctrl.virt_egress_port, 0);
}

action prep_virt_egress_mc(start_port) {
  modify_field(standard_metadata.egress_spec, standard_metadata.ingress_port);
  modify_field(meta_ctrl.virt_egress_port, start_port);
  modify_field(meta_ctrl.mc_flag, 1);
}

action prep_mix_egress_mc(start_virt_port) {
  modify_field(intrinsic_metadata.mcast_grp, mcgrp);
  modify_field(meta_ctrl.virt_egress_port, start_virt_port);
  modify_field(meta_ctrl.mc_flag, 1);
}

table t_link {
  reads {
    meta_ctrl.program : exact;
    standard_metadata.egress_spec : exact;
  }
  actions {
    prep_phys_egress_single;
    prep_virt_egress_single;
    prep_phys_egress_mc;
    prep_virt_egress_mc;
    prep_mix_egress_mc;
    _no_op;
    a_drop;
  }
}  

control ingress {
  //...
  apply(t_link);
}

field_list fl_virt_net {
  standard_metadata;
  meta_ctrl.program;
  meta_ctrl.virt_egress_port;
}

action a_virt_forward(next_prog) {
  modify_field(meta_ctrl.program, next_prog);
  recirculate(fl_virt_net);
}

field_list fl_clone {
  standard_metadata;
  meta_ctrl;
  extracted;
}

action a_virt_multicast(next_prog) {
  modify_field(meta_ctrl.clone_program, next_prog);
  clone_egress_pkt_to_egress(standard_metadata.egress_port, fl_clone);
  recirculate(fl_virt_net);
}

table t_virt_net {
  reads {
    meta_ctrl.program : exact;
    meta_ctrl.mc_flag : exact;
    meta_ctrl.virt_egress_port : exact;
  }
  actions {
    _no_op;
    a_virt_forward;
    a_virt_multicast;
  }
}

table mcast_src_pruning {
  actions {
      _no_op;
      a_drop;
  }
  size : 1;
}

action skip(programID, virt_egress_port) {
  modify_field(meta_ctrl.program, programID);
  modify_field(meta_ctrl.virt_egress_port, virt_egress_port);
}

// Idea is to skip to next program / port in the sequence if during
// virtual multicasting virt_ingress_port == virt_egress_port.
// Table entries should agree with those of t_virt_net.
table virt_mcast_src_pruning {
  reads {
    meta_ctrl.program : exact;
    meta_ctrl.virt_egress_port : exact;
  }
  actions {
      skip;
      _no_op;
      a_drop;
  }
}

action a_clone_cleanup() {
  modify_field(meta_ctrl.program, meta_ctrl.clone_program);
  modify_field(meta_ctrl.clone_program, 0);
}

table clone_cleanup {
  actions {
    a_clone_cleanup;
  }
}

control egress {
  if(meta_ctrl.clone_program > 0) {
    apply(clone_cleanup);
  }
  if(standard_metadata.egress_port == standard_metadata.ingress_port) {
    if(meta_ctrl.virt_egress_port == 0) { // phys_egress_mc needing filtering
      apply(mcast_src_pruning);
    }
    else { // virt_egress_single or virt_egress_mc, depending on meta_ctrl.mc_flag
      if(meta_ctrl.virt_ingress_port == meta_ctrl.virt_egress_port) {
        apply(virt_mcast_src_pruning);
      }
      apply(t_virt_net);
    }
  } // else phys_egress_single or phys_egress_mc; no_op
}
