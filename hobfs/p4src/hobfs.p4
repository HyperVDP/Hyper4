/*
DAVID HANCOCK
Univ of Utah

Simple L2 header obfuscation by permuting the bytes.  The permutation
is determined and fed to the switch by the controller.
*/

header_type ether_t {
  fields {
    data : 8;
  }
}

header_type meta_t {
  fields {
    t0 : 8;
    t1 : 8;
    t2 : 8;
    t3 : 8;
    t4 : 8;
    t5 : 8;
    t6 : 8;
    t7 : 8;
    t8 : 8;
    t9 : 8;
    t10 : 8;
    t11 : 8;
    t12 : 8;
    t13 : 8;
  }
}

header ether_t ether[14];

metadata meta_t meta;

register r_tmp {
  width : 8;
  instance_count : 14;
}

parser start {
  extract(ether[next]);
  extract(ether[next]);
  extract(ether[next]);
  extract(ether[next]);
  extract(ether[next]);
  extract(ether[next]);
  extract(ether[next]);
  extract(ether[next]);
  extract(ether[next]);
  extract(ether[next]);
  extract(ether[next]);
  extract(ether[next]);
  extract(ether[next]);
  extract(ether[next]);
  return ingress;
}

action a_obfsfinish() {
  register_read(ether[0].data, r_tmp, 0);
  register_read(ether[1].data, r_tmp, 1);
  register_read(ether[2].data, r_tmp, 2);
  register_read(ether[3].data, r_tmp, 3);
  register_read(ether[4].data, r_tmp, 4);
  register_read(ether[5].data, r_tmp, 5);
  register_read(ether[6].data, r_tmp, 6);
  register_read(ether[7].data, r_tmp, 7);
  register_read(ether[8].data, r_tmp, 8);
  register_read(ether[9].data, r_tmp, 9);
  register_read(ether[10].data, r_tmp, 10);
  register_read(ether[11].data, r_tmp, 11);
  register_read(ether[12].data, r_tmp, 12);
  register_read(ether[13].data, r_tmp, 13);
}

table obfsfinish {
  actions {
    a_obfsfinish;
  }
}

action a_obfsl2(p0, p1, p2, p3, p4, p5, p6,
                p7, p8, p9, p10, p11, p12, p13) {
  modify_field(meta.t0, ether[0].data);
  register_write(r_tmp, p0, meta.t0);
  modify_field(meta.t1, ether[1].data);
  register_write(r_tmp, p1, meta.t1);
  modify_field(meta.t2, ether[2].data);
  register_write(r_tmp, p2, meta.t2);
  modify_field(meta.t3, ether[3].data);
  register_write(r_tmp, p3, meta.t3);
  modify_field(meta.t4, ether[4].data);
  register_write(r_tmp, p4, meta.t4);
  modify_field(meta.t5, ether[5].data);
  register_write(r_tmp, p5, meta.t5);
  modify_field(meta.t6, ether[6].data);
  register_write(r_tmp, p6, meta.t6);
  modify_field(meta.t7, ether[7].data);
  register_write(r_tmp, p7, meta.t7);
  modify_field(meta.t8, ether[8].data);
  register_write(r_tmp, p8, meta.t8);
  modify_field(meta.t9, ether[9].data);
  register_write(r_tmp, p9, meta.t9);
  modify_field(meta.t10, ether[10].data);
  register_write(r_tmp, p10, meta.t10);
  modify_field(meta.t11, ether[11].data);
  register_write(r_tmp, p11, meta.t11);
  modify_field(meta.t12, ether[12].data);
  register_write(r_tmp, p12, meta.t12);
  modify_field(meta.t13, ether[13].data);
  register_write(r_tmp, p13, meta.t13);
}

table obfsl2 {
  actions {
    a_obfsl2;
  }
}

action set_egr(egress_spec) {
    modify_field(standard_metadata.egress_spec, egress_spec);
}

table forward {
    reads {
        standard_metadata.ingress_port : exact;
    }
    actions {
        set_egr;
    }
}

control ingress {
    apply(obfsl2);
    apply(obfsfinish);
    apply(forward);
}

control egress {
}
