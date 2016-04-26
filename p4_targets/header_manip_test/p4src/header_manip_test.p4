/*
Test key concepts required for add_header implementation

Test case: insert an 802.1Q tag between Ethernet source and
EtherType

The target program defines three header types:
- EtherMACs: 12 B
  .dest : 48b
  .source : 48b
- Ether802_1Q: 4 B
  .TPID : 16b
  .TCI : 16b
- EtherType: 2 B
  .type : 16b

The parser inspects bytes 13 & 14 to test for the value 0x8100,
extracts Ether802_1Q and then EtherType if so, extracts just
EtherType otherwise.

If an Ether802_1Q tag is not present, the switch adds one
via add_header, based on port on which the packet was received.
*/

header_type ext_t {
  fields {
    data : 8;
  }
}

header ext_t ext[20];
header ext_t ext_cpy[20];

header_type meta_t {
  fields {
    tag_present: 8;
  }
}

metadata meta_t meta;

parser start {
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);

  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);

  return select(current(0, 16)) {
    0x8100:   p_tag;
    default:  p_ethertype;
  }
}

parser p_tag {
  set_metadata(meta.tag_present, 1);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  return p_ethertype;
}

parser p_ethertype {
  extract(ext[next]);
  extract(ext[next]);
  return ingress;
}

action a_step0_01() { push(ext_cpy, 1); }
action a_step0_02() { push(ext_cpy, 2); }
action a_step0_03() { push(ext_cpy, 3); }
action a_step0_04() { push(ext_cpy, 4); }
action a_step0_05() { push(ext_cpy, 5); }
action a_step0_06() { push(ext_cpy, 6); }
action a_step0_07() { push(ext_cpy, 7); }
action a_step0_08() { push(ext_cpy, 8); }
action a_step0_09() { push(ext_cpy, 9); }
action a_step0_10() { push(ext_cpy, 10); }
action a_step0_12() { push(ext_cpy, 12); }

table step0 {
  actions {
    a_step0_01;
    a_step0_02;
    a_step0_03;
    a_step0_04;
    a_step0_05;
    a_step0_06;
    a_step0_07;
    a_step0_08;
    a_step0_09;
    a_step0_10;
    a_step0_12;
  }
}

action a_step1() {
  copy_header(ext_cpy[0], ext[0]);
  copy_header(ext_cpy[1], ext[1]);
  copy_header(ext_cpy[2], ext[2]);
  copy_header(ext_cpy[3], ext[3]);
  copy_header(ext_cpy[4], ext[4]);
  copy_header(ext_cpy[5], ext[5]);
  copy_header(ext_cpy[6], ext[6]);
  copy_header(ext_cpy[7], ext[7]);
  copy_header(ext_cpy[8], ext[8]);
  copy_header(ext_cpy[9], ext[9]);
  copy_header(ext_cpy[10], ext[10]);
  copy_header(ext_cpy[11], ext[11]);
  copy_header(ext_cpy[12], ext[12]);
  copy_header(ext_cpy[13], ext[13]);
  copy_header(ext_cpy[14], ext[14]);
  copy_header(ext_cpy[15], ext[15]);
  copy_header(ext_cpy[16], ext[16]);
  copy_header(ext_cpy[17], ext[17]);
  copy_header(ext_cpy[18], ext[18]);
  copy_header(ext_cpy[19], ext[19]);
}

table step1 {
  actions {
    a_step1;
  }
}

action a_pop_ext_01() { pop(ext, 1);}
action a_pop_ext_02() { pop(ext, 2);}
action a_pop_ext_03() { pop(ext, 3);}
action a_pop_ext_04() { pop(ext, 4);}
action a_pop_ext_05() { pop(ext, 5);}
action a_pop_ext_06() { pop(ext, 6);}
action a_pop_ext_07() { pop(ext, 7);}
action a_pop_ext_08() { pop(ext, 8);}
action a_pop_ext_09() { pop(ext, 9);}
action a_pop_ext_10() { pop(ext, 10);}
action a_pop_ext_11() { pop(ext, 11);}
action a_pop_ext_12() { pop(ext, 12);}
action a_pop_ext_13() { pop(ext, 13);}
action a_pop_ext_14() { pop(ext, 14);}
action a_pop_ext_15() { pop(ext, 15);}
action a_pop_ext_16() { pop(ext, 16);}
action a_pop_ext_17() { pop(ext, 17);}
action a_pop_ext_18() { pop(ext, 18);}
action a_pop_ext_19() { pop(ext, 19);}
action a_push_ext_01() { push(ext, 1);}
action a_push_ext_02() { push(ext, 2);}
action a_push_ext_03() { push(ext, 3);}
action a_push_ext_04() { push(ext, 4);}
action a_push_ext_05() { push(ext, 5);}
action a_push_ext_06() { push(ext, 6);}
action a_push_ext_07() { push(ext, 7);}
action a_push_ext_08() { push(ext, 8);}
action a_push_ext_09() { push(ext, 9);}
action a_push_ext_10() { push(ext, 10);}
action a_push_ext_11() { push(ext, 11);}
action a_push_ext_12() { push(ext, 12);}
action a_push_ext_13() { push(ext, 13);}
action a_push_ext_14() { push(ext, 14);}
action a_push_ext_15() { push(ext, 15);}
action a_push_ext_16() { push(ext, 16);}
action a_push_ext_17() { push(ext, 17);}
action a_push_ext_18() { push(ext, 18);}
action a_push_ext_19() { push(ext, 19);}

table step2 {
  actions {
    a_pop_ext_01;
    a_pop_ext_02;
    a_pop_ext_03;
    a_pop_ext_04;
    a_pop_ext_05;
    a_pop_ext_06;
    a_pop_ext_07;
    a_pop_ext_08;
    a_pop_ext_09;
    a_pop_ext_10;
    a_pop_ext_11;
    a_pop_ext_12;
    a_pop_ext_13;
    a_pop_ext_14;
    a_pop_ext_15;
    a_pop_ext_16;
    a_pop_ext_17;
    a_pop_ext_18;
    a_pop_ext_19;
    a_push_ext_01;
    a_push_ext_02;
    a_push_ext_03;
    a_push_ext_04;
    a_push_ext_05;
    a_push_ext_06;
    a_push_ext_07;
    a_push_ext_08;
    a_push_ext_09;
    a_push_ext_10;
    a_push_ext_11;
    a_push_ext_12;
    a_push_ext_13;
    a_push_ext_14;
    a_push_ext_15;
    a_push_ext_16;
    a_push_ext_17;
    a_push_ext_18;
    a_push_ext_19;
  }
}

action a_step3_1(val0) {
  modify_field(ext[0].data, val0);
}

action a_step3_2(val0, val1) {
  modify_field(ext[0].data, val0);
  modify_field(ext[1].data, val1);
}

action a_step3_3(val0, val1, val2) {
  modify_field(ext[0].data, val0);
  modify_field(ext[1].data, val1);
  modify_field(ext[2].data, val2);
}

action a_step3_4(val0, val1, val2, val3) {
  modify_field(ext[0].data, val0);
  modify_field(ext[1].data, val1);
  modify_field(ext[2].data, val2);
  modify_field(ext[3].data, val3);
}

table step3 {
  actions {
    a_step3_1;
    a_step3_2;
    a_step3_3;
    a_step3_4;
  }
}

table step4 {
  actions {
    a_push_ext_01;
    a_push_ext_02;
    a_push_ext_03;
    a_push_ext_04;
    a_push_ext_05;
    a_push_ext_06;
    a_push_ext_07;
    a_push_ext_08;
    a_push_ext_09;
    a_push_ext_10;
    a_push_ext_11;
    a_push_ext_12;
    a_push_ext_13;
    a_push_ext_14;
    a_push_ext_15;
    a_push_ext_16;
    a_push_ext_17;
    a_push_ext_18;
    a_push_ext_19;
  }
}

action a_step5_01() {
  copy_header(ext[0], ext_cpy[0]);
}

action a_step5_12() {
  copy_header(ext[0], ext_cpy[0]);
  copy_header(ext[1], ext_cpy[1]);
  copy_header(ext[2], ext_cpy[2]);
  copy_header(ext[3], ext_cpy[3]);
  copy_header(ext[4], ext_cpy[4]);
  copy_header(ext[5], ext_cpy[5]);
  copy_header(ext[6], ext_cpy[6]);
  copy_header(ext[7], ext_cpy[7]);
  copy_header(ext[8], ext_cpy[8]);
  copy_header(ext[9], ext_cpy[9]);
  copy_header(ext[10], ext_cpy[10]);
  copy_header(ext[11], ext_cpy[11]);
}

table step5 {
  actions {
    a_step5_01;
    a_step5_12;
  }
}

action a_fwd(port) {
  modify_field(standard_metadata.egress_spec, port);
}

table fwd {
  reads {
    standard_metadata.ingress_port : exact;
  }
  actions {
    a_fwd;
  }
}

control ingress {
  if(meta.tag_present == 0) {
    apply(step0);  // push X elements into ext_cpy
    apply(step1);  // copy all elements from ext to ext_cpy
    apply(step2);  // pop X-A or push A-X elements from/ into ext
    apply(step3);  // write values for data fields in A elements
    apply(step4);  // push X elements into ext
    apply(step5);  // copy all elements from ext_cpy to ext
  }
  apply(fwd);
}
