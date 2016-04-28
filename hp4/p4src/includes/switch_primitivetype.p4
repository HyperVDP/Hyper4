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
#include "add_header.p4"
#include "copy_header.p4"
#include "remove_header.p4"
#include "push.p4"
#include "pop.p4"
#include "drop.p4"
#include "multicast.p4"
#include "add_to_field.p4"
#include "truncate.p4"


control switch_primitivetype_11 {
  if(meta_primitive_state.primitive == A_MODIFY_FIELD) {
    do_modify_field_11();
}
  if(meta_primitive_state.primitive == A_ADD_HEADER) {
    do_add_header_11();
}
  else if(meta_primitive_state.primitive == A_TRUNCATE) {
    do_truncate_11();
}
  else if(meta_primitive_state.primitive == A_DROP) {
    do_drop_11();
}
  else if(meta_primitive_state.primitive == A_NO_OP) {
  }
  else if(meta_primitive_state.primitive == A_MULTICAST) {
    do_multicast_11();
}
  else if(meta_primitive_state.primitive == A_ADD_TO_FIELD) {
    do_add_to_field_11();
}
}

control switch_primitivetype_12 {
  if(meta_primitive_state.primitive == A_MODIFY_FIELD) {
    do_modify_field_12();
}
  if(meta_primitive_state.primitive == A_ADD_HEADER) {
    do_add_header_12();
}
  else if(meta_primitive_state.primitive == A_TRUNCATE) {
    do_truncate_12();
}
  else if(meta_primitive_state.primitive == A_DROP) {
    do_drop_12();
}
  else if(meta_primitive_state.primitive == A_NO_OP) {
  }
  else if(meta_primitive_state.primitive == A_MULTICAST) {
    do_multicast_12();
}
  else if(meta_primitive_state.primitive == A_ADD_TO_FIELD) {
    do_add_to_field_12();
}
}

control switch_primitivetype_13 {
  if(meta_primitive_state.primitive == A_MODIFY_FIELD) {
    do_modify_field_13();
}
  if(meta_primitive_state.primitive == A_ADD_HEADER) {
    do_add_header_13();
}
  else if(meta_primitive_state.primitive == A_TRUNCATE) {
    do_truncate_13();
}
  else if(meta_primitive_state.primitive == A_DROP) {
    do_drop_13();
}
  else if(meta_primitive_state.primitive == A_NO_OP) {
  }
  else if(meta_primitive_state.primitive == A_MULTICAST) {
    do_multicast_13();
}
  else if(meta_primitive_state.primitive == A_ADD_TO_FIELD) {
    do_add_to_field_13();
}
}

control switch_primitivetype_21 {
  if(meta_primitive_state.primitive == A_MODIFY_FIELD) {
    do_modify_field_21();
}
  if(meta_primitive_state.primitive == A_ADD_HEADER) {
    do_add_header_21();
}
  else if(meta_primitive_state.primitive == A_TRUNCATE) {
    do_truncate_21();
}
  else if(meta_primitive_state.primitive == A_DROP) {
    do_drop_21();
}
  else if(meta_primitive_state.primitive == A_NO_OP) {
  }
  else if(meta_primitive_state.primitive == A_MULTICAST) {
    do_multicast_21();
}
  else if(meta_primitive_state.primitive == A_ADD_TO_FIELD) {
    do_add_to_field_21();
}
}

control switch_primitivetype_22 {
  if(meta_primitive_state.primitive == A_MODIFY_FIELD) {
    do_modify_field_22();
}
  if(meta_primitive_state.primitive == A_ADD_HEADER) {
    do_add_header_22();
}
  else if(meta_primitive_state.primitive == A_TRUNCATE) {
    do_truncate_22();
}
  else if(meta_primitive_state.primitive == A_DROP) {
    do_drop_22();
}
  else if(meta_primitive_state.primitive == A_NO_OP) {
  }
  else if(meta_primitive_state.primitive == A_MULTICAST) {
    do_multicast_22();
}
  else if(meta_primitive_state.primitive == A_ADD_TO_FIELD) {
    do_add_to_field_22();
}
}

control switch_primitivetype_23 {
  if(meta_primitive_state.primitive == A_MODIFY_FIELD) {
    do_modify_field_23();
}
  if(meta_primitive_state.primitive == A_ADD_HEADER) {
    do_add_header_23();
}
  else if(meta_primitive_state.primitive == A_TRUNCATE) {
    do_truncate_23();
}
  else if(meta_primitive_state.primitive == A_DROP) {
    do_drop_23();
}
  else if(meta_primitive_state.primitive == A_NO_OP) {
  }
  else if(meta_primitive_state.primitive == A_MULTICAST) {
    do_multicast_23();
}
  else if(meta_primitive_state.primitive == A_ADD_TO_FIELD) {
    do_add_to_field_23();
}
}

control switch_primitivetype_31 {
  if(meta_primitive_state.primitive == A_MODIFY_FIELD) {
    do_modify_field_31();
}
  if(meta_primitive_state.primitive == A_ADD_HEADER) {
    do_add_header_31();
}
  else if(meta_primitive_state.primitive == A_TRUNCATE) {
    do_truncate_31();
}
  else if(meta_primitive_state.primitive == A_DROP) {
    do_drop_31();
}
  else if(meta_primitive_state.primitive == A_NO_OP) {
  }
  else if(meta_primitive_state.primitive == A_MULTICAST) {
    do_multicast_31();
}
  else if(meta_primitive_state.primitive == A_ADD_TO_FIELD) {
    do_add_to_field_31();
}
}

control switch_primitivetype_32 {
  if(meta_primitive_state.primitive == A_MODIFY_FIELD) {
    do_modify_field_32();
}
  if(meta_primitive_state.primitive == A_ADD_HEADER) {
    do_add_header_32();
}
  else if(meta_primitive_state.primitive == A_TRUNCATE) {
    do_truncate_32();
}
  else if(meta_primitive_state.primitive == A_DROP) {
    do_drop_32();
}
  else if(meta_primitive_state.primitive == A_NO_OP) {
  }
  else if(meta_primitive_state.primitive == A_MULTICAST) {
    do_multicast_32();
}
  else if(meta_primitive_state.primitive == A_ADD_TO_FIELD) {
    do_add_to_field_32();
}
}

control switch_primitivetype_33 {
  if(meta_primitive_state.primitive == A_MODIFY_FIELD) {
    do_modify_field_33();
}
  if(meta_primitive_state.primitive == A_ADD_HEADER) {
    do_add_header_33();
}
  else if(meta_primitive_state.primitive == A_TRUNCATE) {
    do_truncate_33();
}
  else if(meta_primitive_state.primitive == A_DROP) {
    do_drop_33();
}
  else if(meta_primitive_state.primitive == A_NO_OP) {
  }
  else if(meta_primitive_state.primitive == A_MULTICAST) {
    do_multicast_33();
}
  else if(meta_primitive_state.primitive == A_ADD_TO_FIELD) {
    do_add_to_field_33();
}
}