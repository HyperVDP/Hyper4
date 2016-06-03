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
#include "includes/checksums.p4"
#include "includes/resize_pr.p4"
//#include "includes/debug.p4"

metadata meta_ctrl_t meta_ctrl;
metadata meta_primitive_state_t meta_primitive_state;
metadata extracted_t extracted;
metadata tmeta_t tmeta;
metadata csum_t csum;

metadata intrinsic_metadata_t intrinsic_metadata;

action a_mc_skip() {
  modify_field(standard_metadata.egress_spec, standard_metadata.egress_spec - 1);
  modify_field(meta_ctrl.multicast_current_egress, meta_ctrl.multicast_current_egress - 1);
}

table mc_skip {
  reads {
    standard_metadata.egress_spec : exact;
  }
  actions {
    a_mc_skip;
    a_drop;
  }
}

action a_set_dest_port(port) {
  modify_field(standard_metadata.egress_spec, standard_metadata.ingress_port);
  modify_field(meta_ctrl.virt_dest_port, port);
}

table t_link {
  reads {
    meta_ctrl.program : exact;
    standard_metadata.egress_spec : exact;
  }
  actions {
    a_set_dest_port;
    _no_op;
    _drop;
  }
}

control ingress {
  setup();

  if (meta_ctrl.stage == NORM) { //_condition_15
    if (meta_ctrl.next_table != DONE and meta_ctrl.next_stage == 1) { //_condition_16
      stage1();
    }
    if (meta_ctrl.next_table != DONE and meta_ctrl.next_stage == 2) {
      stage2();
    }
    if (meta_ctrl.next_table != DONE and meta_ctrl.next_stage == 3) {
      stage3();
    }
    if (meta_ctrl.next_table != DONE and meta_ctrl.next_stage == 4) {
      stage4();
    }
  }
  if (meta_ctrl.do_multicast == 1) {
    if (standard_metadata.egress_spec == standard_metadata.ingress_port) {
      apply(mc_skip);
    }
  }
/*
  if (standard_metadata.egress_spec == VIRT_NET) {
    apply(t_prep_virt_net);
  }
*/
  apply(t_link);
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
    standard_metadata.ingress_port : ternary;
  }
  actions {
    mod_and_clone;
    _no_op;
  }
}

action a_prep_deparse_SEB() {
  modify_field(ext[0].data, (extracted.data >> 792) & 0xFF);
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

table t_prep_deparse_20_39{
  actions {
    a_prep_deparse_20_39;
  }
}

action a_prep_deparse_40_59() {
  modify_field(ext[40].data, (extracted.data >> 472) & 0xFF);
  modify_field(ext[41].data, (extracted.data >> 464) & 0xFF);
  modify_field(ext[42].data, (extracted.data >> 456) & 0xFF);
  modify_field(ext[43].data, (extracted.data >> 448) & 0xFF);
  modify_field(ext[44].data, (extracted.data >> 440) & 0xFF);
  modify_field(ext[45].data, (extracted.data >> 432) & 0xFF);
  modify_field(ext[46].data, (extracted.data >> 424) & 0xFF);
  modify_field(ext[47].data, (extracted.data >> 416) & 0xFF);
  modify_field(ext[48].data, (extracted.data >> 408) & 0xFF);
  modify_field(ext[49].data, (extracted.data >> 400) & 0xFF);
  modify_field(ext[50].data, (extracted.data >> 392) & 0xFF);
  modify_field(ext[51].data, (extracted.data >> 384) & 0xFF);
  modify_field(ext[52].data, (extracted.data >> 376) & 0xFF);
  modify_field(ext[53].data, (extracted.data >> 368) & 0xFF);
  modify_field(ext[54].data, (extracted.data >> 360) & 0xFF);
  modify_field(ext[55].data, (extracted.data >> 352) & 0xFF);
  modify_field(ext[56].data, (extracted.data >> 344) & 0xFF);
  modify_field(ext[57].data, (extracted.data >> 336) & 0xFF);
  modify_field(ext[58].data, (extracted.data >> 328) & 0xFF);
  modify_field(ext[59].data, (extracted.data >> 320) & 0xFF);
}

table t_prep_deparse_40_59{
  actions {
    a_prep_deparse_40_59;
  }
}

action a_prep_deparse_60_79() {
  modify_field(ext[60].data, (extracted.data >> 312) & 0xFF);
  modify_field(ext[61].data, (extracted.data >> 304) & 0xFF);
  modify_field(ext[62].data, (extracted.data >> 296) & 0xFF);
  modify_field(ext[63].data, (extracted.data >> 288) & 0xFF);
  modify_field(ext[64].data, (extracted.data >> 280) & 0xFF);
  modify_field(ext[65].data, (extracted.data >> 272) & 0xFF);
  modify_field(ext[66].data, (extracted.data >> 264) & 0xFF);
  modify_field(ext[67].data, (extracted.data >> 256) & 0xFF);
  modify_field(ext[68].data, (extracted.data >> 248) & 0xFF);
  modify_field(ext[69].data, (extracted.data >> 240) & 0xFF);
  modify_field(ext[70].data, (extracted.data >> 232) & 0xFF);
  modify_field(ext[71].data, (extracted.data >> 224) & 0xFF);
  modify_field(ext[72].data, (extracted.data >> 216) & 0xFF);
  modify_field(ext[73].data, (extracted.data >> 208) & 0xFF);
  modify_field(ext[74].data, (extracted.data >> 200) & 0xFF);
  modify_field(ext[75].data, (extracted.data >> 192) & 0xFF);
  modify_field(ext[76].data, (extracted.data >> 184) & 0xFF);
  modify_field(ext[77].data, (extracted.data >> 176) & 0xFF);
  modify_field(ext[78].data, (extracted.data >> 168) & 0xFF);
  modify_field(ext[79].data, (extracted.data >> 160) & 0xFF);
}

table t_prep_deparse_60_79{
  actions {
    a_prep_deparse_60_79;
  }
}

action a_prep_deparse_80_99() {
  modify_field(ext[80].data, (extracted.data >> 152) & 0xFF);
  modify_field(ext[81].data, (extracted.data >> 144) & 0xFF);
  modify_field(ext[82].data, (extracted.data >> 136) & 0xFF);
  modify_field(ext[83].data, (extracted.data >> 128) & 0xFF);
  modify_field(ext[84].data, (extracted.data >> 120) & 0xFF);
  modify_field(ext[85].data, (extracted.data >> 112) & 0xFF);
  modify_field(ext[86].data, (extracted.data >> 104) & 0xFF);
  modify_field(ext[87].data, (extracted.data >> 96) & 0xFF);
  modify_field(ext[88].data, (extracted.data >> 88) & 0xFF);
  modify_field(ext[89].data, (extracted.data >> 80) & 0xFF);
  modify_field(ext[90].data, (extracted.data >> 72) & 0xFF);
  modify_field(ext[91].data, (extracted.data >> 64) & 0xFF);
  modify_field(ext[92].data, (extracted.data >> 56) & 0xFF);
  modify_field(ext[93].data, (extracted.data >> 48) & 0xFF);
  modify_field(ext[94].data, (extracted.data >> 40) & 0xFF);
  modify_field(ext[95].data, (extracted.data >> 32) & 0xFF);
  modify_field(ext[96].data, (extracted.data >> 24) & 0xFF);
  modify_field(ext[97].data, (extracted.data >> 16) & 0xFF);
  modify_field(ext[98].data, (extracted.data >> 8) & 0xFF);
  modify_field(ext[99].data, (extracted.data >> 0) & 0xFF);
}

table t_prep_deparse_80_99{
  actions {
    a_prep_deparse_80_99;
  }
}

field_list fl_virt_net {
  meta_ctrl.program;
  meta_ctrl.virt_dest_port;
  standard_metadata;
}

action a_virt_net(next_prog) {
  modify_field(meta_ctrl.program, next_prog);
  recirculate(fl_virt_net);
}

table t_virt_net {
  reads {
    meta_ctrl.program : exact;
    meta_ctrl.virt_dest_port : exact;
  }
  actions {
    _no_op;
    a_virt_net;
  }
}

control egress {
  if(meta_ctrl.do_multicast == 1) {
    apply(t_multicast);
  }
  apply(csum16);
  apply(t_resize_pr);
  apply(t_prep_deparse_SEB);
  if(parse_ctrl.numbytes > 20) { // 341
    apply(t_prep_deparse_20_39);
    if(parse_ctrl.numbytes > 40) { // 342
      apply(t_prep_deparse_40_59);
      if(parse_ctrl.numbytes > 60) { // 343
        apply(t_prep_deparse_60_79);
        if(parse_ctrl.numbytes > 80) { // 344
          apply(t_prep_deparse_80_99);
        }
      }
    }
  }

  apply(t_virt_net);
}
