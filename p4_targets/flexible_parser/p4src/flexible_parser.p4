#include "includes/headers.p4"

metadata parse_ctrl_t parse_ctrl;
header ext_t ext[100];

parser start {
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  return select(parse_ctrl.numbytes) {
    0 : ingress;
    20 : ingress;
    21 : pr01; // parse remainder, 1 byte
    22 : pr02; // parse remainder, 2 bytes
    23 : pr03; // etc.
    24 : pr04;
    25 : pr05;
    26 : pr06;
    27 : pr07;
    28 : pr08;
    29 : pr09;
    default : p30;
  }
}

parser pr01 {
  extract(ext[next]);
  return ingress;
}

parser pr02 {
  extract(ext[next]);
  extract(ext[next]);
  return ingress;
}

parser pr03 {
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  return ingress;
}

parser pr04 {
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  return ingress;
}

parser pr05 {
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  return ingress;
}

parser pr06 {
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  return ingress;
}

parser pr07 {
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  return ingress;
}

parser pr08 {
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  return ingress;
}

parser pr09 {
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  return ingress;
}

parser p30 {
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  return select(parse_ctrl.numbytes) {
    30 : ingress;
    31 : pr01; // parse remainder, 1 byte
    32 : pr02; // parse remainder, 2 bytes
    33 : pr03; // etc.
    34 : pr04;
    35 : pr05;
    36 : pr06;
    37 : pr07;
    38 : pr08;
    39 : pr09;
    default : p40;
  }
}

parser p40 {
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  return select(parse_ctrl.numbytes) {
    40 : ingress;
    41 : pr01; // parse remainder, 1 byte
    42 : pr02; // parse remainder, 2 bytes
    43 : pr03; // etc.
    44 : pr04;
    45 : pr05;
    46 : pr06;
    47 : pr07;
    48 : pr08;
    49 : pr09;
    default : p50;
  }
}

parser p50 {
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  return select(parse_ctrl.numbytes) {
    50 : ingress;
    51 : pr01; // parse remainder, 1 byte
    52 : pr02; // parse remainder, 2 bytes
    53 : pr03; // etc.
    54 : pr04;
    55 : pr05;
    56 : pr06;
    57 : pr07;
    58 : pr08;
    59 : pr09;
    default : p60;
  }
}

parser p60 {
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  return select(parse_ctrl.numbytes) {
    60 : ingress;
    61 : pr01; // parse remainder, 1 byte
    62 : pr02; // parse remainder, 2 bytes
    63 : pr03; // etc.
    64 : pr04;
    65 : pr05;
    66 : pr06;
    67 : pr07;
    68 : pr08;
    69 : pr09;
    default : p70;
  }
}

parser p70 {
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  return select(parse_ctrl.numbytes) {
    70 : ingress;
    71 : pr01; // parse remainder, 1 byte
    72 : pr02; // parse remainder, 2 bytes
    73 : pr03; // etc.
    74 : pr04;
    75 : pr05;
    76 : pr06;
    77 : pr07;
    78 : pr08;
    79 : pr09;
    default : p80;
  }
}

parser p80 {
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  return select(parse_ctrl.numbytes) {
    80 : ingress;
    81 : pr01; // parse remainder, 1 byte
    82 : pr02; // parse remainder, 2 bytes
    83 : pr03; // etc.
    84 : pr04;
    85 : pr05;
    86 : pr06;
    87 : pr07;
    88 : pr08;
    89 : pr09;
    default : p90;
  }
}

parser p90 {
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  return select(parse_ctrl.numbytes) {
    90 : ingress;
    91 : pr01; // parse remainder, 1 byte
    92 : pr02; // parse remainder, 2 bytes
    93 : pr03; // etc.
    94 : pr04;
    95 : pr05;
    96 : pr06;
    97 : pr07;
    98 : pr08;
    99 : pr09;
    default : p100;
  }
}

parser p100 {
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  extract(ext[next]);
  return ingress;
}

field_list fl_setup {
  parse_ctrl;
}

action initialize(state, numbytes) {
  modify_field(parse_ctrl.state, state);
  modify_field(parse_ctrl.numbytes, numbytes);
}

table check_state {
  reads {
    parse_ctrl.state : exact;
  }
  actions {
    initialize;
    inspect_0_19;
    inspect_20_29;
    inspect_30_39;
    inspect_40_49;
  }
}

table t_inspect_0_19 {
  reads {
    ext[0].data : ternary;
    ext[1].data : ternary;
    ext[2].data : ternary;
    ext[3].data : ternary;
    ext[4].data : ternary;
    ext[5].data : ternary;
    ext[6].data : ternary;
    ext[7].data : ternary;
    ext[8].data : ternary;
    ext[9].data : ternary;
    ext[10].data : ternary;
    ext[11].data : ternary;
    ext[12].data : ternary;
    ext[13].data : ternary;
    ext[14].data : ternary;
    ext[15].data : ternary;
    ext[16].data : ternary;
    ext[17].data : ternary;
    ext[18].data : ternary;
    ext[19].data : ternary;
  }
  actions {
    _no_op;
  }
}

table test2 {
  reads {
    ext[4] : valid;
    ext[14] : valid;
    ext[24] : valid;
    ext[34] : valid;
    ext[44] : valid;
    ext[54] : valid;
    ext[64] : valid;
    ext[74] : valid;
    ext[84] : valid;
  }
  actions {
    _no_op;
  }
}

control ingress {
  apply(setup) {
    _no_op {
      apply(test1);
      apply(test2);
    }
  }
}
