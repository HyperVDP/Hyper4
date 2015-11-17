header_type localmetadata_t {
  fields {
    var1 : 8;
  }
}

metadata localmetadata_t localmetadata;

field_list fl_localmetadata {
  localmetadata.var1;
}

parser start {
  return main;
}

action a_resubmit_test() {
  modify_field(localmetadata.var1, 0);
  resubmit(fl_localmetadata);
}

action _no_op() {
  no_op();
}

table t_resubmit_test {
  reads {
    standard_metadata.instance_type : exact;
  }
  actions {
    a_resubmit_test;
    _no_op;
  }
}

control main {
  apply(t_resubmit_test);
}
