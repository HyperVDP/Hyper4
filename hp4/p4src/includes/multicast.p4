action a_multicast(highport) {
  modify_field(
}

table t_multicast_11 {
  actions {
    a_multicast;
  }
}

table t_multicast_12 { actions { a_multicast; }}
table t_multicast_13 { actions { a_multicast; }}
table t_multicast_21 { actions { a_multicast; }}
table t_multicast_22 { actions { a_multicast; }}
table t_multicast_23 { actions { a_multicast; }}
table t_multicast_31 { actions { a_multicast; }}
table t_multicast_32 { actions { a_multicast; }}
table t_multicast_33 { actions { a_multicast; }}

control do_multicast_11 {
  apply(t_multicast_11);
}

control do_multicast_12 { apply(t_multicast_12); }
control do_multicast_13 { apply(t_multicast_13); }
control do_multicast_21 { apply(t_multicast_21); }
control do_multicast_22 { apply(t_multicast_22); }
control do_multicast_23 { apply(t_multicast_23); }
control do_multicast_31 { apply(t_multicast_31); }
control do_multicast_32 { apply(t_multicast_32); }
control do_multicast_33 { apply(t_multicast_33); }
