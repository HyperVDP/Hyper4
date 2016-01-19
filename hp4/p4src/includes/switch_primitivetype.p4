/*
David Hancock
FLUX Research Group
University of Utah
dhancock@cs.utah.edu

HyPer4: A P4 Program to Run Other P4 Programs

switch_primitivetype.p4: Redirect execution to the control function appropriate
                         for the next primitive in the target P4 program
*/

#include "modify_field.p4"
//#include "add_header.p4"
#include "drop.p4"
//#include "truncate.p4"
#include "multicast.p4"

control switch_primitivetype_11 {
  if(meta_primitive_state.primitive == A_MODIFY_FIELD) { //condition_10
      do_modify_field_11(); // modify_field.p4
  }
/*  else if(meta_primitive_state.primitive == A_ADD_HEADER) {
    do_add_header_11(); // add_header.p4
  }*/
  else if(meta_primitive_state.primitive == A_DROP) { //condition_11
    do_drop_11();
  }
  else if(meta_primitive_state.primitive == A_NO_OP) { //condition_12
  } 
/*  else if(meta_primitive_state.primitive == A_TRUNCATE) {
    do_truncate_11();
  }*/
  else if(meta_primitive_state.primitive == A_MULTICAST) { //condition_13
    do_multicast_11();
  }
  // ... (other primitive types)
}

control switch_primitivetype_12 {
  if(meta_primitive_state.primitive == A_MODIFY_FIELD) {
      do_modify_field_12(); // modify_field.p4
  }
/*  else if(meta_primitive_state.primitive == A_ADD_HEADER) {
    do_add_header_12(); // add_header.p4
  }*/
  else if(meta_primitive_state.primitive == A_DROP) {
    do_drop_12();
  }
  else if(meta_primitive_state.primitive == A_NO_OP) {
  }
/*  else if(meta_primitive_state.primitive == A_TRUNCATE) {
    do_truncate_12();
  }*/
  else if(meta_primitive_state.primitive == A_MULTICAST) {
    do_multicast_12();
  }
  // ... (other primitive types)
}

control switch_primitivetype_13 {
  if(meta_primitive_state.primitive == A_MODIFY_FIELD) {
      do_modify_field_13(); // modify_field.p4
  }
/*  else if(meta_primitive_state.primitive == A_ADD_HEADER) {
    do_add_header_13(); // add_header.p4
  }*/
  else if(meta_primitive_state.primitive == A_DROP) {
    do_drop_13();
  }
  else if(meta_primitive_state.primitive == A_NO_OP) {
  }
/*  else if(meta_primitive_state.primitive == A_TRUNCATE) {
    do_truncate_13();
  }*/
  else if(meta_primitive_state.primitive == A_MULTICAST) {
    do_multicast_13();
  }
  // ... (other primitive types)
}

control switch_primitivetype_21 {
  if(meta_primitive_state.primitive == A_MODIFY_FIELD) {
      do_modify_field_21(); // modify_field.p4
  }
/*  else if(meta_primitive_state.primitive == A_ADD_HEADER) {
    do_add_header_21(); // add_header.p4
  }*/
  else if(meta_primitive_state.primitive == A_DROP) {
    do_drop_21();
  }
  else if(meta_primitive_state.primitive == A_NO_OP) {
  }
/*  else if(meta_primitive_state.primitive == A_TRUNCATE) {
    do_truncate_21();
  }*/
  else if(meta_primitive_state.primitive == A_MULTICAST) {
    do_multicast_21();
  }
  // ... (other primitive types)
}

control switch_primitivetype_22 {
  if(meta_primitive_state.primitive == A_MODIFY_FIELD) {
      do_modify_field_22(); // modify_field.p4
  }
/*  else if(meta_primitive_state.primitive == A_ADD_HEADER) {
    do_add_header_22(); // add_header.p4
  }*/
  else if(meta_primitive_state.primitive == A_DROP) {
    do_drop_22();
  }
  else if(meta_primitive_state.primitive == A_NO_OP) {
  }
/*  else if(meta_primitive_state.primitive == A_TRUNCATE) {
    do_truncate_22();
  }*/
  else if(meta_primitive_state.primitive == A_MULTICAST) {
    do_multicast_22();
  }
  // ... (other primitive types)
}

control switch_primitivetype_23 {
  if(meta_primitive_state.primitive == A_MODIFY_FIELD) {
      do_modify_field_23(); // modify_field.p4
  }
/*  else if(meta_primitive_state.primitive == A_ADD_HEADER) {
    do_add_header_23(); // add_header.p4
  }*/
  else if(meta_primitive_state.primitive == A_DROP) {
    do_drop_23();
  }
  else if(meta_primitive_state.primitive == A_NO_OP) {
  }
/*  else if(meta_primitive_state.primitive == A_TRUNCATE) {
    do_truncate_23();
  }*/
  else if(meta_primitive_state.primitive == A_MULTICAST) {
    do_multicast_23();
  }
  // ... (other primitive types)
}

control switch_primitivetype_31 {
  if(meta_primitive_state.primitive == A_MODIFY_FIELD) {
      do_modify_field_31(); // modify_field.p4
  }
/*  else if(meta_primitive_state.primitive == A_ADD_HEADER) {
    do_add_header_31(); // add_header.p4
  }*/
  else if(meta_primitive_state.primitive == A_DROP) {
    do_drop_31();
  }
  else if(meta_primitive_state.primitive == A_NO_OP) {
  }
/*  else if(meta_primitive_state.primitive == A_TRUNCATE) {
    do_truncate_31();
  }*/
  else if(meta_primitive_state.primitive == A_MULTICAST) {
    do_multicast_31();
  }
  // ... (other primitive types)
}

control switch_primitivetype_32 {
  if(meta_primitive_state.primitive == A_MODIFY_FIELD) {
      do_modify_field_32(); // modify_field.p4
  }
/*  else if(meta_primitive_state.primitive == A_ADD_HEADER) {
    do_add_header_32(); // add_header.p4
  }*/
  else if(meta_primitive_state.primitive == A_DROP) {
    do_drop_32();
  }
  else if(meta_primitive_state.primitive == A_NO_OP) {
  }
/*  else if(meta_primitive_state.primitive == A_TRUNCATE) {
    do_truncate_32();
  }*/
  else if(meta_primitive_state.primitive == A_MULTICAST) {
    do_multicast_32();
  }
  // ... (other primitive types)
}

control switch_primitivetype_33 {
  if(meta_primitive_state.primitive == A_MODIFY_FIELD) {
      do_modify_field_33(); // modify_field.p4
  }
/*  else if(meta_primitive_state.primitive == A_ADD_HEADER) {
    do_add_header_33(); // add_header.p4
  }*/
  else if(meta_primitive_state.primitive == A_DROP) {
    do_drop_33();
  }
  else if(meta_primitive_state.primitive == A_NO_OP) {
  }
/*  else if(meta_primitive_state.primitive == A_TRUNCATE) {
    do_truncate_33();
  }*/
  else if(meta_primitive_state.primitive == A_MULTICAST) {
    do_multicast_33();
  }
  // ... (other primitive types)
}
