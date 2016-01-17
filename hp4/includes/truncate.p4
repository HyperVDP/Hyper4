// truncate

action a_truncate(val) {
  truncate(val);
}

table t_truncate {
  actions {
    a_truncate;
  }
}

control do_truncate_11 {
  apply(t_truncate);
}
