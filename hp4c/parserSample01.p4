header_type s_t {
  fields {
    one : 8;
  }
}

header s_t s;
header s_t a;
header s_t b;
header s_t c;

parser start {
  extract(s);
  return select(s.one) {
    0x00: p_A;
    default: ingress;
  }
}

parser p_A {
  extract(a);
  return select(a.one) {
    0x00: p_B;
    default: ingress;
  }
}

parser p_B {
  extract(b);
  return select(current(16,16), current(32, 8), b.one) {
    0x00000000: p_C;
    default: ingress;
  }
}

parser p_C {
  extract(c);
  return ingress;
}

control ingress {
}
