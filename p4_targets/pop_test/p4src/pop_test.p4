header_type ext_t {
  fields {
    data : 8;
  }
}

header ext_t ext[2];

parser start {
  extract(ext[0]);
  extract(ext[1]);
  return ingress;
}

action a_pop() {
  pop(ext, 1);
}

table t_pop {
  actions {
    a_pop;
  }
}

action _no_op() {
}

table check1 {
  reads {
    ext[0] : valid;
    ext[1] : valid;
  }
  actions {
    _no_op;
  }
}

table check2 {
  reads {
    ext[0] : valid;
    ext[1] : valid;
  }
  actions {
    _no_op;
  }
}

control ingress {
  apply(check1);
  apply(t_pop);
  apply(check2);
}
