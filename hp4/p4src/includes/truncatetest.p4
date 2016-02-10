/*
David Hancock
FLUX Research Group
University of Utah
dhancock@cs.utah.edu

HyPer4: A P4 Program to Run Other P4 Programs

truncate.p4: Implements the truncate primitive
*/

action a_truncate(val) {
  truncate(val);
}

table t_truncate_11 {
  actions {
    a_truncate;
  }
}

table t_truncate_12 {
  actions {
    a_truncate;
  }
}

table t_truncate_13 {
  actions {
    a_truncate;
  }
}

table t_truncate_21 {
  actions {
    a_truncate;
  }
}

table t_truncate_22 {
  actions {
    a_truncate;
  }
}

table t_truncate_23 {
  actions {
    a_truncate;
  }
}

table t_truncate_31 {
  actions {
    a_truncate;
  }
}

table t_truncate_32 {
  actions {
    a_truncate;
  }
}

table t_truncate_33 {
  actions {
    a_truncate;
  }
}

control do_truncate_11 {
  apply(t_truncate_11;
}

control do_truncate_12 {
  apply(t_truncate_12;
}

control do_truncate_13 {
  apply(t_truncate_13;
}

control do_truncate_21 {
  apply(t_truncate_21;
}

control do_truncate_22 {
  apply(t_truncate_22;
}

control do_truncate_23 {
  apply(t_truncate_23;
}

control do_truncate_31 {
  apply(t_truncate_31;
}

control do_truncate_32 {
  apply(t_truncate_32;
}

control do_truncate_33 {
  apply(t_truncate_33;
}