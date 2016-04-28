/*
David Hancock
FLUX Research Group
University of Utah
dhancock@cs.utah.edu

HyPer4: A P4 Program to Run Other P4 Programs

add_header.p4: Carry out the add_header primitive
*/

action a_addh_prep(remaining) {
  modify_field(meta_primitive_state.hmanip_remaining, remaining);
}

table t_addh_prep_11 {
  reads {
    meta_ctrl.program : exact;
  }
  actions {
    a_addh_prep;
  }
}

table t_addh_prep_12 {
  reads {
    meta_ctrl.program : exact;
  }
  actions {
    a_addh_prep;
  }
}

table t_addh_prep_13 {
  reads {
    meta_ctrl.program : exact;
  }
  actions {
    a_addh_prep;
  }
}

table t_addh_prep_21 {
  reads {
    meta_ctrl.program : exact;
  }
  actions {
    a_addh_prep;
  }
}

table t_addh_prep_22 {
  reads {
    meta_ctrl.program : exact;
  }
  actions {
    a_addh_prep;
  }
}

table t_addh_prep_23 {
  reads {
    meta_ctrl.program : exact;
  }
  actions {
    a_addh_prep;
  }
}

table t_addh_prep_31 {
  reads {
    meta_ctrl.program : exact;
  }
  actions {
    a_addh_prep;
  }
}

table t_addh_prep_32 {
  reads {
    meta_ctrl.program : exact;
  }
  actions {
    a_addh_prep;
  }
}

table t_addh_prep_33 {
  reads {
    meta_ctrl.program : exact;
  }
  actions {
    a_addh_prep;
  }
}

action a_add_header_00_1() {
  add_header(ext[0]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_00_4() {
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_00_20() {
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  add_header(ext[0]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_01_1() {
  add_header(ext[1]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_01_4() {
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_01_20() {
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  add_header(ext[1]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_02_1() {
  add_header(ext[2]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_02_4() {
  add_header(ext[2]);
  add_header(ext[2]);
  add_header(ext[2]);
  add_header(ext[2]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_02_20() {
  add_header(ext[2]);
  add_header(ext[2]);
  add_header(ext[2]);
  add_header(ext[2]);
  add_header(ext[2]);
  add_header(ext[2]);
  add_header(ext[2]);
  add_header(ext[2]);
  add_header(ext[2]);
  add_header(ext[2]);
  add_header(ext[2]);
  add_header(ext[2]);
  add_header(ext[2]);
  add_header(ext[2]);
  add_header(ext[2]);
  add_header(ext[2]);
  add_header(ext[2]);
  add_header(ext[2]);
  add_header(ext[2]);
  add_header(ext[2]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_03_1() {
  add_header(ext[3]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_03_4() {
  add_header(ext[3]);
  add_header(ext[3]);
  add_header(ext[3]);
  add_header(ext[3]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_03_20() {
  add_header(ext[3]);
  add_header(ext[3]);
  add_header(ext[3]);
  add_header(ext[3]);
  add_header(ext[3]);
  add_header(ext[3]);
  add_header(ext[3]);
  add_header(ext[3]);
  add_header(ext[3]);
  add_header(ext[3]);
  add_header(ext[3]);
  add_header(ext[3]);
  add_header(ext[3]);
  add_header(ext[3]);
  add_header(ext[3]);
  add_header(ext[3]);
  add_header(ext[3]);
  add_header(ext[3]);
  add_header(ext[3]);
  add_header(ext[3]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_04_1() {
  add_header(ext[4]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_04_4() {
  add_header(ext[4]);
  add_header(ext[4]);
  add_header(ext[4]);
  add_header(ext[4]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_04_20() {
  add_header(ext[4]);
  add_header(ext[4]);
  add_header(ext[4]);
  add_header(ext[4]);
  add_header(ext[4]);
  add_header(ext[4]);
  add_header(ext[4]);
  add_header(ext[4]);
  add_header(ext[4]);
  add_header(ext[4]);
  add_header(ext[4]);
  add_header(ext[4]);
  add_header(ext[4]);
  add_header(ext[4]);
  add_header(ext[4]);
  add_header(ext[4]);
  add_header(ext[4]);
  add_header(ext[4]);
  add_header(ext[4]);
  add_header(ext[4]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_05_1() {
  add_header(ext[5]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_05_4() {
  add_header(ext[5]);
  add_header(ext[5]);
  add_header(ext[5]);
  add_header(ext[5]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_05_20() {
  add_header(ext[5]);
  add_header(ext[5]);
  add_header(ext[5]);
  add_header(ext[5]);
  add_header(ext[5]);
  add_header(ext[5]);
  add_header(ext[5]);
  add_header(ext[5]);
  add_header(ext[5]);
  add_header(ext[5]);
  add_header(ext[5]);
  add_header(ext[5]);
  add_header(ext[5]);
  add_header(ext[5]);
  add_header(ext[5]);
  add_header(ext[5]);
  add_header(ext[5]);
  add_header(ext[5]);
  add_header(ext[5]);
  add_header(ext[5]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_06_1() {
  add_header(ext[6]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_06_4() {
  add_header(ext[6]);
  add_header(ext[6]);
  add_header(ext[6]);
  add_header(ext[6]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_06_20() {
  add_header(ext[6]);
  add_header(ext[6]);
  add_header(ext[6]);
  add_header(ext[6]);
  add_header(ext[6]);
  add_header(ext[6]);
  add_header(ext[6]);
  add_header(ext[6]);
  add_header(ext[6]);
  add_header(ext[6]);
  add_header(ext[6]);
  add_header(ext[6]);
  add_header(ext[6]);
  add_header(ext[6]);
  add_header(ext[6]);
  add_header(ext[6]);
  add_header(ext[6]);
  add_header(ext[6]);
  add_header(ext[6]);
  add_header(ext[6]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_07_1() {
  add_header(ext[7]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_07_4() {
  add_header(ext[7]);
  add_header(ext[7]);
  add_header(ext[7]);
  add_header(ext[7]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_07_20() {
  add_header(ext[7]);
  add_header(ext[7]);
  add_header(ext[7]);
  add_header(ext[7]);
  add_header(ext[7]);
  add_header(ext[7]);
  add_header(ext[7]);
  add_header(ext[7]);
  add_header(ext[7]);
  add_header(ext[7]);
  add_header(ext[7]);
  add_header(ext[7]);
  add_header(ext[7]);
  add_header(ext[7]);
  add_header(ext[7]);
  add_header(ext[7]);
  add_header(ext[7]);
  add_header(ext[7]);
  add_header(ext[7]);
  add_header(ext[7]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_08_1() {
  add_header(ext[8]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_08_4() {
  add_header(ext[8]);
  add_header(ext[8]);
  add_header(ext[8]);
  add_header(ext[8]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_08_20() {
  add_header(ext[8]);
  add_header(ext[8]);
  add_header(ext[8]);
  add_header(ext[8]);
  add_header(ext[8]);
  add_header(ext[8]);
  add_header(ext[8]);
  add_header(ext[8]);
  add_header(ext[8]);
  add_header(ext[8]);
  add_header(ext[8]);
  add_header(ext[8]);
  add_header(ext[8]);
  add_header(ext[8]);
  add_header(ext[8]);
  add_header(ext[8]);
  add_header(ext[8]);
  add_header(ext[8]);
  add_header(ext[8]);
  add_header(ext[8]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_09_1() {
  add_header(ext[9]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_09_4() {
  add_header(ext[9]);
  add_header(ext[9]);
  add_header(ext[9]);
  add_header(ext[9]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_09_20() {
  add_header(ext[9]);
  add_header(ext[9]);
  add_header(ext[9]);
  add_header(ext[9]);
  add_header(ext[9]);
  add_header(ext[9]);
  add_header(ext[9]);
  add_header(ext[9]);
  add_header(ext[9]);
  add_header(ext[9]);
  add_header(ext[9]);
  add_header(ext[9]);
  add_header(ext[9]);
  add_header(ext[9]);
  add_header(ext[9]);
  add_header(ext[9]);
  add_header(ext[9]);
  add_header(ext[9]);
  add_header(ext[9]);
  add_header(ext[9]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_10_1() {
  add_header(ext[10]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_10_4() {
  add_header(ext[10]);
  add_header(ext[10]);
  add_header(ext[10]);
  add_header(ext[10]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_10_20() {
  add_header(ext[10]);
  add_header(ext[10]);
  add_header(ext[10]);
  add_header(ext[10]);
  add_header(ext[10]);
  add_header(ext[10]);
  add_header(ext[10]);
  add_header(ext[10]);
  add_header(ext[10]);
  add_header(ext[10]);
  add_header(ext[10]);
  add_header(ext[10]);
  add_header(ext[10]);
  add_header(ext[10]);
  add_header(ext[10]);
  add_header(ext[10]);
  add_header(ext[10]);
  add_header(ext[10]);
  add_header(ext[10]);
  add_header(ext[10]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_11_1() {
  add_header(ext[11]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_11_4() {
  add_header(ext[11]);
  add_header(ext[11]);
  add_header(ext[11]);
  add_header(ext[11]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_11_20() {
  add_header(ext[11]);
  add_header(ext[11]);
  add_header(ext[11]);
  add_header(ext[11]);
  add_header(ext[11]);
  add_header(ext[11]);
  add_header(ext[11]);
  add_header(ext[11]);
  add_header(ext[11]);
  add_header(ext[11]);
  add_header(ext[11]);
  add_header(ext[11]);
  add_header(ext[11]);
  add_header(ext[11]);
  add_header(ext[11]);
  add_header(ext[11]);
  add_header(ext[11]);
  add_header(ext[11]);
  add_header(ext[11]);
  add_header(ext[11]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_12_1() {
  add_header(ext[12]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_12_4() {
  add_header(ext[12]);
  add_header(ext[12]);
  add_header(ext[12]);
  add_header(ext[12]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_12_20() {
  add_header(ext[12]);
  add_header(ext[12]);
  add_header(ext[12]);
  add_header(ext[12]);
  add_header(ext[12]);
  add_header(ext[12]);
  add_header(ext[12]);
  add_header(ext[12]);
  add_header(ext[12]);
  add_header(ext[12]);
  add_header(ext[12]);
  add_header(ext[12]);
  add_header(ext[12]);
  add_header(ext[12]);
  add_header(ext[12]);
  add_header(ext[12]);
  add_header(ext[12]);
  add_header(ext[12]);
  add_header(ext[12]);
  add_header(ext[12]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_13_1() {
  add_header(ext[13]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_13_4() {
  add_header(ext[13]);
  add_header(ext[13]);
  add_header(ext[13]);
  add_header(ext[13]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_13_20() {
  add_header(ext[13]);
  add_header(ext[13]);
  add_header(ext[13]);
  add_header(ext[13]);
  add_header(ext[13]);
  add_header(ext[13]);
  add_header(ext[13]);
  add_header(ext[13]);
  add_header(ext[13]);
  add_header(ext[13]);
  add_header(ext[13]);
  add_header(ext[13]);
  add_header(ext[13]);
  add_header(ext[13]);
  add_header(ext[13]);
  add_header(ext[13]);
  add_header(ext[13]);
  add_header(ext[13]);
  add_header(ext[13]);
  add_header(ext[13]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_14_1() {
  add_header(ext[14]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_14_4() {
  add_header(ext[14]);
  add_header(ext[14]);
  add_header(ext[14]);
  add_header(ext[14]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_14_20() {
  add_header(ext[14]);
  add_header(ext[14]);
  add_header(ext[14]);
  add_header(ext[14]);
  add_header(ext[14]);
  add_header(ext[14]);
  add_header(ext[14]);
  add_header(ext[14]);
  add_header(ext[14]);
  add_header(ext[14]);
  add_header(ext[14]);
  add_header(ext[14]);
  add_header(ext[14]);
  add_header(ext[14]);
  add_header(ext[14]);
  add_header(ext[14]);
  add_header(ext[14]);
  add_header(ext[14]);
  add_header(ext[14]);
  add_header(ext[14]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_15_1() {
  add_header(ext[15]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_15_4() {
  add_header(ext[15]);
  add_header(ext[15]);
  add_header(ext[15]);
  add_header(ext[15]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_15_20() {
  add_header(ext[15]);
  add_header(ext[15]);
  add_header(ext[15]);
  add_header(ext[15]);
  add_header(ext[15]);
  add_header(ext[15]);
  add_header(ext[15]);
  add_header(ext[15]);
  add_header(ext[15]);
  add_header(ext[15]);
  add_header(ext[15]);
  add_header(ext[15]);
  add_header(ext[15]);
  add_header(ext[15]);
  add_header(ext[15]);
  add_header(ext[15]);
  add_header(ext[15]);
  add_header(ext[15]);
  add_header(ext[15]);
  add_header(ext[15]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_16_1() {
  add_header(ext[16]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_16_4() {
  add_header(ext[16]);
  add_header(ext[16]);
  add_header(ext[16]);
  add_header(ext[16]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_16_20() {
  add_header(ext[16]);
  add_header(ext[16]);
  add_header(ext[16]);
  add_header(ext[16]);
  add_header(ext[16]);
  add_header(ext[16]);
  add_header(ext[16]);
  add_header(ext[16]);
  add_header(ext[16]);
  add_header(ext[16]);
  add_header(ext[16]);
  add_header(ext[16]);
  add_header(ext[16]);
  add_header(ext[16]);
  add_header(ext[16]);
  add_header(ext[16]);
  add_header(ext[16]);
  add_header(ext[16]);
  add_header(ext[16]);
  add_header(ext[16]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_17_1() {
  add_header(ext[17]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_17_4() {
  add_header(ext[17]);
  add_header(ext[17]);
  add_header(ext[17]);
  add_header(ext[17]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_17_20() {
  add_header(ext[17]);
  add_header(ext[17]);
  add_header(ext[17]);
  add_header(ext[17]);
  add_header(ext[17]);
  add_header(ext[17]);
  add_header(ext[17]);
  add_header(ext[17]);
  add_header(ext[17]);
  add_header(ext[17]);
  add_header(ext[17]);
  add_header(ext[17]);
  add_header(ext[17]);
  add_header(ext[17]);
  add_header(ext[17]);
  add_header(ext[17]);
  add_header(ext[17]);
  add_header(ext[17]);
  add_header(ext[17]);
  add_header(ext[17]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_18_1() {
  add_header(ext[18]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_18_4() {
  add_header(ext[18]);
  add_header(ext[18]);
  add_header(ext[18]);
  add_header(ext[18]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_18_20() {
  add_header(ext[18]);
  add_header(ext[18]);
  add_header(ext[18]);
  add_header(ext[18]);
  add_header(ext[18]);
  add_header(ext[18]);
  add_header(ext[18]);
  add_header(ext[18]);
  add_header(ext[18]);
  add_header(ext[18]);
  add_header(ext[18]);
  add_header(ext[18]);
  add_header(ext[18]);
  add_header(ext[18]);
  add_header(ext[18]);
  add_header(ext[18]);
  add_header(ext[18]);
  add_header(ext[18]);
  add_header(ext[18]);
  add_header(ext[18]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_19_1() {
  add_header(ext[19]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_19_4() {
  add_header(ext[19]);
  add_header(ext[19]);
  add_header(ext[19]);
  add_header(ext[19]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_19_20() {
  add_header(ext[19]);
  add_header(ext[19]);
  add_header(ext[19]);
  add_header(ext[19]);
  add_header(ext[19]);
  add_header(ext[19]);
  add_header(ext[19]);
  add_header(ext[19]);
  add_header(ext[19]);
  add_header(ext[19]);
  add_header(ext[19]);
  add_header(ext[19]);
  add_header(ext[19]);
  add_header(ext[19]);
  add_header(ext[19]);
  add_header(ext[19]);
  add_header(ext[19]);
  add_header(ext[19]);
  add_header(ext[19]);
  add_header(ext[19]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_20_1() {
  add_header(ext[20]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_20_4() {
  add_header(ext[20]);
  add_header(ext[20]);
  add_header(ext[20]);
  add_header(ext[20]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_20_20() {
  add_header(ext[20]);
  add_header(ext[20]);
  add_header(ext[20]);
  add_header(ext[20]);
  add_header(ext[20]);
  add_header(ext[20]);
  add_header(ext[20]);
  add_header(ext[20]);
  add_header(ext[20]);
  add_header(ext[20]);
  add_header(ext[20]);
  add_header(ext[20]);
  add_header(ext[20]);
  add_header(ext[20]);
  add_header(ext[20]);
  add_header(ext[20]);
  add_header(ext[20]);
  add_header(ext[20]);
  add_header(ext[20]);
  add_header(ext[20]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_21_1() {
  add_header(ext[21]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_21_4() {
  add_header(ext[21]);
  add_header(ext[21]);
  add_header(ext[21]);
  add_header(ext[21]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_21_20() {
  add_header(ext[21]);
  add_header(ext[21]);
  add_header(ext[21]);
  add_header(ext[21]);
  add_header(ext[21]);
  add_header(ext[21]);
  add_header(ext[21]);
  add_header(ext[21]);
  add_header(ext[21]);
  add_header(ext[21]);
  add_header(ext[21]);
  add_header(ext[21]);
  add_header(ext[21]);
  add_header(ext[21]);
  add_header(ext[21]);
  add_header(ext[21]);
  add_header(ext[21]);
  add_header(ext[21]);
  add_header(ext[21]);
  add_header(ext[21]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_22_1() {
  add_header(ext[22]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_22_4() {
  add_header(ext[22]);
  add_header(ext[22]);
  add_header(ext[22]);
  add_header(ext[22]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_22_20() {
  add_header(ext[22]);
  add_header(ext[22]);
  add_header(ext[22]);
  add_header(ext[22]);
  add_header(ext[22]);
  add_header(ext[22]);
  add_header(ext[22]);
  add_header(ext[22]);
  add_header(ext[22]);
  add_header(ext[22]);
  add_header(ext[22]);
  add_header(ext[22]);
  add_header(ext[22]);
  add_header(ext[22]);
  add_header(ext[22]);
  add_header(ext[22]);
  add_header(ext[22]);
  add_header(ext[22]);
  add_header(ext[22]);
  add_header(ext[22]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_23_1() {
  add_header(ext[23]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_23_4() {
  add_header(ext[23]);
  add_header(ext[23]);
  add_header(ext[23]);
  add_header(ext[23]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_23_20() {
  add_header(ext[23]);
  add_header(ext[23]);
  add_header(ext[23]);
  add_header(ext[23]);
  add_header(ext[23]);
  add_header(ext[23]);
  add_header(ext[23]);
  add_header(ext[23]);
  add_header(ext[23]);
  add_header(ext[23]);
  add_header(ext[23]);
  add_header(ext[23]);
  add_header(ext[23]);
  add_header(ext[23]);
  add_header(ext[23]);
  add_header(ext[23]);
  add_header(ext[23]);
  add_header(ext[23]);
  add_header(ext[23]);
  add_header(ext[23]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_24_1() {
  add_header(ext[24]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_24_4() {
  add_header(ext[24]);
  add_header(ext[24]);
  add_header(ext[24]);
  add_header(ext[24]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_24_20() {
  add_header(ext[24]);
  add_header(ext[24]);
  add_header(ext[24]);
  add_header(ext[24]);
  add_header(ext[24]);
  add_header(ext[24]);
  add_header(ext[24]);
  add_header(ext[24]);
  add_header(ext[24]);
  add_header(ext[24]);
  add_header(ext[24]);
  add_header(ext[24]);
  add_header(ext[24]);
  add_header(ext[24]);
  add_header(ext[24]);
  add_header(ext[24]);
  add_header(ext[24]);
  add_header(ext[24]);
  add_header(ext[24]);
  add_header(ext[24]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_25_1() {
  add_header(ext[25]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_25_4() {
  add_header(ext[25]);
  add_header(ext[25]);
  add_header(ext[25]);
  add_header(ext[25]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_25_20() {
  add_header(ext[25]);
  add_header(ext[25]);
  add_header(ext[25]);
  add_header(ext[25]);
  add_header(ext[25]);
  add_header(ext[25]);
  add_header(ext[25]);
  add_header(ext[25]);
  add_header(ext[25]);
  add_header(ext[25]);
  add_header(ext[25]);
  add_header(ext[25]);
  add_header(ext[25]);
  add_header(ext[25]);
  add_header(ext[25]);
  add_header(ext[25]);
  add_header(ext[25]);
  add_header(ext[25]);
  add_header(ext[25]);
  add_header(ext[25]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_26_1() {
  add_header(ext[26]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_26_4() {
  add_header(ext[26]);
  add_header(ext[26]);
  add_header(ext[26]);
  add_header(ext[26]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_26_20() {
  add_header(ext[26]);
  add_header(ext[26]);
  add_header(ext[26]);
  add_header(ext[26]);
  add_header(ext[26]);
  add_header(ext[26]);
  add_header(ext[26]);
  add_header(ext[26]);
  add_header(ext[26]);
  add_header(ext[26]);
  add_header(ext[26]);
  add_header(ext[26]);
  add_header(ext[26]);
  add_header(ext[26]);
  add_header(ext[26]);
  add_header(ext[26]);
  add_header(ext[26]);
  add_header(ext[26]);
  add_header(ext[26]);
  add_header(ext[26]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_27_1() {
  add_header(ext[27]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_27_4() {
  add_header(ext[27]);
  add_header(ext[27]);
  add_header(ext[27]);
  add_header(ext[27]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_27_20() {
  add_header(ext[27]);
  add_header(ext[27]);
  add_header(ext[27]);
  add_header(ext[27]);
  add_header(ext[27]);
  add_header(ext[27]);
  add_header(ext[27]);
  add_header(ext[27]);
  add_header(ext[27]);
  add_header(ext[27]);
  add_header(ext[27]);
  add_header(ext[27]);
  add_header(ext[27]);
  add_header(ext[27]);
  add_header(ext[27]);
  add_header(ext[27]);
  add_header(ext[27]);
  add_header(ext[27]);
  add_header(ext[27]);
  add_header(ext[27]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_28_1() {
  add_header(ext[28]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_28_4() {
  add_header(ext[28]);
  add_header(ext[28]);
  add_header(ext[28]);
  add_header(ext[28]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_28_20() {
  add_header(ext[28]);
  add_header(ext[28]);
  add_header(ext[28]);
  add_header(ext[28]);
  add_header(ext[28]);
  add_header(ext[28]);
  add_header(ext[28]);
  add_header(ext[28]);
  add_header(ext[28]);
  add_header(ext[28]);
  add_header(ext[28]);
  add_header(ext[28]);
  add_header(ext[28]);
  add_header(ext[28]);
  add_header(ext[28]);
  add_header(ext[28]);
  add_header(ext[28]);
  add_header(ext[28]);
  add_header(ext[28]);
  add_header(ext[28]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_29_1() {
  add_header(ext[29]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_29_4() {
  add_header(ext[29]);
  add_header(ext[29]);
  add_header(ext[29]);
  add_header(ext[29]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_29_20() {
  add_header(ext[29]);
  add_header(ext[29]);
  add_header(ext[29]);
  add_header(ext[29]);
  add_header(ext[29]);
  add_header(ext[29]);
  add_header(ext[29]);
  add_header(ext[29]);
  add_header(ext[29]);
  add_header(ext[29]);
  add_header(ext[29]);
  add_header(ext[29]);
  add_header(ext[29]);
  add_header(ext[29]);
  add_header(ext[29]);
  add_header(ext[29]);
  add_header(ext[29]);
  add_header(ext[29]);
  add_header(ext[29]);
  add_header(ext[29]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_30_1() {
  add_header(ext[30]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_30_4() {
  add_header(ext[30]);
  add_header(ext[30]);
  add_header(ext[30]);
  add_header(ext[30]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_30_20() {
  add_header(ext[30]);
  add_header(ext[30]);
  add_header(ext[30]);
  add_header(ext[30]);
  add_header(ext[30]);
  add_header(ext[30]);
  add_header(ext[30]);
  add_header(ext[30]);
  add_header(ext[30]);
  add_header(ext[30]);
  add_header(ext[30]);
  add_header(ext[30]);
  add_header(ext[30]);
  add_header(ext[30]);
  add_header(ext[30]);
  add_header(ext[30]);
  add_header(ext[30]);
  add_header(ext[30]);
  add_header(ext[30]);
  add_header(ext[30]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_31_1() {
  add_header(ext[31]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_31_4() {
  add_header(ext[31]);
  add_header(ext[31]);
  add_header(ext[31]);
  add_header(ext[31]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_31_20() {
  add_header(ext[31]);
  add_header(ext[31]);
  add_header(ext[31]);
  add_header(ext[31]);
  add_header(ext[31]);
  add_header(ext[31]);
  add_header(ext[31]);
  add_header(ext[31]);
  add_header(ext[31]);
  add_header(ext[31]);
  add_header(ext[31]);
  add_header(ext[31]);
  add_header(ext[31]);
  add_header(ext[31]);
  add_header(ext[31]);
  add_header(ext[31]);
  add_header(ext[31]);
  add_header(ext[31]);
  add_header(ext[31]);
  add_header(ext[31]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_32_1() {
  add_header(ext[32]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_32_4() {
  add_header(ext[32]);
  add_header(ext[32]);
  add_header(ext[32]);
  add_header(ext[32]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_32_20() {
  add_header(ext[32]);
  add_header(ext[32]);
  add_header(ext[32]);
  add_header(ext[32]);
  add_header(ext[32]);
  add_header(ext[32]);
  add_header(ext[32]);
  add_header(ext[32]);
  add_header(ext[32]);
  add_header(ext[32]);
  add_header(ext[32]);
  add_header(ext[32]);
  add_header(ext[32]);
  add_header(ext[32]);
  add_header(ext[32]);
  add_header(ext[32]);
  add_header(ext[32]);
  add_header(ext[32]);
  add_header(ext[32]);
  add_header(ext[32]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_33_1() {
  add_header(ext[33]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_33_4() {
  add_header(ext[33]);
  add_header(ext[33]);
  add_header(ext[33]);
  add_header(ext[33]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_33_20() {
  add_header(ext[33]);
  add_header(ext[33]);
  add_header(ext[33]);
  add_header(ext[33]);
  add_header(ext[33]);
  add_header(ext[33]);
  add_header(ext[33]);
  add_header(ext[33]);
  add_header(ext[33]);
  add_header(ext[33]);
  add_header(ext[33]);
  add_header(ext[33]);
  add_header(ext[33]);
  add_header(ext[33]);
  add_header(ext[33]);
  add_header(ext[33]);
  add_header(ext[33]);
  add_header(ext[33]);
  add_header(ext[33]);
  add_header(ext[33]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_34_1() {
  add_header(ext[34]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_34_4() {
  add_header(ext[34]);
  add_header(ext[34]);
  add_header(ext[34]);
  add_header(ext[34]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_34_20() {
  add_header(ext[34]);
  add_header(ext[34]);
  add_header(ext[34]);
  add_header(ext[34]);
  add_header(ext[34]);
  add_header(ext[34]);
  add_header(ext[34]);
  add_header(ext[34]);
  add_header(ext[34]);
  add_header(ext[34]);
  add_header(ext[34]);
  add_header(ext[34]);
  add_header(ext[34]);
  add_header(ext[34]);
  add_header(ext[34]);
  add_header(ext[34]);
  add_header(ext[34]);
  add_header(ext[34]);
  add_header(ext[34]);
  add_header(ext[34]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_35_1() {
  add_header(ext[35]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_35_4() {
  add_header(ext[35]);
  add_header(ext[35]);
  add_header(ext[35]);
  add_header(ext[35]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_35_20() {
  add_header(ext[35]);
  add_header(ext[35]);
  add_header(ext[35]);
  add_header(ext[35]);
  add_header(ext[35]);
  add_header(ext[35]);
  add_header(ext[35]);
  add_header(ext[35]);
  add_header(ext[35]);
  add_header(ext[35]);
  add_header(ext[35]);
  add_header(ext[35]);
  add_header(ext[35]);
  add_header(ext[35]);
  add_header(ext[35]);
  add_header(ext[35]);
  add_header(ext[35]);
  add_header(ext[35]);
  add_header(ext[35]);
  add_header(ext[35]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_36_1() {
  add_header(ext[36]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_36_4() {
  add_header(ext[36]);
  add_header(ext[36]);
  add_header(ext[36]);
  add_header(ext[36]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_36_20() {
  add_header(ext[36]);
  add_header(ext[36]);
  add_header(ext[36]);
  add_header(ext[36]);
  add_header(ext[36]);
  add_header(ext[36]);
  add_header(ext[36]);
  add_header(ext[36]);
  add_header(ext[36]);
  add_header(ext[36]);
  add_header(ext[36]);
  add_header(ext[36]);
  add_header(ext[36]);
  add_header(ext[36]);
  add_header(ext[36]);
  add_header(ext[36]);
  add_header(ext[36]);
  add_header(ext[36]);
  add_header(ext[36]);
  add_header(ext[36]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_37_1() {
  add_header(ext[37]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_37_4() {
  add_header(ext[37]);
  add_header(ext[37]);
  add_header(ext[37]);
  add_header(ext[37]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_37_20() {
  add_header(ext[37]);
  add_header(ext[37]);
  add_header(ext[37]);
  add_header(ext[37]);
  add_header(ext[37]);
  add_header(ext[37]);
  add_header(ext[37]);
  add_header(ext[37]);
  add_header(ext[37]);
  add_header(ext[37]);
  add_header(ext[37]);
  add_header(ext[37]);
  add_header(ext[37]);
  add_header(ext[37]);
  add_header(ext[37]);
  add_header(ext[37]);
  add_header(ext[37]);
  add_header(ext[37]);
  add_header(ext[37]);
  add_header(ext[37]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_38_1() {
  add_header(ext[38]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_38_4() {
  add_header(ext[38]);
  add_header(ext[38]);
  add_header(ext[38]);
  add_header(ext[38]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_38_20() {
  add_header(ext[38]);
  add_header(ext[38]);
  add_header(ext[38]);
  add_header(ext[38]);
  add_header(ext[38]);
  add_header(ext[38]);
  add_header(ext[38]);
  add_header(ext[38]);
  add_header(ext[38]);
  add_header(ext[38]);
  add_header(ext[38]);
  add_header(ext[38]);
  add_header(ext[38]);
  add_header(ext[38]);
  add_header(ext[38]);
  add_header(ext[38]);
  add_header(ext[38]);
  add_header(ext[38]);
  add_header(ext[38]);
  add_header(ext[38]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_39_1() {
  add_header(ext[39]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_39_4() {
  add_header(ext[39]);
  add_header(ext[39]);
  add_header(ext[39]);
  add_header(ext[39]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_39_20() {
  add_header(ext[39]);
  add_header(ext[39]);
  add_header(ext[39]);
  add_header(ext[39]);
  add_header(ext[39]);
  add_header(ext[39]);
  add_header(ext[39]);
  add_header(ext[39]);
  add_header(ext[39]);
  add_header(ext[39]);
  add_header(ext[39]);
  add_header(ext[39]);
  add_header(ext[39]);
  add_header(ext[39]);
  add_header(ext[39]);
  add_header(ext[39]);
  add_header(ext[39]);
  add_header(ext[39]);
  add_header(ext[39]);
  add_header(ext[39]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_40_1() {
  add_header(ext[40]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_40_4() {
  add_header(ext[40]);
  add_header(ext[40]);
  add_header(ext[40]);
  add_header(ext[40]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_40_20() {
  add_header(ext[40]);
  add_header(ext[40]);
  add_header(ext[40]);
  add_header(ext[40]);
  add_header(ext[40]);
  add_header(ext[40]);
  add_header(ext[40]);
  add_header(ext[40]);
  add_header(ext[40]);
  add_header(ext[40]);
  add_header(ext[40]);
  add_header(ext[40]);
  add_header(ext[40]);
  add_header(ext[40]);
  add_header(ext[40]);
  add_header(ext[40]);
  add_header(ext[40]);
  add_header(ext[40]);
  add_header(ext[40]);
  add_header(ext[40]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_41_1() {
  add_header(ext[41]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_41_4() {
  add_header(ext[41]);
  add_header(ext[41]);
  add_header(ext[41]);
  add_header(ext[41]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_41_20() {
  add_header(ext[41]);
  add_header(ext[41]);
  add_header(ext[41]);
  add_header(ext[41]);
  add_header(ext[41]);
  add_header(ext[41]);
  add_header(ext[41]);
  add_header(ext[41]);
  add_header(ext[41]);
  add_header(ext[41]);
  add_header(ext[41]);
  add_header(ext[41]);
  add_header(ext[41]);
  add_header(ext[41]);
  add_header(ext[41]);
  add_header(ext[41]);
  add_header(ext[41]);
  add_header(ext[41]);
  add_header(ext[41]);
  add_header(ext[41]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_42_1() {
  add_header(ext[42]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_42_4() {
  add_header(ext[42]);
  add_header(ext[42]);
  add_header(ext[42]);
  add_header(ext[42]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_42_20() {
  add_header(ext[42]);
  add_header(ext[42]);
  add_header(ext[42]);
  add_header(ext[42]);
  add_header(ext[42]);
  add_header(ext[42]);
  add_header(ext[42]);
  add_header(ext[42]);
  add_header(ext[42]);
  add_header(ext[42]);
  add_header(ext[42]);
  add_header(ext[42]);
  add_header(ext[42]);
  add_header(ext[42]);
  add_header(ext[42]);
  add_header(ext[42]);
  add_header(ext[42]);
  add_header(ext[42]);
  add_header(ext[42]);
  add_header(ext[42]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_43_1() {
  add_header(ext[43]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_43_4() {
  add_header(ext[43]);
  add_header(ext[43]);
  add_header(ext[43]);
  add_header(ext[43]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_43_20() {
  add_header(ext[43]);
  add_header(ext[43]);
  add_header(ext[43]);
  add_header(ext[43]);
  add_header(ext[43]);
  add_header(ext[43]);
  add_header(ext[43]);
  add_header(ext[43]);
  add_header(ext[43]);
  add_header(ext[43]);
  add_header(ext[43]);
  add_header(ext[43]);
  add_header(ext[43]);
  add_header(ext[43]);
  add_header(ext[43]);
  add_header(ext[43]);
  add_header(ext[43]);
  add_header(ext[43]);
  add_header(ext[43]);
  add_header(ext[43]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_44_1() {
  add_header(ext[44]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_44_4() {
  add_header(ext[44]);
  add_header(ext[44]);
  add_header(ext[44]);
  add_header(ext[44]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_44_20() {
  add_header(ext[44]);
  add_header(ext[44]);
  add_header(ext[44]);
  add_header(ext[44]);
  add_header(ext[44]);
  add_header(ext[44]);
  add_header(ext[44]);
  add_header(ext[44]);
  add_header(ext[44]);
  add_header(ext[44]);
  add_header(ext[44]);
  add_header(ext[44]);
  add_header(ext[44]);
  add_header(ext[44]);
  add_header(ext[44]);
  add_header(ext[44]);
  add_header(ext[44]);
  add_header(ext[44]);
  add_header(ext[44]);
  add_header(ext[44]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_45_1() {
  add_header(ext[45]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_45_4() {
  add_header(ext[45]);
  add_header(ext[45]);
  add_header(ext[45]);
  add_header(ext[45]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_45_20() {
  add_header(ext[45]);
  add_header(ext[45]);
  add_header(ext[45]);
  add_header(ext[45]);
  add_header(ext[45]);
  add_header(ext[45]);
  add_header(ext[45]);
  add_header(ext[45]);
  add_header(ext[45]);
  add_header(ext[45]);
  add_header(ext[45]);
  add_header(ext[45]);
  add_header(ext[45]);
  add_header(ext[45]);
  add_header(ext[45]);
  add_header(ext[45]);
  add_header(ext[45]);
  add_header(ext[45]);
  add_header(ext[45]);
  add_header(ext[45]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_46_1() {
  add_header(ext[46]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_46_4() {
  add_header(ext[46]);
  add_header(ext[46]);
  add_header(ext[46]);
  add_header(ext[46]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_46_20() {
  add_header(ext[46]);
  add_header(ext[46]);
  add_header(ext[46]);
  add_header(ext[46]);
  add_header(ext[46]);
  add_header(ext[46]);
  add_header(ext[46]);
  add_header(ext[46]);
  add_header(ext[46]);
  add_header(ext[46]);
  add_header(ext[46]);
  add_header(ext[46]);
  add_header(ext[46]);
  add_header(ext[46]);
  add_header(ext[46]);
  add_header(ext[46]);
  add_header(ext[46]);
  add_header(ext[46]);
  add_header(ext[46]);
  add_header(ext[46]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_47_1() {
  add_header(ext[47]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_47_4() {
  add_header(ext[47]);
  add_header(ext[47]);
  add_header(ext[47]);
  add_header(ext[47]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_47_20() {
  add_header(ext[47]);
  add_header(ext[47]);
  add_header(ext[47]);
  add_header(ext[47]);
  add_header(ext[47]);
  add_header(ext[47]);
  add_header(ext[47]);
  add_header(ext[47]);
  add_header(ext[47]);
  add_header(ext[47]);
  add_header(ext[47]);
  add_header(ext[47]);
  add_header(ext[47]);
  add_header(ext[47]);
  add_header(ext[47]);
  add_header(ext[47]);
  add_header(ext[47]);
  add_header(ext[47]);
  add_header(ext[47]);
  add_header(ext[47]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_48_1() {
  add_header(ext[48]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_48_4() {
  add_header(ext[48]);
  add_header(ext[48]);
  add_header(ext[48]);
  add_header(ext[48]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_48_20() {
  add_header(ext[48]);
  add_header(ext[48]);
  add_header(ext[48]);
  add_header(ext[48]);
  add_header(ext[48]);
  add_header(ext[48]);
  add_header(ext[48]);
  add_header(ext[48]);
  add_header(ext[48]);
  add_header(ext[48]);
  add_header(ext[48]);
  add_header(ext[48]);
  add_header(ext[48]);
  add_header(ext[48]);
  add_header(ext[48]);
  add_header(ext[48]);
  add_header(ext[48]);
  add_header(ext[48]);
  add_header(ext[48]);
  add_header(ext[48]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_49_1() {
  add_header(ext[49]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_49_4() {
  add_header(ext[49]);
  add_header(ext[49]);
  add_header(ext[49]);
  add_header(ext[49]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_49_20() {
  add_header(ext[49]);
  add_header(ext[49]);
  add_header(ext[49]);
  add_header(ext[49]);
  add_header(ext[49]);
  add_header(ext[49]);
  add_header(ext[49]);
  add_header(ext[49]);
  add_header(ext[49]);
  add_header(ext[49]);
  add_header(ext[49]);
  add_header(ext[49]);
  add_header(ext[49]);
  add_header(ext[49]);
  add_header(ext[49]);
  add_header(ext[49]);
  add_header(ext[49]);
  add_header(ext[49]);
  add_header(ext[49]);
  add_header(ext[49]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_50_1() {
  add_header(ext[50]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_50_4() {
  add_header(ext[50]);
  add_header(ext[50]);
  add_header(ext[50]);
  add_header(ext[50]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_50_20() {
  add_header(ext[50]);
  add_header(ext[50]);
  add_header(ext[50]);
  add_header(ext[50]);
  add_header(ext[50]);
  add_header(ext[50]);
  add_header(ext[50]);
  add_header(ext[50]);
  add_header(ext[50]);
  add_header(ext[50]);
  add_header(ext[50]);
  add_header(ext[50]);
  add_header(ext[50]);
  add_header(ext[50]);
  add_header(ext[50]);
  add_header(ext[50]);
  add_header(ext[50]);
  add_header(ext[50]);
  add_header(ext[50]);
  add_header(ext[50]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_51_1() {
  add_header(ext[51]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_51_4() {
  add_header(ext[51]);
  add_header(ext[51]);
  add_header(ext[51]);
  add_header(ext[51]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_51_20() {
  add_header(ext[51]);
  add_header(ext[51]);
  add_header(ext[51]);
  add_header(ext[51]);
  add_header(ext[51]);
  add_header(ext[51]);
  add_header(ext[51]);
  add_header(ext[51]);
  add_header(ext[51]);
  add_header(ext[51]);
  add_header(ext[51]);
  add_header(ext[51]);
  add_header(ext[51]);
  add_header(ext[51]);
  add_header(ext[51]);
  add_header(ext[51]);
  add_header(ext[51]);
  add_header(ext[51]);
  add_header(ext[51]);
  add_header(ext[51]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_52_1() {
  add_header(ext[52]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_52_4() {
  add_header(ext[52]);
  add_header(ext[52]);
  add_header(ext[52]);
  add_header(ext[52]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_52_20() {
  add_header(ext[52]);
  add_header(ext[52]);
  add_header(ext[52]);
  add_header(ext[52]);
  add_header(ext[52]);
  add_header(ext[52]);
  add_header(ext[52]);
  add_header(ext[52]);
  add_header(ext[52]);
  add_header(ext[52]);
  add_header(ext[52]);
  add_header(ext[52]);
  add_header(ext[52]);
  add_header(ext[52]);
  add_header(ext[52]);
  add_header(ext[52]);
  add_header(ext[52]);
  add_header(ext[52]);
  add_header(ext[52]);
  add_header(ext[52]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_53_1() {
  add_header(ext[53]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_53_4() {
  add_header(ext[53]);
  add_header(ext[53]);
  add_header(ext[53]);
  add_header(ext[53]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_53_20() {
  add_header(ext[53]);
  add_header(ext[53]);
  add_header(ext[53]);
  add_header(ext[53]);
  add_header(ext[53]);
  add_header(ext[53]);
  add_header(ext[53]);
  add_header(ext[53]);
  add_header(ext[53]);
  add_header(ext[53]);
  add_header(ext[53]);
  add_header(ext[53]);
  add_header(ext[53]);
  add_header(ext[53]);
  add_header(ext[53]);
  add_header(ext[53]);
  add_header(ext[53]);
  add_header(ext[53]);
  add_header(ext[53]);
  add_header(ext[53]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_54_1() {
  add_header(ext[54]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_54_4() {
  add_header(ext[54]);
  add_header(ext[54]);
  add_header(ext[54]);
  add_header(ext[54]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_54_20() {
  add_header(ext[54]);
  add_header(ext[54]);
  add_header(ext[54]);
  add_header(ext[54]);
  add_header(ext[54]);
  add_header(ext[54]);
  add_header(ext[54]);
  add_header(ext[54]);
  add_header(ext[54]);
  add_header(ext[54]);
  add_header(ext[54]);
  add_header(ext[54]);
  add_header(ext[54]);
  add_header(ext[54]);
  add_header(ext[54]);
  add_header(ext[54]);
  add_header(ext[54]);
  add_header(ext[54]);
  add_header(ext[54]);
  add_header(ext[54]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_55_1() {
  add_header(ext[55]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_55_4() {
  add_header(ext[55]);
  add_header(ext[55]);
  add_header(ext[55]);
  add_header(ext[55]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_55_20() {
  add_header(ext[55]);
  add_header(ext[55]);
  add_header(ext[55]);
  add_header(ext[55]);
  add_header(ext[55]);
  add_header(ext[55]);
  add_header(ext[55]);
  add_header(ext[55]);
  add_header(ext[55]);
  add_header(ext[55]);
  add_header(ext[55]);
  add_header(ext[55]);
  add_header(ext[55]);
  add_header(ext[55]);
  add_header(ext[55]);
  add_header(ext[55]);
  add_header(ext[55]);
  add_header(ext[55]);
  add_header(ext[55]);
  add_header(ext[55]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_56_1() {
  add_header(ext[56]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_56_4() {
  add_header(ext[56]);
  add_header(ext[56]);
  add_header(ext[56]);
  add_header(ext[56]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_56_20() {
  add_header(ext[56]);
  add_header(ext[56]);
  add_header(ext[56]);
  add_header(ext[56]);
  add_header(ext[56]);
  add_header(ext[56]);
  add_header(ext[56]);
  add_header(ext[56]);
  add_header(ext[56]);
  add_header(ext[56]);
  add_header(ext[56]);
  add_header(ext[56]);
  add_header(ext[56]);
  add_header(ext[56]);
  add_header(ext[56]);
  add_header(ext[56]);
  add_header(ext[56]);
  add_header(ext[56]);
  add_header(ext[56]);
  add_header(ext[56]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_57_1() {
  add_header(ext[57]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_57_4() {
  add_header(ext[57]);
  add_header(ext[57]);
  add_header(ext[57]);
  add_header(ext[57]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_57_20() {
  add_header(ext[57]);
  add_header(ext[57]);
  add_header(ext[57]);
  add_header(ext[57]);
  add_header(ext[57]);
  add_header(ext[57]);
  add_header(ext[57]);
  add_header(ext[57]);
  add_header(ext[57]);
  add_header(ext[57]);
  add_header(ext[57]);
  add_header(ext[57]);
  add_header(ext[57]);
  add_header(ext[57]);
  add_header(ext[57]);
  add_header(ext[57]);
  add_header(ext[57]);
  add_header(ext[57]);
  add_header(ext[57]);
  add_header(ext[57]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_58_1() {
  add_header(ext[58]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_58_4() {
  add_header(ext[58]);
  add_header(ext[58]);
  add_header(ext[58]);
  add_header(ext[58]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_58_20() {
  add_header(ext[58]);
  add_header(ext[58]);
  add_header(ext[58]);
  add_header(ext[58]);
  add_header(ext[58]);
  add_header(ext[58]);
  add_header(ext[58]);
  add_header(ext[58]);
  add_header(ext[58]);
  add_header(ext[58]);
  add_header(ext[58]);
  add_header(ext[58]);
  add_header(ext[58]);
  add_header(ext[58]);
  add_header(ext[58]);
  add_header(ext[58]);
  add_header(ext[58]);
  add_header(ext[58]);
  add_header(ext[58]);
  add_header(ext[58]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_59_1() {
  add_header(ext[59]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_59_4() {
  add_header(ext[59]);
  add_header(ext[59]);
  add_header(ext[59]);
  add_header(ext[59]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_59_20() {
  add_header(ext[59]);
  add_header(ext[59]);
  add_header(ext[59]);
  add_header(ext[59]);
  add_header(ext[59]);
  add_header(ext[59]);
  add_header(ext[59]);
  add_header(ext[59]);
  add_header(ext[59]);
  add_header(ext[59]);
  add_header(ext[59]);
  add_header(ext[59]);
  add_header(ext[59]);
  add_header(ext[59]);
  add_header(ext[59]);
  add_header(ext[59]);
  add_header(ext[59]);
  add_header(ext[59]);
  add_header(ext[59]);
  add_header(ext[59]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_60_1() {
  add_header(ext[60]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_60_4() {
  add_header(ext[60]);
  add_header(ext[60]);
  add_header(ext[60]);
  add_header(ext[60]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_60_20() {
  add_header(ext[60]);
  add_header(ext[60]);
  add_header(ext[60]);
  add_header(ext[60]);
  add_header(ext[60]);
  add_header(ext[60]);
  add_header(ext[60]);
  add_header(ext[60]);
  add_header(ext[60]);
  add_header(ext[60]);
  add_header(ext[60]);
  add_header(ext[60]);
  add_header(ext[60]);
  add_header(ext[60]);
  add_header(ext[60]);
  add_header(ext[60]);
  add_header(ext[60]);
  add_header(ext[60]);
  add_header(ext[60]);
  add_header(ext[60]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_61_1() {
  add_header(ext[61]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_61_4() {
  add_header(ext[61]);
  add_header(ext[61]);
  add_header(ext[61]);
  add_header(ext[61]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_61_20() {
  add_header(ext[61]);
  add_header(ext[61]);
  add_header(ext[61]);
  add_header(ext[61]);
  add_header(ext[61]);
  add_header(ext[61]);
  add_header(ext[61]);
  add_header(ext[61]);
  add_header(ext[61]);
  add_header(ext[61]);
  add_header(ext[61]);
  add_header(ext[61]);
  add_header(ext[61]);
  add_header(ext[61]);
  add_header(ext[61]);
  add_header(ext[61]);
  add_header(ext[61]);
  add_header(ext[61]);
  add_header(ext[61]);
  add_header(ext[61]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_62_1() {
  add_header(ext[62]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_62_4() {
  add_header(ext[62]);
  add_header(ext[62]);
  add_header(ext[62]);
  add_header(ext[62]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_62_20() {
  add_header(ext[62]);
  add_header(ext[62]);
  add_header(ext[62]);
  add_header(ext[62]);
  add_header(ext[62]);
  add_header(ext[62]);
  add_header(ext[62]);
  add_header(ext[62]);
  add_header(ext[62]);
  add_header(ext[62]);
  add_header(ext[62]);
  add_header(ext[62]);
  add_header(ext[62]);
  add_header(ext[62]);
  add_header(ext[62]);
  add_header(ext[62]);
  add_header(ext[62]);
  add_header(ext[62]);
  add_header(ext[62]);
  add_header(ext[62]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_63_1() {
  add_header(ext[63]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_63_4() {
  add_header(ext[63]);
  add_header(ext[63]);
  add_header(ext[63]);
  add_header(ext[63]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_63_20() {
  add_header(ext[63]);
  add_header(ext[63]);
  add_header(ext[63]);
  add_header(ext[63]);
  add_header(ext[63]);
  add_header(ext[63]);
  add_header(ext[63]);
  add_header(ext[63]);
  add_header(ext[63]);
  add_header(ext[63]);
  add_header(ext[63]);
  add_header(ext[63]);
  add_header(ext[63]);
  add_header(ext[63]);
  add_header(ext[63]);
  add_header(ext[63]);
  add_header(ext[63]);
  add_header(ext[63]);
  add_header(ext[63]);
  add_header(ext[63]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_64_1() {
  add_header(ext[64]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_64_4() {
  add_header(ext[64]);
  add_header(ext[64]);
  add_header(ext[64]);
  add_header(ext[64]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_64_20() {
  add_header(ext[64]);
  add_header(ext[64]);
  add_header(ext[64]);
  add_header(ext[64]);
  add_header(ext[64]);
  add_header(ext[64]);
  add_header(ext[64]);
  add_header(ext[64]);
  add_header(ext[64]);
  add_header(ext[64]);
  add_header(ext[64]);
  add_header(ext[64]);
  add_header(ext[64]);
  add_header(ext[64]);
  add_header(ext[64]);
  add_header(ext[64]);
  add_header(ext[64]);
  add_header(ext[64]);
  add_header(ext[64]);
  add_header(ext[64]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_65_1() {
  add_header(ext[65]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_65_4() {
  add_header(ext[65]);
  add_header(ext[65]);
  add_header(ext[65]);
  add_header(ext[65]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_65_20() {
  add_header(ext[65]);
  add_header(ext[65]);
  add_header(ext[65]);
  add_header(ext[65]);
  add_header(ext[65]);
  add_header(ext[65]);
  add_header(ext[65]);
  add_header(ext[65]);
  add_header(ext[65]);
  add_header(ext[65]);
  add_header(ext[65]);
  add_header(ext[65]);
  add_header(ext[65]);
  add_header(ext[65]);
  add_header(ext[65]);
  add_header(ext[65]);
  add_header(ext[65]);
  add_header(ext[65]);
  add_header(ext[65]);
  add_header(ext[65]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_66_1() {
  add_header(ext[66]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_66_4() {
  add_header(ext[66]);
  add_header(ext[66]);
  add_header(ext[66]);
  add_header(ext[66]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_66_20() {
  add_header(ext[66]);
  add_header(ext[66]);
  add_header(ext[66]);
  add_header(ext[66]);
  add_header(ext[66]);
  add_header(ext[66]);
  add_header(ext[66]);
  add_header(ext[66]);
  add_header(ext[66]);
  add_header(ext[66]);
  add_header(ext[66]);
  add_header(ext[66]);
  add_header(ext[66]);
  add_header(ext[66]);
  add_header(ext[66]);
  add_header(ext[66]);
  add_header(ext[66]);
  add_header(ext[66]);
  add_header(ext[66]);
  add_header(ext[66]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_67_1() {
  add_header(ext[67]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_67_4() {
  add_header(ext[67]);
  add_header(ext[67]);
  add_header(ext[67]);
  add_header(ext[67]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_67_20() {
  add_header(ext[67]);
  add_header(ext[67]);
  add_header(ext[67]);
  add_header(ext[67]);
  add_header(ext[67]);
  add_header(ext[67]);
  add_header(ext[67]);
  add_header(ext[67]);
  add_header(ext[67]);
  add_header(ext[67]);
  add_header(ext[67]);
  add_header(ext[67]);
  add_header(ext[67]);
  add_header(ext[67]);
  add_header(ext[67]);
  add_header(ext[67]);
  add_header(ext[67]);
  add_header(ext[67]);
  add_header(ext[67]);
  add_header(ext[67]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_68_1() {
  add_header(ext[68]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_68_4() {
  add_header(ext[68]);
  add_header(ext[68]);
  add_header(ext[68]);
  add_header(ext[68]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_68_20() {
  add_header(ext[68]);
  add_header(ext[68]);
  add_header(ext[68]);
  add_header(ext[68]);
  add_header(ext[68]);
  add_header(ext[68]);
  add_header(ext[68]);
  add_header(ext[68]);
  add_header(ext[68]);
  add_header(ext[68]);
  add_header(ext[68]);
  add_header(ext[68]);
  add_header(ext[68]);
  add_header(ext[68]);
  add_header(ext[68]);
  add_header(ext[68]);
  add_header(ext[68]);
  add_header(ext[68]);
  add_header(ext[68]);
  add_header(ext[68]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_69_1() {
  add_header(ext[69]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_69_4() {
  add_header(ext[69]);
  add_header(ext[69]);
  add_header(ext[69]);
  add_header(ext[69]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_69_20() {
  add_header(ext[69]);
  add_header(ext[69]);
  add_header(ext[69]);
  add_header(ext[69]);
  add_header(ext[69]);
  add_header(ext[69]);
  add_header(ext[69]);
  add_header(ext[69]);
  add_header(ext[69]);
  add_header(ext[69]);
  add_header(ext[69]);
  add_header(ext[69]);
  add_header(ext[69]);
  add_header(ext[69]);
  add_header(ext[69]);
  add_header(ext[69]);
  add_header(ext[69]);
  add_header(ext[69]);
  add_header(ext[69]);
  add_header(ext[69]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_70_1() {
  add_header(ext[70]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_70_4() {
  add_header(ext[70]);
  add_header(ext[70]);
  add_header(ext[70]);
  add_header(ext[70]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_70_20() {
  add_header(ext[70]);
  add_header(ext[70]);
  add_header(ext[70]);
  add_header(ext[70]);
  add_header(ext[70]);
  add_header(ext[70]);
  add_header(ext[70]);
  add_header(ext[70]);
  add_header(ext[70]);
  add_header(ext[70]);
  add_header(ext[70]);
  add_header(ext[70]);
  add_header(ext[70]);
  add_header(ext[70]);
  add_header(ext[70]);
  add_header(ext[70]);
  add_header(ext[70]);
  add_header(ext[70]);
  add_header(ext[70]);
  add_header(ext[70]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_71_1() {
  add_header(ext[71]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_71_4() {
  add_header(ext[71]);
  add_header(ext[71]);
  add_header(ext[71]);
  add_header(ext[71]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_71_20() {
  add_header(ext[71]);
  add_header(ext[71]);
  add_header(ext[71]);
  add_header(ext[71]);
  add_header(ext[71]);
  add_header(ext[71]);
  add_header(ext[71]);
  add_header(ext[71]);
  add_header(ext[71]);
  add_header(ext[71]);
  add_header(ext[71]);
  add_header(ext[71]);
  add_header(ext[71]);
  add_header(ext[71]);
  add_header(ext[71]);
  add_header(ext[71]);
  add_header(ext[71]);
  add_header(ext[71]);
  add_header(ext[71]);
  add_header(ext[71]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_72_1() {
  add_header(ext[72]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_72_4() {
  add_header(ext[72]);
  add_header(ext[72]);
  add_header(ext[72]);
  add_header(ext[72]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_72_20() {
  add_header(ext[72]);
  add_header(ext[72]);
  add_header(ext[72]);
  add_header(ext[72]);
  add_header(ext[72]);
  add_header(ext[72]);
  add_header(ext[72]);
  add_header(ext[72]);
  add_header(ext[72]);
  add_header(ext[72]);
  add_header(ext[72]);
  add_header(ext[72]);
  add_header(ext[72]);
  add_header(ext[72]);
  add_header(ext[72]);
  add_header(ext[72]);
  add_header(ext[72]);
  add_header(ext[72]);
  add_header(ext[72]);
  add_header(ext[72]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_73_1() {
  add_header(ext[73]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_73_4() {
  add_header(ext[73]);
  add_header(ext[73]);
  add_header(ext[73]);
  add_header(ext[73]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_73_20() {
  add_header(ext[73]);
  add_header(ext[73]);
  add_header(ext[73]);
  add_header(ext[73]);
  add_header(ext[73]);
  add_header(ext[73]);
  add_header(ext[73]);
  add_header(ext[73]);
  add_header(ext[73]);
  add_header(ext[73]);
  add_header(ext[73]);
  add_header(ext[73]);
  add_header(ext[73]);
  add_header(ext[73]);
  add_header(ext[73]);
  add_header(ext[73]);
  add_header(ext[73]);
  add_header(ext[73]);
  add_header(ext[73]);
  add_header(ext[73]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_74_1() {
  add_header(ext[74]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_74_4() {
  add_header(ext[74]);
  add_header(ext[74]);
  add_header(ext[74]);
  add_header(ext[74]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_74_20() {
  add_header(ext[74]);
  add_header(ext[74]);
  add_header(ext[74]);
  add_header(ext[74]);
  add_header(ext[74]);
  add_header(ext[74]);
  add_header(ext[74]);
  add_header(ext[74]);
  add_header(ext[74]);
  add_header(ext[74]);
  add_header(ext[74]);
  add_header(ext[74]);
  add_header(ext[74]);
  add_header(ext[74]);
  add_header(ext[74]);
  add_header(ext[74]);
  add_header(ext[74]);
  add_header(ext[74]);
  add_header(ext[74]);
  add_header(ext[74]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_75_1() {
  add_header(ext[75]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_75_4() {
  add_header(ext[75]);
  add_header(ext[75]);
  add_header(ext[75]);
  add_header(ext[75]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_75_20() {
  add_header(ext[75]);
  add_header(ext[75]);
  add_header(ext[75]);
  add_header(ext[75]);
  add_header(ext[75]);
  add_header(ext[75]);
  add_header(ext[75]);
  add_header(ext[75]);
  add_header(ext[75]);
  add_header(ext[75]);
  add_header(ext[75]);
  add_header(ext[75]);
  add_header(ext[75]);
  add_header(ext[75]);
  add_header(ext[75]);
  add_header(ext[75]);
  add_header(ext[75]);
  add_header(ext[75]);
  add_header(ext[75]);
  add_header(ext[75]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_76_1() {
  add_header(ext[76]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_76_4() {
  add_header(ext[76]);
  add_header(ext[76]);
  add_header(ext[76]);
  add_header(ext[76]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_76_20() {
  add_header(ext[76]);
  add_header(ext[76]);
  add_header(ext[76]);
  add_header(ext[76]);
  add_header(ext[76]);
  add_header(ext[76]);
  add_header(ext[76]);
  add_header(ext[76]);
  add_header(ext[76]);
  add_header(ext[76]);
  add_header(ext[76]);
  add_header(ext[76]);
  add_header(ext[76]);
  add_header(ext[76]);
  add_header(ext[76]);
  add_header(ext[76]);
  add_header(ext[76]);
  add_header(ext[76]);
  add_header(ext[76]);
  add_header(ext[76]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_77_1() {
  add_header(ext[77]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_77_4() {
  add_header(ext[77]);
  add_header(ext[77]);
  add_header(ext[77]);
  add_header(ext[77]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_77_20() {
  add_header(ext[77]);
  add_header(ext[77]);
  add_header(ext[77]);
  add_header(ext[77]);
  add_header(ext[77]);
  add_header(ext[77]);
  add_header(ext[77]);
  add_header(ext[77]);
  add_header(ext[77]);
  add_header(ext[77]);
  add_header(ext[77]);
  add_header(ext[77]);
  add_header(ext[77]);
  add_header(ext[77]);
  add_header(ext[77]);
  add_header(ext[77]);
  add_header(ext[77]);
  add_header(ext[77]);
  add_header(ext[77]);
  add_header(ext[77]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_78_1() {
  add_header(ext[78]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_78_4() {
  add_header(ext[78]);
  add_header(ext[78]);
  add_header(ext[78]);
  add_header(ext[78]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_78_20() {
  add_header(ext[78]);
  add_header(ext[78]);
  add_header(ext[78]);
  add_header(ext[78]);
  add_header(ext[78]);
  add_header(ext[78]);
  add_header(ext[78]);
  add_header(ext[78]);
  add_header(ext[78]);
  add_header(ext[78]);
  add_header(ext[78]);
  add_header(ext[78]);
  add_header(ext[78]);
  add_header(ext[78]);
  add_header(ext[78]);
  add_header(ext[78]);
  add_header(ext[78]);
  add_header(ext[78]);
  add_header(ext[78]);
  add_header(ext[78]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_79_1() {
  add_header(ext[79]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_79_4() {
  add_header(ext[79]);
  add_header(ext[79]);
  add_header(ext[79]);
  add_header(ext[79]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_79_20() {
  add_header(ext[79]);
  add_header(ext[79]);
  add_header(ext[79]);
  add_header(ext[79]);
  add_header(ext[79]);
  add_header(ext[79]);
  add_header(ext[79]);
  add_header(ext[79]);
  add_header(ext[79]);
  add_header(ext[79]);
  add_header(ext[79]);
  add_header(ext[79]);
  add_header(ext[79]);
  add_header(ext[79]);
  add_header(ext[79]);
  add_header(ext[79]);
  add_header(ext[79]);
  add_header(ext[79]);
  add_header(ext[79]);
  add_header(ext[79]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_80_1() {
  add_header(ext[80]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_80_4() {
  add_header(ext[80]);
  add_header(ext[80]);
  add_header(ext[80]);
  add_header(ext[80]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_80_20() {
  add_header(ext[80]);
  add_header(ext[80]);
  add_header(ext[80]);
  add_header(ext[80]);
  add_header(ext[80]);
  add_header(ext[80]);
  add_header(ext[80]);
  add_header(ext[80]);
  add_header(ext[80]);
  add_header(ext[80]);
  add_header(ext[80]);
  add_header(ext[80]);
  add_header(ext[80]);
  add_header(ext[80]);
  add_header(ext[80]);
  add_header(ext[80]);
  add_header(ext[80]);
  add_header(ext[80]);
  add_header(ext[80]);
  add_header(ext[80]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 20);
}

action a_add_header_81_1() {
  add_header(ext[81]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_81_4() {
  add_header(ext[81]);
  add_header(ext[81]);
  add_header(ext[81]);
  add_header(ext[81]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_82_1() {
  add_header(ext[82]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_82_4() {
  add_header(ext[82]);
  add_header(ext[82]);
  add_header(ext[82]);
  add_header(ext[82]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_83_1() {
  add_header(ext[83]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_83_4() {
  add_header(ext[83]);
  add_header(ext[83]);
  add_header(ext[83]);
  add_header(ext[83]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_84_1() {
  add_header(ext[84]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_84_4() {
  add_header(ext[84]);
  add_header(ext[84]);
  add_header(ext[84]);
  add_header(ext[84]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_85_1() {
  add_header(ext[85]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_85_4() {
  add_header(ext[85]);
  add_header(ext[85]);
  add_header(ext[85]);
  add_header(ext[85]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_86_1() {
  add_header(ext[86]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_86_4() {
  add_header(ext[86]);
  add_header(ext[86]);
  add_header(ext[86]);
  add_header(ext[86]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_87_1() {
  add_header(ext[87]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_87_4() {
  add_header(ext[87]);
  add_header(ext[87]);
  add_header(ext[87]);
  add_header(ext[87]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_88_1() {
  add_header(ext[88]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_88_4() {
  add_header(ext[88]);
  add_header(ext[88]);
  add_header(ext[88]);
  add_header(ext[88]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_89_1() {
  add_header(ext[89]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_89_4() {
  add_header(ext[89]);
  add_header(ext[89]);
  add_header(ext[89]);
  add_header(ext[89]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_90_1() {
  add_header(ext[90]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_90_4() {
  add_header(ext[90]);
  add_header(ext[90]);
  add_header(ext[90]);
  add_header(ext[90]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_91_1() {
  add_header(ext[91]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_91_4() {
  add_header(ext[91]);
  add_header(ext[91]);
  add_header(ext[91]);
  add_header(ext[91]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_92_1() {
  add_header(ext[92]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_92_4() {
  add_header(ext[92]);
  add_header(ext[92]);
  add_header(ext[92]);
  add_header(ext[92]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_93_1() {
  add_header(ext[93]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_93_4() {
  add_header(ext[93]);
  add_header(ext[93]);
  add_header(ext[93]);
  add_header(ext[93]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_94_1() {
  add_header(ext[94]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_94_4() {
  add_header(ext[94]);
  add_header(ext[94]);
  add_header(ext[94]);
  add_header(ext[94]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_95_1() {
  add_header(ext[95]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_95_4() {
  add_header(ext[95]);
  add_header(ext[95]);
  add_header(ext[95]);
  add_header(ext[95]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_96_1() {
  add_header(ext[96]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_96_4() {
  add_header(ext[96]);
  add_header(ext[96]);
  add_header(ext[96]);
  add_header(ext[96]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 4);
}

action a_add_header_97_1() {
  add_header(ext[97]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_98_1() {
  add_header(ext[98]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action a_add_header_99_1() {
  add_header(ext[99]);
  modify_field(meta_primitive_state.hmanip_remaining, meta_primitive_state.hmanip_remaining - 1);
}

action_profile addhs {
  actions {
    a_add_header_00_1;
    a_add_header_00_4;
    a_add_header_00_20;
    a_add_header_01_1;
    a_add_header_01_4;
    a_add_header_01_20;
    a_add_header_02_1;
    a_add_header_02_4;
    a_add_header_02_20;
    a_add_header_03_1;
    a_add_header_03_4;
    a_add_header_03_20;
    a_add_header_04_1;
    a_add_header_04_4;
    a_add_header_04_20;
    a_add_header_05_1;
    a_add_header_05_4;
    a_add_header_05_20;
    a_add_header_06_1;
    a_add_header_06_4;
    a_add_header_06_20;
    a_add_header_07_1;
    a_add_header_07_4;
    a_add_header_07_20;
    a_add_header_08_1;
    a_add_header_08_4;
    a_add_header_08_20;
    a_add_header_09_1;
    a_add_header_09_4;
    a_add_header_09_20;
    a_add_header_10_1;
    a_add_header_10_4;
    a_add_header_10_20;
    a_add_header_11_1;
    a_add_header_11_4;
    a_add_header_11_20;
    a_add_header_12_1;
    a_add_header_12_4;
    a_add_header_12_20;
    a_add_header_13_1;
    a_add_header_13_4;
    a_add_header_13_20;
    a_add_header_14_1;
    a_add_header_14_4;
    a_add_header_14_20;
    a_add_header_15_1;
    a_add_header_15_4;
    a_add_header_15_20;
    a_add_header_16_1;
    a_add_header_16_4;
    a_add_header_16_20;
    a_add_header_17_1;
    a_add_header_17_4;
    a_add_header_17_20;
    a_add_header_18_1;
    a_add_header_18_4;
    a_add_header_18_20;
    a_add_header_19_1;
    a_add_header_19_4;
    a_add_header_19_20;
    a_add_header_20_1;
    a_add_header_20_4;
    a_add_header_20_20;
    a_add_header_21_1;
    a_add_header_21_4;
    a_add_header_21_20;
    a_add_header_22_1;
    a_add_header_22_4;
    a_add_header_22_20;
    a_add_header_23_1;
    a_add_header_23_4;
    a_add_header_23_20;
    a_add_header_24_1;
    a_add_header_24_4;
    a_add_header_24_20;
    a_add_header_25_1;
    a_add_header_25_4;
    a_add_header_25_20;
    a_add_header_26_1;
    a_add_header_26_4;
    a_add_header_26_20;
    a_add_header_27_1;
    a_add_header_27_4;
    a_add_header_27_20;
    a_add_header_28_1;
    a_add_header_28_4;
    a_add_header_28_20;
    a_add_header_29_1;
    a_add_header_29_4;
    a_add_header_29_20;
    a_add_header_30_1;
    a_add_header_30_4;
    a_add_header_30_20;
    a_add_header_31_1;
    a_add_header_31_4;
    a_add_header_31_20;
    a_add_header_32_1;
    a_add_header_32_4;
    a_add_header_32_20;
    a_add_header_33_1;
    a_add_header_33_4;
    a_add_header_33_20;
    a_add_header_34_1;
    a_add_header_34_4;
    a_add_header_34_20;
    a_add_header_35_1;
    a_add_header_35_4;
    a_add_header_35_20;
    a_add_header_36_1;
    a_add_header_36_4;
    a_add_header_36_20;
    a_add_header_37_1;
    a_add_header_37_4;
    a_add_header_37_20;
    a_add_header_38_1;
    a_add_header_38_4;
    a_add_header_38_20;
    a_add_header_39_1;
    a_add_header_39_4;
    a_add_header_39_20;
    a_add_header_40_1;
    a_add_header_40_4;
    a_add_header_40_20;
    a_add_header_41_1;
    a_add_header_41_4;
    a_add_header_41_20;
    a_add_header_42_1;
    a_add_header_42_4;
    a_add_header_42_20;
    a_add_header_43_1;
    a_add_header_43_4;
    a_add_header_43_20;
    a_add_header_44_1;
    a_add_header_44_4;
    a_add_header_44_20;
    a_add_header_45_1;
    a_add_header_45_4;
    a_add_header_45_20;
    a_add_header_46_1;
    a_add_header_46_4;
    a_add_header_46_20;
    a_add_header_47_1;
    a_add_header_47_4;
    a_add_header_47_20;
    a_add_header_48_1;
    a_add_header_48_4;
    a_add_header_48_20;
    a_add_header_49_1;
    a_add_header_49_4;
    a_add_header_49_20;
    a_add_header_50_1;
    a_add_header_50_4;
    a_add_header_50_20;
    a_add_header_51_1;
    a_add_header_51_4;
    a_add_header_51_20;
    a_add_header_52_1;
    a_add_header_52_4;
    a_add_header_52_20;
    a_add_header_53_1;
    a_add_header_53_4;
    a_add_header_53_20;
    a_add_header_54_1;
    a_add_header_54_4;
    a_add_header_54_20;
    a_add_header_55_1;
    a_add_header_55_4;
    a_add_header_55_20;
    a_add_header_56_1;
    a_add_header_56_4;
    a_add_header_56_20;
    a_add_header_57_1;
    a_add_header_57_4;
    a_add_header_57_20;
    a_add_header_58_1;
    a_add_header_58_4;
    a_add_header_58_20;
    a_add_header_59_1;
    a_add_header_59_4;
    a_add_header_59_20;
    a_add_header_60_1;
    a_add_header_60_4;
    a_add_header_60_20;
    a_add_header_61_1;
    a_add_header_61_4;
    a_add_header_61_20;
    a_add_header_62_1;
    a_add_header_62_4;
    a_add_header_62_20;
    a_add_header_63_1;
    a_add_header_63_4;
    a_add_header_63_20;
    a_add_header_64_1;
    a_add_header_64_4;
    a_add_header_64_20;
    a_add_header_65_1;
    a_add_header_65_4;
    a_add_header_65_20;
    a_add_header_66_1;
    a_add_header_66_4;
    a_add_header_66_20;
    a_add_header_67_1;
    a_add_header_67_4;
    a_add_header_67_20;
    a_add_header_68_1;
    a_add_header_68_4;
    a_add_header_68_20;
    a_add_header_69_1;
    a_add_header_69_4;
    a_add_header_69_20;
    a_add_header_70_1;
    a_add_header_70_4;
    a_add_header_70_20;
    a_add_header_71_1;
    a_add_header_71_4;
    a_add_header_71_20;
    a_add_header_72_1;
    a_add_header_72_4;
    a_add_header_72_20;
    a_add_header_73_1;
    a_add_header_73_4;
    a_add_header_73_20;
    a_add_header_74_1;
    a_add_header_74_4;
    a_add_header_74_20;
    a_add_header_75_1;
    a_add_header_75_4;
    a_add_header_75_20;
    a_add_header_76_1;
    a_add_header_76_4;
    a_add_header_76_20;
    a_add_header_77_1;
    a_add_header_77_4;
    a_add_header_77_20;
    a_add_header_78_1;
    a_add_header_78_4;
    a_add_header_78_20;
    a_add_header_79_1;
    a_add_header_79_4;
    a_add_header_79_20;
    a_add_header_80_1;
    a_add_header_80_4;
    a_add_header_80_20;
    a_add_header_81_1;
    a_add_header_81_4;
    a_add_header_82_1;
    a_add_header_82_4;
    a_add_header_83_1;
    a_add_header_83_4;
    a_add_header_84_1;
    a_add_header_84_4;
    a_add_header_85_1;
    a_add_header_85_4;
    a_add_header_86_1;
    a_add_header_86_4;
    a_add_header_87_1;
    a_add_header_87_4;
    a_add_header_88_1;
    a_add_header_88_4;
    a_add_header_89_1;
    a_add_header_89_4;
    a_add_header_90_1;
    a_add_header_90_4;
    a_add_header_91_1;
    a_add_header_91_4;
    a_add_header_92_1;
    a_add_header_92_4;
    a_add_header_93_1;
    a_add_header_93_4;
    a_add_header_94_1;
    a_add_header_94_4;
    a_add_header_95_1;
    a_add_header_95_4;
    a_add_header_96_1;
    a_add_header_96_4;
    a_add_header_97_1;
    a_add_header_98_1;
    a_add_header_99_1;
  }
}

table t_add_header_11_1 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_11_2 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_11_3 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_11_4 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_11_5 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_11_6 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_11_7 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_11_8 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_11_9 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_11_10 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_11_11 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_12_1 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_12_2 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_12_3 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_12_4 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_12_5 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_12_6 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_12_7 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_12_8 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_12_9 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_12_10 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_12_11 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_13_1 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_13_2 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_13_3 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_13_4 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_13_5 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_13_6 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_13_7 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_13_8 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_13_9 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_13_10 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_13_11 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_21_1 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_21_2 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_21_3 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_21_4 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_21_5 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_21_6 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_21_7 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_21_8 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_21_9 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_21_10 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_21_11 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_22_1 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_22_2 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_22_3 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_22_4 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_22_5 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_22_6 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_22_7 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_22_8 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_22_9 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_22_10 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_22_11 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_23_1 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_23_2 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_23_3 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_23_4 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_23_5 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_23_6 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_23_7 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_23_8 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_23_9 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_23_10 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_23_11 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_31_1 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_31_2 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_31_3 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_31_4 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_31_5 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_31_6 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_31_7 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_31_8 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_31_9 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_31_10 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_31_11 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_32_1 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_32_2 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_32_3 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_32_4 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_32_5 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_32_6 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_32_7 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_32_8 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_32_9 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_32_10 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_32_11 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_33_1 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_33_2 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_33_3 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_33_4 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_33_5 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_33_6 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_33_7 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_33_8 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_33_9 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_33_10 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

table t_add_header_33_11 {
  reads {
    meta_ctrl.program : exact;
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  action_profile : addhs;
}

control do_add_header_11 {
  apply(t_addh_prep_11);
  if (meta_primitive_state.hmanip_remaining > 0) {
    apply(t_add_header_11_1);
    if (meta_primitive_state.hmanip_remaining > 0) {
      apply(t_add_header_11_2);
      if (meta_primitive_state.hmanip_remaining > 0) {
        apply(t_add_header_11_3);
        if (meta_primitive_state.hmanip_remaining > 0) {
          apply(t_add_header_11_4);
          if (meta_primitive_state.hmanip_remaining > 0) {
            apply(t_add_header_11_5);
            if (meta_primitive_state.hmanip_remaining > 0) {
              apply(t_add_header_11_6);
              if (meta_primitive_state.hmanip_remaining > 0) {
                apply(t_add_header_11_7);
                if (meta_primitive_state.hmanip_remaining > 0) {
                  apply(t_add_header_11_8);
                  if (meta_primitive_state.hmanip_remaining > 0) {
                    apply(t_add_header_11_9);
                    if (meta_primitive_state.hmanip_remaining > 0) {
                      apply(t_add_header_11_10);
                      if (meta_primitive_state.hmanip_remaining > 0) {
                        apply(t_add_header_11_11);
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

control do_add_header_12 {
  apply(t_addh_prep_12);
  if (meta_primitive_state.hmanip_remaining > 0) {
    apply(t_add_header_12_1);
    if (meta_primitive_state.hmanip_remaining > 0) {
      apply(t_add_header_12_2);
      if (meta_primitive_state.hmanip_remaining > 0) {
        apply(t_add_header_12_3);
        if (meta_primitive_state.hmanip_remaining > 0) {
          apply(t_add_header_12_4);
          if (meta_primitive_state.hmanip_remaining > 0) {
            apply(t_add_header_12_5);
            if (meta_primitive_state.hmanip_remaining > 0) {
              apply(t_add_header_12_6);
              if (meta_primitive_state.hmanip_remaining > 0) {
                apply(t_add_header_12_7);
                if (meta_primitive_state.hmanip_remaining > 0) {
                  apply(t_add_header_12_8);
                  if (meta_primitive_state.hmanip_remaining > 0) {
                    apply(t_add_header_12_9);
                    if (meta_primitive_state.hmanip_remaining > 0) {
                      apply(t_add_header_12_10);
                      if (meta_primitive_state.hmanip_remaining > 0) {
                        apply(t_add_header_12_11);
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

control do_add_header_13 {
  apply(t_addh_prep_13);
  if (meta_primitive_state.hmanip_remaining > 0) {
    apply(t_add_header_13_1);
    if (meta_primitive_state.hmanip_remaining > 0) {
      apply(t_add_header_13_2);
      if (meta_primitive_state.hmanip_remaining > 0) {
        apply(t_add_header_13_3);
        if (meta_primitive_state.hmanip_remaining > 0) {
          apply(t_add_header_13_4);
          if (meta_primitive_state.hmanip_remaining > 0) {
            apply(t_add_header_13_5);
            if (meta_primitive_state.hmanip_remaining > 0) {
              apply(t_add_header_13_6);
              if (meta_primitive_state.hmanip_remaining > 0) {
                apply(t_add_header_13_7);
                if (meta_primitive_state.hmanip_remaining > 0) {
                  apply(t_add_header_13_8);
                  if (meta_primitive_state.hmanip_remaining > 0) {
                    apply(t_add_header_13_9);
                    if (meta_primitive_state.hmanip_remaining > 0) {
                      apply(t_add_header_13_10);
                      if (meta_primitive_state.hmanip_remaining > 0) {
                        apply(t_add_header_13_11);
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

control do_add_header_21 {
  apply(t_addh_prep_21);
  if (meta_primitive_state.hmanip_remaining > 0) {
    apply(t_add_header_21_1);
    if (meta_primitive_state.hmanip_remaining > 0) {
      apply(t_add_header_21_2);
      if (meta_primitive_state.hmanip_remaining > 0) {
        apply(t_add_header_21_3);
        if (meta_primitive_state.hmanip_remaining > 0) {
          apply(t_add_header_21_4);
          if (meta_primitive_state.hmanip_remaining > 0) {
            apply(t_add_header_21_5);
            if (meta_primitive_state.hmanip_remaining > 0) {
              apply(t_add_header_21_6);
              if (meta_primitive_state.hmanip_remaining > 0) {
                apply(t_add_header_21_7);
                if (meta_primitive_state.hmanip_remaining > 0) {
                  apply(t_add_header_21_8);
                  if (meta_primitive_state.hmanip_remaining > 0) {
                    apply(t_add_header_21_9);
                    if (meta_primitive_state.hmanip_remaining > 0) {
                      apply(t_add_header_21_10);
                      if (meta_primitive_state.hmanip_remaining > 0) {
                        apply(t_add_header_21_11);
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

control do_add_header_22 {
  apply(t_addh_prep_22);
  if (meta_primitive_state.hmanip_remaining > 0) {
    apply(t_add_header_22_1);
    if (meta_primitive_state.hmanip_remaining > 0) {
      apply(t_add_header_22_2);
      if (meta_primitive_state.hmanip_remaining > 0) {
        apply(t_add_header_22_3);
        if (meta_primitive_state.hmanip_remaining > 0) {
          apply(t_add_header_22_4);
          if (meta_primitive_state.hmanip_remaining > 0) {
            apply(t_add_header_22_5);
            if (meta_primitive_state.hmanip_remaining > 0) {
              apply(t_add_header_22_6);
              if (meta_primitive_state.hmanip_remaining > 0) {
                apply(t_add_header_22_7);
                if (meta_primitive_state.hmanip_remaining > 0) {
                  apply(t_add_header_22_8);
                  if (meta_primitive_state.hmanip_remaining > 0) {
                    apply(t_add_header_22_9);
                    if (meta_primitive_state.hmanip_remaining > 0) {
                      apply(t_add_header_22_10);
                      if (meta_primitive_state.hmanip_remaining > 0) {
                        apply(t_add_header_22_11);
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

control do_add_header_23 {
  apply(t_addh_prep_23);
  if (meta_primitive_state.hmanip_remaining > 0) {
    apply(t_add_header_23_1);
    if (meta_primitive_state.hmanip_remaining > 0) {
      apply(t_add_header_23_2);
      if (meta_primitive_state.hmanip_remaining > 0) {
        apply(t_add_header_23_3);
        if (meta_primitive_state.hmanip_remaining > 0) {
          apply(t_add_header_23_4);
          if (meta_primitive_state.hmanip_remaining > 0) {
            apply(t_add_header_23_5);
            if (meta_primitive_state.hmanip_remaining > 0) {
              apply(t_add_header_23_6);
              if (meta_primitive_state.hmanip_remaining > 0) {
                apply(t_add_header_23_7);
                if (meta_primitive_state.hmanip_remaining > 0) {
                  apply(t_add_header_23_8);
                  if (meta_primitive_state.hmanip_remaining > 0) {
                    apply(t_add_header_23_9);
                    if (meta_primitive_state.hmanip_remaining > 0) {
                      apply(t_add_header_23_10);
                      if (meta_primitive_state.hmanip_remaining > 0) {
                        apply(t_add_header_23_11);
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

control do_add_header_31 {
  apply(t_addh_prep_31);
  if (meta_primitive_state.hmanip_remaining > 0) {
    apply(t_add_header_31_1);
    if (meta_primitive_state.hmanip_remaining > 0) {
      apply(t_add_header_31_2);
      if (meta_primitive_state.hmanip_remaining > 0) {
        apply(t_add_header_31_3);
        if (meta_primitive_state.hmanip_remaining > 0) {
          apply(t_add_header_31_4);
          if (meta_primitive_state.hmanip_remaining > 0) {
            apply(t_add_header_31_5);
            if (meta_primitive_state.hmanip_remaining > 0) {
              apply(t_add_header_31_6);
              if (meta_primitive_state.hmanip_remaining > 0) {
                apply(t_add_header_31_7);
                if (meta_primitive_state.hmanip_remaining > 0) {
                  apply(t_add_header_31_8);
                  if (meta_primitive_state.hmanip_remaining > 0) {
                    apply(t_add_header_31_9);
                    if (meta_primitive_state.hmanip_remaining > 0) {
                      apply(t_add_header_31_10);
                      if (meta_primitive_state.hmanip_remaining > 0) {
                        apply(t_add_header_31_11);
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

control do_add_header_32 {
  apply(t_addh_prep_32);
  if (meta_primitive_state.hmanip_remaining > 0) {
    apply(t_add_header_32_1);
    if (meta_primitive_state.hmanip_remaining > 0) {
      apply(t_add_header_32_2);
      if (meta_primitive_state.hmanip_remaining > 0) {
        apply(t_add_header_32_3);
        if (meta_primitive_state.hmanip_remaining > 0) {
          apply(t_add_header_32_4);
          if (meta_primitive_state.hmanip_remaining > 0) {
            apply(t_add_header_32_5);
            if (meta_primitive_state.hmanip_remaining > 0) {
              apply(t_add_header_32_6);
              if (meta_primitive_state.hmanip_remaining > 0) {
                apply(t_add_header_32_7);
                if (meta_primitive_state.hmanip_remaining > 0) {
                  apply(t_add_header_32_8);
                  if (meta_primitive_state.hmanip_remaining > 0) {
                    apply(t_add_header_32_9);
                    if (meta_primitive_state.hmanip_remaining > 0) {
                      apply(t_add_header_32_10);
                      if (meta_primitive_state.hmanip_remaining > 0) {
                        apply(t_add_header_32_11);
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

control do_add_header_33 {
  apply(t_addh_prep_33);
  if (meta_primitive_state.hmanip_remaining > 0) {
    apply(t_add_header_33_1);
    if (meta_primitive_state.hmanip_remaining > 0) {
      apply(t_add_header_33_2);
      if (meta_primitive_state.hmanip_remaining > 0) {
        apply(t_add_header_33_3);
        if (meta_primitive_state.hmanip_remaining > 0) {
          apply(t_add_header_33_4);
          if (meta_primitive_state.hmanip_remaining > 0) {
            apply(t_add_header_33_5);
            if (meta_primitive_state.hmanip_remaining > 0) {
              apply(t_add_header_33_6);
              if (meta_primitive_state.hmanip_remaining > 0) {
                apply(t_add_header_33_7);
                if (meta_primitive_state.hmanip_remaining > 0) {
                  apply(t_add_header_33_8);
                  if (meta_primitive_state.hmanip_remaining > 0) {
                    apply(t_add_header_33_9);
                    if (meta_primitive_state.hmanip_remaining > 0) {
                      apply(t_add_header_33_10);
                      if (meta_primitive_state.hmanip_remaining > 0) {
                        apply(t_add_header_33_11);
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

