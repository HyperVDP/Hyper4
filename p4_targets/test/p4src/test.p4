/*
Demonstrates trigger to make hlir remove 'useless condition' on line 61
when lines 48 and 52 are commented out
*/

header_type meta_t {
  fields {
    val : 8;
  }
}

header meta_t meta;

parser start {
  return ingress;
}

action a1(val) {
  modify_field(meta.val, val);
}

table t1 {
  reads {
    standard_metadata.ingress_port : exact;
  }
  actions {
    a1;
  }
}

action _drop() {
  drop();
}

table t_a {
  actions {
    _drop;
  }
}

table t_b {
  actions {
    _drop;
  }
}

control a {
//  apply(t_a);
}

control b {
//  apply(t_b);
}

control ingress {
  apply(t1);
  if(meta.val == 0) {
    a();
  } else {
    b();
  }
}

control egress {
}
