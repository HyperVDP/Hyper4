#define M1_F01_VAL	42

header_type m1_t {
  fields {
    f01 : 8;
    f02 : 16;
  }
}

header_type m2_t {
  fields {
    f01: 8;
  }
}

metadata m1_t m1;
metadata m2_t m2;

parser start {
  set_metadata(m1.f01, M1_F01_VAL);
  set_metadata(m2.f01, m1.f01);
  return select (m2.f01) {
    0 : parse_error p_drop;
    default: ingress;
  }
}

parser_exception p_drop {
  parser_drop;
}

//...

action update_m1(val1, val2) {
  modify_field(m1.f01, val1);
  modify_field(m1.f02, val2);
}

//...

table t1 {
  reads {
    m1.f01 : exact;
  }
  actions {
    update_m1;
  }
}

// ...

control ingress {
  if(m1.f01 == m2.f01) {
	  apply(t1);
  }
}
