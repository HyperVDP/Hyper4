a_meta_setup(width, num, start) {
  modify_field(meta.width, width);
  modify_field(meta.num, num);
  modify_field(meta.i_0, start);
  modify_field(meta.i_1, start+1);
  modify_field(meta.i_2, start+2);
  modify_field(meta.i_3, start+3);
  modify_field(meta.i_4, start+4);
  modify_field(meta.i_5, start+5);
  modify_field(meta.i_6, start+6);
  modify_field(meta.i_7, start+7);
  modify_field(meta.i_8, start+8);
  modify_field(meta.i_9, start+9);
  modify_field(meta.i_10, start+10);
  modify_field(meta.i_11, start+11);
  modify_field(meta.i_12, start+12);
  modify_field(meta.i_13, start+13);
  modify_field(meta.i_14, start+14);
  modify_field(meta.i_15, start+15);
}

table meta_setup_1 {
  actions {
    a_meta_setup;
  }
}

action a_meta_setbytes_1() {
  register_read(meta.field00, tmeta_8_r, meta.i_0);
}

action a_meta_setbytes_2() {
  register_read(meta.field00, tmeta_8_r, meta.i_0);
  register_read(meta.field01, tmeta_8_r, meta.i_1);
}

action a_meta_setbytes_3() {
  register_read(meta.field00, tmeta_8_r, meta.i_0);
  register_read(meta.field01, tmeta_8_r, meta.i_1);
  register_read(meta.field02, tmeta_8_r, meta.i_2);
}

action a_meta_setbytes_4() {
  register_read(meta.field00, tmeta_8_r, meta.i_0);
  register_read(meta.field01, tmeta_8_r, meta.i_1);
  register_read(meta.field02, tmeta_8_r, meta.i_2);
  register_read(meta.field03, tmeta_8_r, meta.i_3);
}

action a_meta_setbytes_5() {
  register_read(meta.field00, tmeta_8_r, meta.i_0);
  register_read(meta.field01, tmeta_8_r, meta.i_1);
  register_read(meta.field02, tmeta_8_r, meta.i_2);
  register_read(meta.field03, tmeta_8_r, meta.i_3);
  register_read(meta.field04, tmeta_8_r, meta.i_4);
}

action a_meta_setbytes_6() {
  register_read(meta.field00, tmeta_8_r, meta.i_0);
  register_read(meta.field01, tmeta_8_r, meta.i_1);
  register_read(meta.field02, tmeta_8_r, meta.i_2);
  register_read(meta.field03, tmeta_8_r, meta.i_3);
  register_read(meta.field04, tmeta_8_r, meta.i_4);
  register_read(meta.field05, tmeta_8_r, meta.i_5);
}

action a_meta_setbytes_7() {
  register_read(meta.field00, tmeta_8_r, meta.i_0);
  register_read(meta.field01, tmeta_8_r, meta.i_1);
  register_read(meta.field02, tmeta_8_r, meta.i_2);
  register_read(meta.field03, tmeta_8_r, meta.i_3);
  register_read(meta.field04, tmeta_8_r, meta.i_4);
  register_read(meta.field05, tmeta_8_r, meta.i_5);
  register_read(meta.field06, tmeta_8_r, meta.i_6);
}

action a_meta_setbytes_8() {
  register_read(meta.field00, tmeta_8_r, meta.i_0);
  register_read(meta.field01, tmeta_8_r, meta.i_1);
  register_read(meta.field02, tmeta_8_r, meta.i_2);
  register_read(meta.field03, tmeta_8_r, meta.i_3);
  register_read(meta.field04, tmeta_8_r, meta.i_4);
  register_read(meta.field05, tmeta_8_r, meta.i_5);
  register_read(meta.field06, tmeta_8_r, meta.i_6);
  register_read(meta.field07, tmeta_8_r, meta.i_7);
}

table meta_setbytes_1 {
  reads {
    meta.num : exact;
  }
  actions {
    a_meta_setbytes_1;
    a_meta_setbytes_2;
    a_meta_setbytes_3;
    a_meta_setbytes_4;
    a_meta_setbytes_5;
    a_meta_setbytes_6;
    a_meta_setbytes_7;
    a_meta_setbytes_8;
  }
}

action a_meta_setwords_1() {
  register_read(meta.field00, tmeta_16_r, meta.i_0);
}

action a_meta_setwords_2() {
  register_read(meta.field00, tmeta_16_r, meta.i_0);
  register_read(meta.field01, tmeta_16_r, meta.i_1);
}

action a_meta_setwords_3() {
  register_read(meta.field00, tmeta_16_r, meta.i_0);
  register_read(meta.field01, tmeta_16_r, meta.i_1);
  register_read(meta.field02, tmeta_16_r, meta.i_2);
}

action a_meta_setwords_4() {
  register_read(meta.field00, tmeta_16_r, meta.i_0);
  register_read(meta.field01, tmeta_16_r, meta.i_1);
  register_read(meta.field02, tmeta_16_r, meta.i_2);
  register_read(meta.field03, tmeta_16_r, meta.i_3);
}

action a_meta_setwords_5() {
  register_read(meta.field00, tmeta_16_r, meta.i_0);
  register_read(meta.field01, tmeta_16_r, meta.i_1);
  register_read(meta.field02, tmeta_16_r, meta.i_2);
  register_read(meta.field03, tmeta_16_r, meta.i_3);
  register_read(meta.field04, tmeta_16_r, meta.i_4);
}

action a_meta_setwords_6() {
  register_read(meta.field00, tmeta_16_r, meta.i_0);
  register_read(meta.field01, tmeta_16_r, meta.i_1);
  register_read(meta.field02, tmeta_16_r, meta.i_2);
  register_read(meta.field03, tmeta_16_r, meta.i_3);
  register_read(meta.field04, tmeta_16_r, meta.i_4);
  register_read(meta.field05, tmeta_16_r, meta.i_5);
}

action a_meta_setwords_7() {
  register_read(meta.field00, tmeta_16_r, meta.i_0);
  register_read(meta.field01, tmeta_16_r, meta.i_1);
  register_read(meta.field02, tmeta_16_r, meta.i_2);
  register_read(meta.field03, tmeta_16_r, meta.i_3);
  register_read(meta.field04, tmeta_16_r, meta.i_4);
  register_read(meta.field05, tmeta_16_r, meta.i_5);
  register_read(meta.field06, tmeta_16_r, meta.i_6);
}

action a_meta_setwords_8() {
  register_read(meta.field00, tmeta_16_r, meta.i_0);
  register_read(meta.field01, tmeta_16_r, meta.i_1);
  register_read(meta.field02, tmeta_16_r, meta.i_2);
  register_read(meta.field03, tmeta_16_r, meta.i_3);
  register_read(meta.field04, tmeta_16_r, meta.i_4);
  register_read(meta.field05, tmeta_16_r, meta.i_5);
  register_read(meta.field06, tmeta_16_r, meta.i_6);
  register_read(meta.field07, tmeta_16_r, meta.i_7);
}

table meta_setwords_1 {
  reads {
    meta.num : exact;
  }
  actions {
    a_meta_setwords_1;
    a_meta_setwords_2;
    a_meta_setwords_3;
    a_meta_setwords_4;
    a_meta_setwords_5;
    a_meta_setwords_6;
    a_meta_setwords_7;
    a_meta_setwords_8;
  }
}

control switch_meta_1 {
  apply(meta_setup_1);
  if(meta.width == 8) {
    apply(meta_setbytes_1);
  }
  else {
    apply(meta_setwords_1);
  }
}
