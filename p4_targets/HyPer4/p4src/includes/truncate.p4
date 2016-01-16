// truncate

action a_truncate(val) {
  truncate(val);
}

table t_truncate {
  actions {
    a_truncate;
  }
}

control do_truncate {
  apply(t_truncate);
}
