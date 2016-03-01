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
#include "includes/parser.p4"
#include "includes/setup.p4"
#include "includes/stages.p4"

metadata meta_primitive_state_t meta_primitive_state;
metadata meta_stdmeta_t meta_stdmeta;
metadata extracted_t extracted;
metadata tmeta_t tmeta;
metadata csum_t csum;

// Unfortunately, despite the stated goal of HyPer4 to provide target independent features,
//  bmv2 requires this intrinsic metadata structure in order to do a resubmit
metadata intrinsic_metadata_t intrinsic_metadata;

control ingress {
      // setup.p4
      setup();

      if (meta_ctrl.stage == NORM) { // c02
      // stages.p4
      stage1();
      stage2();
      stage3();
      }
}

field_list clone_fl {
  standard_metadata;
  meta_ctrl;
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

action a_ipv4_csum16(rshift_base, div) {
  modify_field(csum.rshift, rshift_base);
  modify_field(csum.div, div);
  // dst low
  modify_field(csum.sum, csum.sum + ((extracted.data >> csum.rshift) & 0xFFFF));
  modify_field(csum.rshift, csum.rshift + csum.div);
  // dst high
  modify_field(csum.sum, csum.sum + ((extracted.data >> csum.rshift) & 0xFFFF));
  modify_field(csum.rshift, csum.rshift + csum.div);
  // src low
  modify_field(csum.sum, csum.sum + ((extracted.data >> csum.rshift) & 0xFFFF));
  modify_field(csum.rshift, csum.rshift + csum.div);
  // src high
  modify_field(csum.sum, csum.sum + ((extracted.data >> csum.rshift) & 0xFFFF));
  modify_field(csum.rshift, csum.rshift + csum.div);
  // skip csum
  modify_field(csum.rshift, csum.rshift + csum.div);
  // TTL+protocol
  modify_field(csum.sum, csum.sum + ((extracted.data >> csum.rshift) & 0xFFFF));
  modify_field(csum.rshift, csum.rshift + csum.div);
  // flags+frag offset
  modify_field(csum.sum, csum.sum + ((extracted.data >> csum.rshift) & 0xFFFF));
  modify_field(csum.rshift, csum.rshift + csum.div);
  // ID
  modify_field(csum.sum, csum.sum + ((extracted.data >> csum.rshift) & 0xFFFF));
  modify_field(csum.rshift, csum.rshift + csum.div);
  // totalLen
  modify_field(csum.sum, csum.sum + ((extracted.data >> csum.rshift) & 0xFFFF));
  modify_field(csum.rshift, csum.rshift + csum.div);
  // version+IHL+DSCP
  modify_field(csum.sum, csum.sum + ((extracted.data >> csum.rshift) & 0xFFFF));
  
  // add carry
  modify_field(csum.sum, (csum.sum + (csum.sum >> csum.div)) & 0xFFFF);

  // invert and store
  modify_field(csum.final, ~csum.sum);

  modify_field(csum.csmask, 0xFFFF << 304);
  modify_field(extracted.data, (extracted.data & ~csum.csmask) | ((csum.final << 304) & csum.csmask));
}

table csum16 {
  reads {
    meta_ctrl.program : exact;
  }
  actions {
    a_ipv4_csum16;
    _no_op;
  }
}

control egress {
  if(meta_ctrl.do_multicast == 1) {
    apply(t_multicast);
  }
  apply(csum16);
  apply(prepare_for_deparsing);
}
