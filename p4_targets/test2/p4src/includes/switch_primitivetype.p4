#include "modify_field.p4"
//#include "add_header.p4"
#include "drop.p4"
#include "truncate.p4"

control switch_primitivetype_11 {
  if(meta_primitive_state.primitive == A_MODIFY_FIELD) {
      do_modify_field_11(); // modify_field.p4
  }
/*  else if(meta_primitive_state.primitive == A_ADD_HEADER) {
    do_add_header_11(); // add_header.p4
  }*/
  else if(meta_primitive_state.primitive == A_DROP) {
    do_drop_11();
  }
  else if(meta_primitive_state.primitive == A_NO_OP) {
  }
  else if(meta_primitive_state.primitive == A_TRUNCATE) {
    do_truncate_11();
  }
  // ... (other primitive types)
}

control switch_primitivetype_12 {
  if(meta_primitive_state.primitive == A_MODIFY_FIELD) {
      do_modify_field_12(); // modify_field.p4
  }
/*  else if(meta_primitive_state.primitive == A_ADD_HEADER) {
    do_add_header_11(); // add_header.p4
  }*/
  else if(meta_primitive_state.primitive == A_DROP) {
    do_drop_12();
  }
  else if(meta_primitive_state.primitive == A_NO_OP) {
  }
  else if(meta_primitive_state.primitive == A_TRUNCATE) {
    do_truncate_12();
  }
  // ... (other primitive types)
}

control switch_primitivetype_13 {
  if(meta_primitive_state.primitive == A_MODIFY_FIELD) {
      do_modify_field_13(); // modify_field.p4
  }
/*  else if(meta_primitive_state.primitive == A_ADD_HEADER) {
    do_add_header_11(); // add_header.p4
  }*/
  else if(meta_primitive_state.primitive == A_DROP) {
    do_drop_13();
  }
  else if(meta_primitive_state.primitive == A_NO_OP) {
  }
  else if(meta_primitive_state.primitive == A_TRUNCATE) {
    do_truncate_13();
  }
  // ... (other primitive types)
}

control switch_primitivetype_21 {
  if(meta_primitive_state.primitive == A_MODIFY_FIELD) {
      do_modify_field_21(); // modify_field.p4
  }
/*  else if(meta_primitive_state.primitive == A_ADD_HEADER) {
    do_add_header_11(); // add_header.p4
  }*/
  else if(meta_primitive_state.primitive == A_DROP) {
    do_drop_21();
  }
  else if(meta_primitive_state.primitive == A_NO_OP) {
  }
  else if(meta_primitive_state.primitive == A_TRUNCATE) {
    do_truncate_21();
  }
  // ... (other primitive types)
}

control switch_primitivetype_22 {
  if(meta_primitive_state.primitive == A_MODIFY_FIELD) {
      do_modify_field_22(); // modify_field.p4
  }
/*  else if(meta_primitive_state.primitive == A_ADD_HEADER) {
    do_add_header_11(); // add_header.p4
  }*/
  else if(meta_primitive_state.primitive == A_DROP) {
    do_drop_22();
  }
  else if(meta_primitive_state.primitive == A_NO_OP) {
  }
  else if(meta_primitive_state.primitive == A_TRUNCATE) {
    do_truncate_22();
  }
  // ... (other primitive types)
}

control switch_primitivetype_23 {
  if(meta_primitive_state.primitive == A_MODIFY_FIELD) {
      do_modify_field_23(); // modify_field.p4
  }
/*  else if(meta_primitive_state.primitive == A_ADD_HEADER) {
    do_add_header_11(); // add_header.p4
  }*/
  else if(meta_primitive_state.primitive == A_DROP) {
    do_drop_23();
  }
  else if(meta_primitive_state.primitive == A_NO_OP) {
  }
  else if(meta_primitive_state.primitive == A_TRUNCATE) {
    do_truncate_23();
  }
  // ... (other primitive types)
}
