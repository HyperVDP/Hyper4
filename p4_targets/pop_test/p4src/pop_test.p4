header_type ext_t {
  fields {
    data : 8;
  }
}

header ext_t ext[2];
header ext_t ext_cpy[2];

parser start {
  extract(ext[next]);
  extract(ext[next]);
  return ingress;
}

action a_copy() {
  copy_header(ext_cpy[0], ext[0]);
  copy_header(ext_cpy[1], ext[1]);
}

table t_copy {
  actions {
    a_copy;
  }
}

action a_pop() {
  pop(ext_cpy, 1);
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
    ext_cpy[0] : valid;
    ext_cpy[1] : valid;
  }
  actions {
    _no_op;
  }
}

table check2 {
  reads {
    ext_cpy[0] : valid;
    ext_cpy[1] : valid;
  }
  actions {
    _no_op;
  }
}

control ingress {
  apply(t_copy);
  apply(check1);
  apply(t_pop);
  apply(check2);
}
