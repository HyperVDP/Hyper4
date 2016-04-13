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
//#include "includes/parse_opts.p4"
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

/*
action a_prep_deparse_256() {
  modify_field(bitfield_256.data, extracted.data);
}

action a_prep_deparse_512() {
  modify_field(bitfield_512.data, extracted.data);
}

action a_prep_deparse_768() {
  modify_field(bitfield_768.data, extracted.data);
}
*/

action a_prep_deparse_SEB() {
  modify_field(ext[0].data, extracted.data >> 792);
  modify_field(ext[1].data, (extracted.data >> 784) & 0xFF);
  modify_field(ext[2].data, (extracted.data >> 776) & 0xFF);
  modify_field(ext[3].data, (extracted.data >> 768) & 0xFF);
  modify_field(ext[4].data, (extracted.data >> 760) & 0xFF);
  modify_field(ext[5].data, (extracted.data >> 752) & 0xFF);
  modify_field(ext[6].data, (extracted.data >> 744) & 0xFF);
  modify_field(ext[7].data, (extracted.data >> 736) & 0xFF);
  modify_field(ext[8].data, (extracted.data >> 728) & 0xFF);
  modify_field(ext[9].data, (extracted.data >> 720) & 0xFF);
  modify_field(ext[10].data, (extracted.data >> 712) & 0xFF);
  modify_field(ext[11].data, (extracted.data >> 704) & 0xFF);
  modify_field(ext[12].data, (extracted.data >> 696) & 0xFF);
  modify_field(ext[13].data, (extracted.data >> 688) & 0xFF);
  modify_field(ext[14].data, (extracted.data >> 680) & 0xFF);
  modify_field(ext[15].data, (extracted.data >> 672) & 0xFF);
  modify_field(ext[16].data, (extracted.data >> 664) & 0xFF);
  modify_field(ext[17].data, (extracted.data >> 656) & 0xFF);
  modify_field(ext[18].data, (extracted.data >> 648) & 0xFF);
  modify_field(ext[19].data, (extracted.data >> 640) & 0xFF);
}

table t_prep_deparse_SEB {
  actions {
    //a_prep_deparse_256;
    //a_prep_deparse_512;
    //a_prep_deparse_768;
    a_prep_deparse_SEB;
  }
}

action a_prep_deparse_20_39() {
  modify_field(ext[20].data, (extracted.data >> 632) & 0xFF);
  modify_field(ext[21].data, (extracted.data >> 624) & 0xFF);
  modify_field(ext[22].data, (extracted.data >> 616) & 0xFF);
  modify_field(ext[23].data, (extracted.data >> 608) & 0xFF);
  modify_field(ext[24].data, (extracted.data >> 600) & 0xFF);
  modify_field(ext[25].data, (extracted.data >> 592) & 0xFF);
  modify_field(ext[26].data, (extracted.data >> 584) & 0xFF);
  modify_field(ext[27].data, (extracted.data >> 576) & 0xFF);
  modify_field(ext[28].data, (extracted.data >> 568) & 0xFF);
  modify_field(ext[29].data, (extracted.data >> 560) & 0xFF);
  modify_field(ext[30].data, (extracted.data >> 552) & 0xFF);
  modify_field(ext[31].data, (extracted.data >> 544) & 0xFF);
  modify_field(ext[32].data, (extracted.data >> 536) & 0xFF);
  modify_field(ext[33].data, (extracted.data >> 528) & 0xFF);
  modify_field(ext[34].data, (extracted.data >> 520) & 0xFF);
  modify_field(ext[35].data, (extracted.data >> 512) & 0xFF);
  modify_field(ext[36].data, (extracted.data >> 504) & 0xFF);
  modify_field(ext[37].data, (extracted.data >> 496) & 0xFF);
  modify_field(ext[38].data, (extracted.data >> 488) & 0xFF);
  modify_field(ext[39].data, (extracted.data >> 480) & 0xFF);
}

table t_prep_deparse_20_39 {
  actions {
    a_prep_deparse_20_39;
  }
}

control egress {
  if(meta_ctrl.do_multicast == 1) {
    apply(t_multicast);
  }
  apply(csum16);
  apply(t_prep_deparse_SEB);
  if(parse_ctrl.numbytes > 20) {
    apply(t_prep_deparse_20_39); //etc.
  }
}
