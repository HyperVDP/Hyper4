#include "modify_field.p4"
#include "add_header.p4"

control switch_primitivetype_11 {
  if(meta_primitive_state.primitive == A_MODIFY_FIELD) {
      do_modify_field_11(); // modify_field.p4
  }
  else if(meta_primitive_state.primitive == A_ADD_HEADER) {
    do_add_header_11(); // add_header.p4
  }
/*  else if(meta_primitive_state.primitive == A_DROP) {
    do_drop();
  }
  else if(meta_primitive_state.primitive == A_NO_OP) {
  }
  else if(meta_primitive_state.primitive == A_TRUNCATE) {
    do_truncate_11();
  }
*/
  // ... (other primitive types)
}
