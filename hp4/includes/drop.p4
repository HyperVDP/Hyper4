action a_drop() {
  drop();
}

table t_drop {
  actions {
    a_drop;
  }
}

control do_drop {
  apply(t_drop);
}
