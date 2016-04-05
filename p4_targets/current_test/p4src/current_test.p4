#define UNK 0
#define IS_IP 1
#define NOT_IP 2

#define H1 1
#define H2 2
#define H_UNK 0

header_type meta_ctrl_t {
  fields {
    stage : 8;
    host : 8;
  }
}

metadata meta_ctrl_t meta_ctrl;

header_type extracted_t {
  fields {
    data : 272;
  }
}

header extracted_t extracted;

header_type csum_t {
  fields {
    sum : 32;
    rshift : 16;
    div : 8;
    final : 16;
    csmask : 272;
  }
}

metadata csum_t csum;

// source MAC-based host detection
parser start {
  return select(current(40, 8)) {
    0x00: p_h1;
    0x01: p_h2;
  }
}

parser p_h1 {
  set_metadata(meta_ctrl.host, H1);
  return pnext;
}

parser p_h2 {
  set_metadata(meta_ctrl.host, H2);
  return pnext;
}

parser pnext {
  return select(current(96, 16)) {
    0x0800: p_ip;
    default: p_not_ip;
  }
}

parser p_ip {
  extract(extracted);
  set_metadata(meta_ctrl.stage, IS_IP);
  return ingress;
}

parser p_not_ip {
  extract(extracted);
  set_metadata(meta_ctrl.stage, NOT_IP);
  return ingress;
}

action a_act(val, msk) {
  modify_field(extracted.data, (extracted.data & ~msk) | (val & msk));
}

action _no_op() {
}

table t_act {
  reads {
    meta_ctrl.stage : exact;
    meta_ctrl.host : exact;
  }
  actions {
    a_act;
    _no_op;
  }
}

action a_fwd(port) {
  modify_field(standard_metadata.egress_spec, port);
}

table fwd {
  reads {
    standard_metadata.ingress_port : exact;
  }
  actions {
    a_fwd;
  }
}

action a_ipv4_csum16(rshift_base, div) {
  modify_field(csum.rshift, rshift_base);
  modify_field(csum.div, div);
  modify_field(csum.sum, csum.sum + ((extracted.data >> csum.rshift) & 0xFFFF));
  modify_field(csum.rshift, csum.rshift + csum.div);
  modify_field(csum.sum, csum.sum + ((extracted.data >> csum.rshift) & 0xFFFF));
  modify_field(csum.rshift, csum.rshift + csum.div);
  modify_field(csum.sum, csum.sum + ((extracted.data >> csum.rshift) & 0xFFFF));
  modify_field(csum.rshift, csum.rshift + csum.div);
  modify_field(csum.sum, csum.sum + ((extracted.data >> csum.rshift) & 0xFFFF));
  modify_field(csum.rshift, csum.rshift + csum.div);
  modify_field(csum.rshift, csum.rshift + csum.div);
  modify_field(csum.sum, csum.sum + ((extracted.data >> csum.rshift) & 0xFFFF));
  modify_field(csum.rshift, csum.rshift + csum.div);
  modify_field(csum.sum, csum.sum + ((extracted.data >> csum.rshift) & 0xFFFF));
  modify_field(csum.rshift, csum.rshift + csum.div);
  modify_field(csum.sum, csum.sum + ((extracted.data >> csum.rshift) & 0xFFFF));
  modify_field(csum.rshift, csum.rshift + csum.div);
  modify_field(csum.sum, csum.sum + ((extracted.data >> csum.rshift) & 0xFFFF));
  modify_field(csum.rshift, csum.rshift + csum.div);
  modify_field(csum.sum, csum.sum + ((extracted.data >> csum.rshift) & 0xFFFF));
  modify_field(csum.sum, (csum.sum + (csum.sum >> csum.div)) & 0xFFFF);

  modify_field(csum.final, ~csum.sum);

  modify_field(csum.csmask, 0xFFFF << 64);
  modify_field(extracted.data, (extracted.data & ~csum.csmask) | ((csum.final << 64) & csum.csmask));
}

table csum16 {
  reads {
    meta_ctrl.stage : exact;
  }
  actions {
    a_ipv4_csum16;
    _no_op;
  }
}

control ingress {
  apply(t_act);
  apply(fwd);
}

control egress {
  apply(csum16);
}
