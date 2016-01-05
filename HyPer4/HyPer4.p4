#include "includes/headers.p4"
#include "includes/parser.p4"
#include "includes/setup.p4"
#include "includes/stages.p4"
#include "includes/switch_stdmeta.p4"
#include "includes/defines.p4"

metadata meta_ctrl_t meta_ctrl;
metadata meta_prog_state_t meta_prog_state;
metadata meta_primitive_metadata_t meta_primitive_metadata;
metadata stdmeta_match_t stdmeta_match;
metadata extracted_t extracted;
metadata meta_t meta;
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
  setup;  // setup.p4
  stage1; // stages.p4
  stage2; // stages.p4
  stage3; // stages.p4
}
