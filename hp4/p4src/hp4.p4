#include "includes/defines.p4"
#include "includes/headers.p4"
#include "includes/parser.p4"
#include "includes/setup.p4"
#include "includes/stages.p4"

metadata meta_primitive_state_t meta_primitive_state;
metadata meta_stdmeta_t meta_stdmeta;
metadata extracted_t extracted;
metadata tmeta_t tmeta;
metadata tmeta_8_meta_t tmeta_8_meta;
metadata tmeta_16_meta_t tmeta_16_meta;

register tmeta_8_r {
  width: 8;
  instance_count: TMETA_8_CAPACITY;
}

register tmeta_16_r {
  width: 16;
  instance_count: TMETA_16_CAPACITY;
}

control ingress {
  // setup.p4
  setup();

  // stages.p4
  stage1();
  stage2();
  stage3();
}

field_list clone_fl {
  standard_metadata;
  meta_ctrl;
}

action mod_and_clone(port) {
  modify_field(meta_ctrl.multicast_current_egress, port);
  clone_egress_pkt_to_egress(port, clone_fl);
}

table t_multicast {
  reads {
    meta_ctrl.multicast_current_egress : exact;
  }
  actions {
    mod_and_clone;
    _no_op;
    a_drop;
  }
}

control egress {
  apply(t_multicast);
}
