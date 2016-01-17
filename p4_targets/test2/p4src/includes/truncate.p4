// truncate

action a_truncate(val) {
  truncate(val);
}

table t_truncate_11 {
  actions {
    a_truncate;
  }
}

table t_truncate_12 { actions { a_truncate; }}
table t_truncate_13 { actions { a_truncate; }}

control do_truncate_11 {
  apply(t_truncate_11);
}

control do_truncate_12 { apply(t_truncate_12); }
control do_truncate_13 { apply(t_truncate_13); }
