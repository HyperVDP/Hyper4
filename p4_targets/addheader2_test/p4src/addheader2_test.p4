/*
add_header implementation test
*/

header_type ext_t {
  fields {
    data : 8;
  }
}

header_type meta_ctrl_t {
  fields {
    program : 8;
    pr_numbytes : 8;
  }
}

header_type extracted_t {
  fields {
    data : 32;
  }
}

header ext_t ext[4];
metadata meta_ctrl_t meta_ctrl;
metadata extracted_t extracted;
metadata extracted_t temp;

parser start {
  return select(meta_ctrl.pr_numbytes) {
    0 : p2;
    1 : p1;
    2 : p2;
    3 : p3;
    default : p4;
  }
}

parser p1 {
  extract(ext[next]);
  return ingress;
}

parser p2 {
  extract(ext[next]);
  extract(ext[next]);
  set_metadata(meta_ctrl.pr_numbytes, 2);
  return ingress;
}

parser p3 {
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  return ingress;
}  

parser p4 {
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  return ingress;
}

action a_addh(n, o, msk) {
  // save original value of extracted.data:
  modify_field(temp.data, extracted.data);

  // create space for n bytes
  modify_field(extracted.data, extracted.data >> (n*8));

  // using mask to isolate the appropriate bits of extracted.data, write 0x00
  //  everywhere necessary:
  modify_field(extracted.data, 0, msk);

  // restore values for elements prior to insertion point
  modify_field(extracted.data, temp.data, (~msk >> (32 - (o*8))) << (32 - (o*8)));

  // update size of parsed representation
  modify_field(meta_ctrl.pr_numbytes, meta_ctrl.pr_numbytes + n);
}

table t_addh {
  reads {
    meta_ctrl.program : exact;
  }
  actions {
    a_addh;
  }
}

action a_norm() {
  modify_field(extracted.data, extracted.data + (ext[0].data << 24));
  modify_field(extracted.data, extracted.data + (ext[1].data << 16));
  modify_field(extracted.data, extracted.data + (ext[2].data << 8));
  modify_field(extracted.data, extracted.data + (ext[3].data << 0));
}

table t_norm {
  actions {
    a_norm;
  }
}

control do_add_header_X_Y {
  apply(t_addh);
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
  apply(t_norm);
  do_add_header_X_Y();
  apply(fwd);
}

action a_resize_pr_01() {
  pop(ext, 4);
  push(ext, 1);
}

action a_resize_pr_02() {
  pop(ext, 4); push(ext, 2);
}

action a_resize_pr_03() {
  pop(ext, 4); push(ext, 3);
}

action a_resize_pr_04() {
  pop(ext, 4); push(ext, 4);
}

table t_resize_pr {
  reads {
    meta_ctrl.program : exact;
    meta_ctrl.pr_numbytes : exact;
  }
  actions {
    a_resize_pr_01;
    a_resize_pr_02;
    a_resize_pr_03;
    a_resize_pr_04;
  }
}

action a_prep_deparse() {
  modify_field(ext[0].data, (extracted.data >> 24) & 0xFF);
  modify_field(ext[1].data, (extracted.data >> 16) & 0xFF);
  modify_field(ext[2].data, (extracted.data >> 8) & 0xFF);
  modify_field(ext[3].data, (extracted.data >> 0) & 0xFF);
}

table t_prep_deparse {
  actions {
    a_prep_deparse;
  }
}

action _no_op() {
}

table check1 {
  reads {
    ext[0] : valid;
    ext[1] : valid;
    ext[2] : valid;
    ext[3] : valid;
  }
  actions {
    _no_op;
  }
}

table check2 {
  reads {
    ext[0] : valid;
    ext[1] : valid;
    ext[2] : valid;
    ext[3] : valid;
  }
  actions {
    _no_op;
  }
}

control egress {
  apply(check1);
  apply(t_resize_pr);
  apply(check2);
  apply(t_prep_deparse);
}
