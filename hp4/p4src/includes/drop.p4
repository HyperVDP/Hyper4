/*
David Hancock
FLUX Research Group
University of Utah
dhancock@cs.utah.edu

HyPer4: A P4 Program to Run Other P4 Programs

drop.p4: Implements the drop primitive.
*/

action a_drop() {
  drop();
}

table t_drop_11 {
  actions {
    a_drop;
  }
}

table t_drop_12 {
  actions {
    a_drop;
  }
}

table t_drop_13 {
  actions {
    a_drop;
  }
}

table t_drop_21 {
  actions {
    a_drop;
  }
}

table t_drop_22 {
  actions {
    a_drop;
  }
}

table t_drop_23 {
  actions {
    a_drop;
  }
}

table t_drop_31 {
  actions {
    a_drop;
  }
}

table t_drop_32 {
  actions {
    a_drop;
  }
}

table t_drop_33 {
  actions {
    a_drop;
  }
}

control do_drop_11 {
  apply(t_drop_11);
}

control do_drop_12 {
  apply(t_drop_12);
}

control do_drop_13 {
  apply(t_drop_13);
}

control do_drop_21 {
  apply(t_drop_21);
}

control do_drop_22 {
  apply(t_drop_22);
}

control do_drop_23 {
  apply(t_drop_23);
}

control do_drop_31 {
  apply(t_drop_31);
}

control do_drop_32 {
  apply(t_drop_32);
}

control do_drop_33 {
  apply(t_drop_33);
}