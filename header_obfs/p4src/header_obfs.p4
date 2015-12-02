/*
DAVID HANCOCK
Univ of Utah

Simple L2 header obfuscation by permuting the bytes.  The permutation
is determined and fed to the switch by the controller.

Try:
./run_demo.bash
(open new terminal, cd to this directory)
./run_cli1.bash < normal_ops
- at this point, you should be able to send and receive pings between
  h1 and h2
./run_cli1.bash < broken_ops
- at this point, you should no longer be able to send and receive
  pings between h1 and h2
./run_cli1.bash < repair_ops
- at this point, you should once again be able to send and receive
  pings between h1 and h2
*/

header_type gen_ether_t {
  fields {
    data : 8;
  }
}

header_type gen_ipv4_t {
  fields {
    data : 8;
  }
}

header_type gen_tcp_t {
  fields {
    data : 8;
  }
}

header_type meta_t {
  fields {
    tmp : 8;
    tmp2 : 8;
    curr : 8;
    perm : 8;
  }
}

header gen_ether_t gen_ether[14];
header gen_ipv4_t gen_ipv4[20]; // TODO: cover options
header gen_tcp_t gen_tcp[20]; // TODO: cover options

metadata meta_t meta;

register r_gen_ether {
  width : 8;
  instance_count : 14;
}

parser start {
  extract(gen_ether[next]);
  extract(gen_ether[next]);
  extract(gen_ether[next]);
  extract(gen_ether[next]);
  extract(gen_ether[next]);
  extract(gen_ether[next]);
  extract(gen_ether[next]);
  extract(gen_ether[next]);
  extract(gen_ether[next]);
  extract(gen_ether[next]);
  extract(gen_ether[next]);
  extract(gen_ether[next]);
  extract(gen_ether[next]);
  extract(gen_ether[next]);
  return ingress;
}

action a_obfsprep() {
  register_write(r_gen_ether, 0, gen_ether[0].data);
  register_write(r_gen_ether, 1, gen_ether[1].data); 
  register_write(r_gen_ether, 2, gen_ether[2].data);
  register_write(r_gen_ether, 3, gen_ether[3].data);
  register_write(r_gen_ether, 4, gen_ether[4].data);
  register_write(r_gen_ether, 5, gen_ether[5].data);
  register_write(r_gen_ether, 6, gen_ether[6].data);
  register_write(r_gen_ether, 7, gen_ether[7].data);
  register_write(r_gen_ether, 8, gen_ether[8].data);
  register_write(r_gen_ether, 9, gen_ether[9].data);
  register_write(r_gen_ether, 10, gen_ether[10].data);
  register_write(r_gen_ether, 11, gen_ether[11].data);
  register_write(r_gen_ether, 12, gen_ether[12].data);
  register_write(r_gen_ether, 13, gen_ether[13].data);
}

action a_obfsfinish() {
  register_read(gen_ether[0].data, r_gen_ether, 0);
  register_read(gen_ether[1].data, r_gen_ether, 1);
  register_read(gen_ether[2].data, r_gen_ether, 2);
  register_read(gen_ether[3].data, r_gen_ether, 3);
  register_read(gen_ether[4].data, r_gen_ether, 4);
  register_read(gen_ether[5].data, r_gen_ether, 5);
  register_read(gen_ether[6].data, r_gen_ether, 6);
  register_read(gen_ether[7].data, r_gen_ether, 7);
  register_read(gen_ether[8].data, r_gen_ether, 8);
  register_read(gen_ether[9].data, r_gen_ether, 9);
  register_read(gen_ether[10].data, r_gen_ether, 10);
  register_read(gen_ether[11].data, r_gen_ether, 11);
  register_read(gen_ether[12].data, r_gen_ether, 12);
  register_read(gen_ether[13].data, r_gen_ether, 13);
}

table obfsprep {
  actions {
    a_obfsprep;
  }
}

action a_obfsl2(p0, p1, p2, p3, p4, p5, p6,
                p7, p8, p9, p10, p11, p12, p13) {
  modify_field(meta.curr, 0);
  modify_field(meta.perm, p0);
  register_read(meta.tmp, r_gen_ether, meta.perm);
  register_read(meta.tmp2, r_gen_ether, meta.curr);
  register_write(r_gen_ether, meta.perm, meta.tmp2);
  register_write(r_gen_ether, meta.curr, meta.tmp);

  add_to_field(meta.curr, 1);
  modify_field(meta.perm, p1);
  register_read(meta.tmp, r_gen_ether, meta.perm);
  register_read(meta.tmp2, r_gen_ether, meta.curr);
  register_write(r_gen_ether, meta.perm, meta.tmp2);
  register_write(r_gen_ether, meta.curr, meta.tmp);

  add_to_field(meta.curr, 1);
  modify_field(meta.perm, p2);
  register_read(meta.tmp, r_gen_ether, meta.perm);
  register_read(meta.tmp2, r_gen_ether, meta.curr);
  register_write(r_gen_ether, meta.perm, meta.tmp2);
  register_write(r_gen_ether, meta.curr, meta.tmp);

  add_to_field(meta.curr, 1);
  modify_field(meta.perm, p3);
  register_read(meta.tmp, r_gen_ether, meta.perm);
  register_read(meta.tmp2, r_gen_ether, meta.curr);
  register_write(r_gen_ether, meta.perm, meta.tmp2);
  register_write(r_gen_ether, meta.curr, meta.tmp);

  add_to_field(meta.curr, 1);
  modify_field(meta.perm, p4);
  register_read(meta.tmp, r_gen_ether, meta.perm);
  register_read(meta.tmp2, r_gen_ether, meta.curr);
  register_write(r_gen_ether, meta.perm, meta.tmp2);
  register_write(r_gen_ether, meta.curr, meta.tmp);

  add_to_field(meta.curr, 1);
  modify_field(meta.perm, p5);
  register_read(meta.tmp, r_gen_ether, meta.perm);
  register_read(meta.tmp2, r_gen_ether, meta.curr);
  register_write(r_gen_ether, meta.perm, meta.tmp2);
  register_write(r_gen_ether, meta.curr, meta.tmp);

  add_to_field(meta.curr, 1);
  modify_field(meta.perm, p6);
  register_read(meta.tmp, r_gen_ether, meta.perm);
  register_read(meta.tmp2, r_gen_ether, meta.curr);
  register_write(r_gen_ether, meta.perm, meta.tmp2);
  register_write(r_gen_ether, meta.curr, meta.tmp);

  add_to_field(meta.curr, 1);
  modify_field(meta.perm, p7);
  register_read(meta.tmp, r_gen_ether, meta.perm);
  register_read(meta.tmp2, r_gen_ether, meta.curr);
  register_write(r_gen_ether, meta.perm, meta.tmp2);
  register_write(r_gen_ether, meta.curr, meta.tmp);

  add_to_field(meta.curr, 1);
  modify_field(meta.perm, p8);
  register_read(meta.tmp, r_gen_ether, meta.perm);
  register_read(meta.tmp2, r_gen_ether, meta.curr);
  register_write(r_gen_ether, meta.perm, meta.tmp2);
  register_write(r_gen_ether, meta.curr, meta.tmp);

  add_to_field(meta.curr, 1);
  modify_field(meta.perm, p9);
  register_read(meta.tmp, r_gen_ether, meta.perm);
  register_read(meta.tmp2, r_gen_ether, meta.curr);
  register_write(r_gen_ether, meta.perm, meta.tmp2);
  register_write(r_gen_ether, meta.curr, meta.tmp);

  add_to_field(meta.curr, 1);
  modify_field(meta.perm, p10);
  register_read(meta.tmp, r_gen_ether, meta.perm);
  register_read(meta.tmp2, r_gen_ether, meta.curr);
  register_write(r_gen_ether, meta.perm, meta.tmp2);
  register_write(r_gen_ether, meta.curr, meta.tmp);

  add_to_field(meta.curr, 1);
  modify_field(meta.perm, p11);
  register_read(meta.tmp, r_gen_ether, meta.perm);
  register_read(meta.tmp2, r_gen_ether, meta.curr);
  register_write(r_gen_ether, meta.perm, meta.tmp2);
  register_write(r_gen_ether, meta.curr, meta.tmp);

  add_to_field(meta.curr, 1);
  modify_field(meta.perm, p12);
  register_read(meta.tmp, r_gen_ether, meta.perm);
  register_read(meta.tmp2, r_gen_ether, meta.curr);
  register_write(r_gen_ether, meta.perm, meta.tmp2);
  register_write(r_gen_ether, meta.curr, meta.tmp);

  add_to_field(meta.curr, 1);
  modify_field(meta.perm, p13);
  register_read(meta.tmp, r_gen_ether, meta.perm);
  register_read(meta.tmp2, r_gen_ether, meta.curr);
  register_write(r_gen_ether, meta.perm, meta.tmp2);
  register_write(r_gen_ether, meta.curr, meta.tmp); 
}

table obfsl2 {
  reads {
    gen_ether[0] : valid;
  }
  actions {
    a_obfsl2;
  }
}

table obfsfinish {
  actions {
    a_obfsfinish;
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
    apply(obfsprep);
    apply(obfsl2);
    apply(obfsfinish);
    apply(forward);
}

control egress {
}
