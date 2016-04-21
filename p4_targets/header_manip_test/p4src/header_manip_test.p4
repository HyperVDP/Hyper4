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

/*
action a_copyh() {
  copy_header(extcpy[0], ext[0]);
  copy_header(extcpy[1], ext[1]);
}

table t_copyh {
  actions {
    a_copyh;
  }
}



action a_addh() {
  add_header(ext[0]);
}

table t_addh {
  actions {
    a_addh;
  }
}
*/

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

/*  After step1, we are left with ext_cpy having as many valid
    elements as there are in ext, but really we only want to
    have X valid elements and everything after should be
    invalid (to take advantage of modify_field semantics during
    step6).

    The solution is to push (size of ext - X) elements and then
    pop the same number, leaving X valid elements starting at
    ext_cpy[0], and everything else invalid.

    Despite spec 1.04 saying that push and pop should accept
    VALs as second parameters, which VALs include action
    parameters, e-mail from Valdimir Gurevich 25 Jan 2016
    indicates that realistically targets will restrict the
    second parameter of push/pop to a constant.  Hence, we
    define a different action for every constant we need to
    support.

    In the test case described at the top of this file, we
    should have a packet with 12 bytes for dest and source
    MAC addresses, and then 2 bytes for EtherType, and we
    want to insert a 4 byte 802.1Q tag between the two
    sections.  ext and ext_cpy have 20 elements.  So X = 12
    and size of ext - X = 8.
*/

action a_step1b_01() {  push(ext_cpy, 1); pop(ext_cpy, 1); }
action a_step1b_02() {  push(ext_cpy, 2); pop(ext_cpy, 2); }
action a_step1b_03() {  push(ext_cpy, 3); pop(ext_cpy, 3); }
action a_step1b_04() {  push(ext_cpy, 4); pop(ext_cpy, 4); }
action a_step1b_05() {  push(ext_cpy, 5); pop(ext_cpy, 5); }
action a_step1b_06() {  push(ext_cpy, 6); pop(ext_cpy, 6); }
action a_step1b_07() {  push(ext_cpy, 7); pop(ext_cpy, 7); }
action a_step1b_08() {  push(ext_cpy, 8); pop(ext_cpy, 8); }
action a_step1b_09() {  push(ext_cpy, 9); pop(ext_cpy, 9); }
action a_step1b_10() {  push(ext_cpy, 10); pop(ext_cpy, 10); }

table step1b {
  actions {
    a_step1b_01;
    a_step1b_02;
    a_step1b_03;
    a_step1b_04;
    a_step1b_05;
    a_step1b_06;
    a_step1b_07;
    a_step1b_08;
    a_step1b_09;
    a_step1b_10;
  }
}

action a_step1bpush_01() {  push(ext_cpy, 1); }
action a_step1bpush_02() {  push(ext_cpy, 2); }
action a_step1bpush_03() {  push(ext_cpy, 3); }
action a_step1bpush_04() {  push(ext_cpy, 4); }
action a_step1bpush_05() {  push(ext_cpy, 5); }
action a_step1bpush_06() {  push(ext_cpy, 6); }
action a_step1bpush_07() {  push(ext_cpy, 7); }
action a_step1bpush_08() {  push(ext_cpy, 8); }
action a_step1bpush_09() {  push(ext_cpy, 9); }
action a_step1bpush_10() {  push(ext_cpy, 10); }

table step1bpush {
  actions {
    a_step1bpush_01;
    a_step1bpush_02;
    a_step1bpush_03;
    a_step1bpush_04;
    a_step1bpush_05;
    a_step1bpush_06;
    a_step1bpush_07;
    a_step1bpush_08;
    a_step1bpush_09;
    a_step1bpush_10;
  }
}

action a_step1bpop_01() {  pop(ext_cpy, 1); }
action a_step1bpop_02() {  pop(ext_cpy, 2); }
action a_step1bpop_03() {  pop(ext_cpy, 3); }
action a_step1bpop_04() {  pop(ext_cpy, 4); }
action a_step1bpop_05() {  pop(ext_cpy, 5); }
action a_step1bpop_06() {  pop(ext_cpy, 6); }
action a_step1bpop_07() {  pop(ext_cpy, 7); }
action a_step1bpop_08() {  pop(ext_cpy, 8); }
action a_step1bpop_09() {  pop(ext_cpy, 9); }
action a_step1bpop_10() {  pop(ext_cpy, 10); }

table step1bpop {
  actions {
    a_step1bpop_01;
    a_step1bpop_02;
    a_step1bpop_03;
    a_step1bpop_04;
    a_step1bpop_05;
    a_step1bpop_06;
    a_step1bpop_07;
    a_step1bpop_08;
    a_step1bpop_09;
    a_step1bpop_10;
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
  }
}

action a_push_ext_01() { push(ext, 1); }
action a_push_ext_02() { push(ext, 2); }
action a_push_ext_03() { push(ext, 3); }
action a_push_ext_04() { push(ext, 4); }
action a_push_ext_05() { push(ext, 5); }
action a_push_ext_06() { push(ext, 6); }
action a_push_ext_07() { push(ext, 7); }
action a_push_ext_08() { push(ext, 8); }
action a_push_ext_09() { push(ext, 9); }
action a_push_ext_10() { push(ext, 10); }
action a_push_ext_11() { push(ext, 11); }
action a_push_ext_12() { push(ext, 12); }
action a_push_ext_13() { push(ext, 13); }
action a_push_ext_14() { push(ext, 14); }
action a_push_ext_15() { push(ext, 15); }
action a_push_ext_16() { push(ext, 16); }

table step3 {
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
  }
}

action a_step4_1(val0) {
  modify_field(ext[0].data, val0);
}

action a_step4_2(val0, val1) {
  modify_field(ext[0].data, val0);
  modify_field(ext[1].data, val1);
}

action a_step4_3(val0, val1, val2) {
  modify_field(ext[0].data, val0);
  modify_field(ext[1].data, val1);
  modify_field(ext[2].data, val2);
}

action a_step4_4(val0, val1, val2, val3) {
  modify_field(ext[0].data, val0);
  modify_field(ext[1].data, val1);
  modify_field(ext[2].data, val2);
  modify_field(ext[3].data, val3);
}

table step4 {
  actions {
    a_step4_1;
    a_step4_2;
    a_step4_3;
    a_step4_4;
  }
}

table step5 {
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
  }
}

action a_step6() {
  modify_field(ext[0].data, ext_cpy[0].data);
  modify_field(ext[1].data, ext_cpy[1].data);
  modify_field(ext[2].data, ext_cpy[2].data);
  modify_field(ext[3].data, ext_cpy[3].data);
  modify_field(ext[4].data, ext_cpy[4].data);
  modify_field(ext[5].data, ext_cpy[5].data);
  modify_field(ext[6].data, ext_cpy[6].data);
  modify_field(ext[7].data, ext_cpy[7].data);
  modify_field(ext[8].data, ext_cpy[8].data);
  modify_field(ext[9].data, ext_cpy[9].data);
  modify_field(ext[10].data, ext_cpy[10].data);
  modify_field(ext[11].data, ext_cpy[11].data);
  modify_field(ext[12].data, ext_cpy[12].data);
  modify_field(ext[13].data, ext_cpy[13].data);
  modify_field(ext[14].data, ext_cpy[14].data);
  modify_field(ext[15].data, ext_cpy[15].data);
  modify_field(ext[16].data, ext_cpy[16].data);
  modify_field(ext[17].data, ext_cpy[17].data);
  modify_field(ext[18].data, ext_cpy[18].data);
  modify_field(ext[19].data, ext_cpy[19].data);
  pop(ext_cpy, 20);
}

table step6 {
  actions {
    a_step6;
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

action _no_op() {
}

table check {
  reads {
    ext_cpy[11] : valid;
    ext_cpy[12] : valid;
    ext_cpy[13] : valid;
    ext_cpy[14] : valid;
    ext_cpy[15] : valid;
    ext_cpy[16] : valid;
    ext_cpy[17] : valid;
    ext_cpy[18] : valid;
    ext_cpy[19] : valid;
  }
  actions {
    _no_op;
  }
}

control ingress {
  if(meta.tag_present == 0) {
    apply(step1);  // copy all elements from ext to ext_cpy
    // apply(step1b); // push / pop
    // apply(check); <-- THIS TEST FAILS; problem with either
    //                   parallelism or pop semantics
    apply(step1bpush);
    apply(step1bpop);
    apply(check);
    apply(step2);
    apply(step3);
    apply(step4);
    apply(step5);
    apply(step6);
  }
  apply(fwd);
}
