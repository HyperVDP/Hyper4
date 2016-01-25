// Demo error: p4c-bm / HLIR doesn't like attempt to use action parameter as
//  second parameter of push (or pop).  Language spec clearly says this should
//  be allowed, however.

header_type h_t {
  fields {
    data : 8;
  }
}

header h_t h[4];

parser start {
  return ingress;
}

action myaction(c) {
  push(h, c);
}

table t {
  actions {
    myaction;
  }
}

control ingress {
  apply(t);
}
