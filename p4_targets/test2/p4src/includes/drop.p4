action a_drop() {
  drop();
}

table t_drop_11 {
  actions {
    a_drop;
  }
}

table t_drop_12 { actions { a_drop; }}
table t_drop_13 { actions { a_drop; }}

control do_drop_11 {
  apply(t_drop_11);
}

control do_drop_12 { apply(t_drop_12); }
control do_drop_13 { apply(t_drop_13); }
