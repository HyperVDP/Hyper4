header_type testheader_t {
  fields {
    data : 8;
  }
}

header testheader_t testheader;

parser start {
  // extract(testheader);
  return ingress;
}

action _no_op() {
}

table test {
  reads {
    testheader : valid;
  }
  actions {
    _no_op;
  }
}

control ingress {
  apply(test);
}
