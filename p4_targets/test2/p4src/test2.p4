/*
meta_ctrl.stage_state is changed:

(c) hp4.p4::ingress -> (c) stages.p4::stage1 -> (t) stages.p4::set_program_state_11 -> (a) match.p4::set_program_state

from test.p4 it appears the problem can be downstream...
*/

#include "includes/defines.p4"
#include "includes/headers.p4"
#include "includes/parser.p4"
#include "includes/stages.p4"
#include "includes/match.p4"
#include "includes/setup.p4"

metadata meta_ctrl_t meta_ctrl;
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
  setup();
  stage1();
}
