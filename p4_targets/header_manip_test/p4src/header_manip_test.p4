header_type ext_t {
  fields {
    data : 8;
  }
}

header ext_t ext[20];
header ext_t extcpy[20];

parser start {
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  return ingress;
}

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

control ingress {
  apply(t_addh);
}
