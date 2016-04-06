/*
David Hancock
FLUX Research Group
University of Utah
dhancock@cs.utah.edu

HyPer4: A P4 Program to Run Other P4 Programs

hp4.p4: Define the ingress and egress pipelines, including multicast support.
*/

#include "includes/defines.p4"
#include "includes/headers.p4"
#include "includes/parse_opts.p4"
#include "includes/parser.p4"
#include "includes/setup.p4"
#include "includes/stages.p4"
#include "includes/checksums.p4"
//#include "includes/debug.p4"

metadata meta_ctrl_t meta_ctrl;
metadata meta_primitive_state_t meta_primitive_state;
metadata extracted_t extracted;
metadata tmeta_t tmeta;
metadata csum_t csum;

metadata intrinsic_metadata_t intrinsic_metadata;

control ingress {
  setup();

  if (meta_ctrl.stage == NORM) {
    if (meta_ctrl.next_table != DONE) {
      stage1();
      if (meta_ctrl.next_table != DONE) {
        stage2();
        if (meta_ctrl.next_table != DONE) {
          stage3();
        }
      }
    }
  }
}

field_list clone_fl {
  standard_metadata;
  meta_ctrl;
  extracted;
}

action mod_and_clone(port) {
  modify_field(meta_ctrl.multicast_current_egress, port);
  clone_egress_pkt_to_egress(port, clone_fl);
}

table t_multicast {
  reads {
    meta_ctrl.program : exact;
    meta_ctrl.multicast_seq_id : exact;
    meta_ctrl.multicast_current_egress : exact;
  }
  actions {
    mod_and_clone;
    _no_op;
  }
}

action a_prep_deparse_256() {
  modify_field(bitfield_256.data, extracted.data);
}

action a_prep_deparse_512() {
  modify_field(bitfield_512.data, extracted.data);
}

action a_prep_deparse_768() {
  modify_field(bitfield_768.data, extracted.data);
}

table prepare_for_deparsing {
  actions {
    a_prep_deparse_256;
    a_prep_deparse_512;
    a_prep_deparse_768;
  }
}

control egress {
  if(meta_ctrl.do_multicast == 1) {
    apply(t_multicast);
  }
  apply(csum16);
  apply(prepare_for_deparsing);
}
