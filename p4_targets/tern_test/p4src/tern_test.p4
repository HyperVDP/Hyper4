header_type ternary_test_t {
  fields {
    bogus : 64;
  }
}
metadata ternary_test_t ternary_test;

parser start {
  return ingress;
}

action _no_op() {
}

table test {
  reads {
    ternary_test.bogus : ternary;
  }
  actions {
    _no_op;
  }
}

control ingress {
    apply(test);
}
