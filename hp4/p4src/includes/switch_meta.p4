/*
David Hancock
FLUX Research Group
University of Utah
dhancock@cs.utah.edu

HyPer4: A P4 Program to Run Other P4 Programs

switch_meta.p4: Prepares HP4 to handle table matching: exact, using metadata
*/

action a_tmeta_setup(tm_width, num, begin) {
  modify_field(tmeta.tm_width, tm_width);
  modify_field(tmeta.num, num);
  modify_field(tmeta.i_0, begin);
  modify_field(tmeta.i_1, begin+1);
  modify_field(tmeta.i_2, begin+2);
  modify_field(tmeta.i_3, begin+3);
  modify_field(tmeta.i_4, begin+4);
  modify_field(tmeta.i_5, begin+5);
  modify_field(tmeta.i_6, begin+6);
  modify_field(tmeta.i_7, begin+7);
  modify_field(tmeta.i_8, begin+8);
  modify_field(tmeta.i_9, begin+9);
  modify_field(tmeta.i_10, begin+10);
  modify_field(tmeta.i_11, begin+11);
  modify_field(tmeta.i_12, begin+12);
  modify_field(tmeta.i_13, begin+13);
  modify_field(tmeta.i_14, begin+14);
  modify_field(tmeta.i_15, begin+15);
}

table tmeta_setup_1 {
  reads {
    meta_ctrl.program : exact;
  }
  actions {
    a_tmeta_setup;
  }
}

table tmeta_setup_2 { reads { meta_ctrl.program : exact; } actions { a_tmeta_setup; } }
table tmeta_setup_3 { reads { meta_ctrl.program : exact; } actions { a_tmeta_setup; } }

action a_tmeta_setbytes_1() {
  register_read(tmeta.field00, tmeta_8_r, tmeta.i_0);
}

action a_tmeta_setbytes_2() {
  register_read(tmeta.field00, tmeta_8_r, tmeta.i_0);
  register_read(tmeta.field01, tmeta_8_r, tmeta.i_1);
}

action a_tmeta_setbytes_3() {
  register_read(tmeta.field00, tmeta_8_r, tmeta.i_0);
  register_read(tmeta.field01, tmeta_8_r, tmeta.i_1);
  register_read(tmeta.field02, tmeta_8_r, tmeta.i_2);
}

action a_tmeta_setbytes_4() {
  register_read(tmeta.field00, tmeta_8_r, tmeta.i_0);
  register_read(tmeta.field01, tmeta_8_r, tmeta.i_1);
  register_read(tmeta.field02, tmeta_8_r, tmeta.i_2);
  register_read(tmeta.field03, tmeta_8_r, tmeta.i_3);
}

action a_tmeta_setbytes_5() {
  register_read(tmeta.field00, tmeta_8_r, tmeta.i_0);
  register_read(tmeta.field01, tmeta_8_r, tmeta.i_1);
  register_read(tmeta.field02, tmeta_8_r, tmeta.i_2);
  register_read(tmeta.field03, tmeta_8_r, tmeta.i_3);
  register_read(tmeta.field04, tmeta_8_r, tmeta.i_4);
}

action a_tmeta_setbytes_6() {
  register_read(tmeta.field00, tmeta_8_r, tmeta.i_0);
  register_read(tmeta.field01, tmeta_8_r, tmeta.i_1);
  register_read(tmeta.field02, tmeta_8_r, tmeta.i_2);
  register_read(tmeta.field03, tmeta_8_r, tmeta.i_3);
  register_read(tmeta.field04, tmeta_8_r, tmeta.i_4);
  register_read(tmeta.field05, tmeta_8_r, tmeta.i_5);
}

action a_tmeta_setbytes_7() {
  register_read(tmeta.field00, tmeta_8_r, tmeta.i_0);
  register_read(tmeta.field01, tmeta_8_r, tmeta.i_1);
  register_read(tmeta.field02, tmeta_8_r, tmeta.i_2);
  register_read(tmeta.field03, tmeta_8_r, tmeta.i_3);
  register_read(tmeta.field04, tmeta_8_r, tmeta.i_4);
  register_read(tmeta.field05, tmeta_8_r, tmeta.i_5);
  register_read(tmeta.field06, tmeta_8_r, tmeta.i_6);
}

action a_tmeta_setbytes_8() {
  register_read(tmeta.field00, tmeta_8_r, tmeta.i_0);
  register_read(tmeta.field01, tmeta_8_r, tmeta.i_1);
  register_read(tmeta.field02, tmeta_8_r, tmeta.i_2);
  register_read(tmeta.field03, tmeta_8_r, tmeta.i_3);
  register_read(tmeta.field04, tmeta_8_r, tmeta.i_4);
  register_read(tmeta.field05, tmeta_8_r, tmeta.i_5);
  register_read(tmeta.field06, tmeta_8_r, tmeta.i_6);
  register_read(tmeta.field07, tmeta_8_r, tmeta.i_7);
}

action_profile tmeta_setbytes_actions {
  actions {
    a_tmeta_setbytes_1;
    a_tmeta_setbytes_2;
    a_tmeta_setbytes_3;
    a_tmeta_setbytes_4;
    a_tmeta_setbytes_5;
    a_tmeta_setbytes_6;
    a_tmeta_setbytes_7;
    a_tmeta_setbytes_8;
  }
}

table tmeta_setbytes_1 {
  reads {
    tmeta.num : exact;
  }
  action_profile : tmeta_setbytes_actions;
}

table tmeta_setbytes_2 { reads { tmeta.num : exact; }
  action_profile : tmeta_setbytes_actions; }
table tmeta_setbytes_3 { reads { tmeta.num : exact; }
  action_profile : tmeta_setbytes_actions; }

action a_tmeta_setwords_1() {
  register_read(tmeta.field00, tmeta_16_r, tmeta.i_0);
}

action a_tmeta_setwords_2() {
  register_read(tmeta.field00, tmeta_16_r, tmeta.i_0);
  register_read(tmeta.field01, tmeta_16_r, tmeta.i_1);
}

action a_tmeta_setwords_3() {
  register_read(tmeta.field00, tmeta_16_r, tmeta.i_0);
  register_read(tmeta.field01, tmeta_16_r, tmeta.i_1);
  register_read(tmeta.field02, tmeta_16_r, tmeta.i_2);
}

action a_tmeta_setwords_4() {
  register_read(tmeta.field00, tmeta_16_r, tmeta.i_0);
  register_read(tmeta.field01, tmeta_16_r, tmeta.i_1);
  register_read(tmeta.field02, tmeta_16_r, tmeta.i_2);
  register_read(tmeta.field03, tmeta_16_r, tmeta.i_3);
}

action a_tmeta_setwords_5() {
  register_read(tmeta.field00, tmeta_16_r, tmeta.i_0);
  register_read(tmeta.field01, tmeta_16_r, tmeta.i_1);
  register_read(tmeta.field02, tmeta_16_r, tmeta.i_2);
  register_read(tmeta.field03, tmeta_16_r, tmeta.i_3);
  register_read(tmeta.field04, tmeta_16_r, tmeta.i_4);
}

action a_tmeta_setwords_6() {
  register_read(tmeta.field00, tmeta_16_r, tmeta.i_0);
  register_read(tmeta.field01, tmeta_16_r, tmeta.i_1);
  register_read(tmeta.field02, tmeta_16_r, tmeta.i_2);
  register_read(tmeta.field03, tmeta_16_r, tmeta.i_3);
  register_read(tmeta.field04, tmeta_16_r, tmeta.i_4);
  register_read(tmeta.field05, tmeta_16_r, tmeta.i_5);
}

action a_tmeta_setwords_7() {
  register_read(tmeta.field00, tmeta_16_r, tmeta.i_0);
  register_read(tmeta.field01, tmeta_16_r, tmeta.i_1);
  register_read(tmeta.field02, tmeta_16_r, tmeta.i_2);
  register_read(tmeta.field03, tmeta_16_r, tmeta.i_3);
  register_read(tmeta.field04, tmeta_16_r, tmeta.i_4);
  register_read(tmeta.field05, tmeta_16_r, tmeta.i_5);
  register_read(tmeta.field06, tmeta_16_r, tmeta.i_6);
}

action a_tmeta_setwords_8() {
  register_read(tmeta.field00, tmeta_16_r, tmeta.i_0);
  register_read(tmeta.field01, tmeta_16_r, tmeta.i_1);
  register_read(tmeta.field02, tmeta_16_r, tmeta.i_2);
  register_read(tmeta.field03, tmeta_16_r, tmeta.i_3);
  register_read(tmeta.field04, tmeta_16_r, tmeta.i_4);
  register_read(tmeta.field05, tmeta_16_r, tmeta.i_5);
  register_read(tmeta.field06, tmeta_16_r, tmeta.i_6);
  register_read(tmeta.field07, tmeta_16_r, tmeta.i_7);
}

action_profile tmeta_setwords_actions {
  actions {
    a_tmeta_setwords_1;
    a_tmeta_setwords_2;
    a_tmeta_setwords_3;
    a_tmeta_setwords_4;
    a_tmeta_setwords_5;
    a_tmeta_setwords_6;
    a_tmeta_setwords_7;
    a_tmeta_setwords_8;
  }
}

table tmeta_setwords_1 {
  reads {
    tmeta.num : exact;
  }
  action_profile : tmeta_setwords_actions;
}

table tmeta_setwords_2 { reads { tmeta.num : exact; }
  action_profile : tmeta_setwords_actions; }

table tmeta_setwords_3 { reads { tmeta.num : exact; }
  action_profile : tmeta_setwords_actions; }

control switch_tmeta_1 {
  apply(tmeta_setup_1);
  if(tmeta.tm_width == 8) {
    apply(tmeta_setbytes_1);
  }
  else {
    apply(tmeta_setwords_1);
  }
}

control switch_tmeta_2 {
  apply(tmeta_setup_2);
  if(tmeta.tm_width == 8) {
    apply(tmeta_setbytes_2);
  }
  else {
    apply(tmeta_setwords_2);
  }
}

control switch_tmeta_3 {
  apply(tmeta_setup_3);
  if(tmeta.tm_width == 8) {
    apply(tmeta_setbytes_3);
  }
  else {
    apply(tmeta_setwords_3);
  }
}
