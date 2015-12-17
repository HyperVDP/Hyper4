#include "modify_field.p4"
#include "add_header.p4"
// ...
#include "defines.p4"

control switch_primitivetype_11 {
  if(meta_primitive_metadata.type == A_MODIFY_FIELD) {
      do_modify_field_11;
  }
  else if(meta_primitive_metadata.type == A_ADD_HEADER) {
    do_add_header_11;
  }
  // ... (other primitive types)
}

control switch_primitivetype_12 {
  if(meta_primitive_metadata.type == A_MODIFY_FIELD) {
      do_modify_field_12;
  }
  else if(meta_primitive_metadata.type == A_ADD_HEADER) {
    do_add_header_12;
  }
  // ... (other primitive types)
}

control switch_primitivetype_13 {
  if(meta_primitive_metadata.type == A_MODIFY_FIELD) {
      do_modify_field_13;
  }
  else if(meta_primitive_metadata.type == A_ADD_HEADER) {
    do_add_header_13;
  }
  // ... (other primitive types)
}

control switch_primitivetype_21 {
  if(meta_primitive_metadata.type == A_MODIFY_FIELD) {
      do_modify_field_21;
  }
  else if(meta_primitive_metadata.type == A_ADD_HEADER) {
    do_add_header_21;
  }
  // ... (other primitive types)
}

control switch_primitivetype_22 {
  if(meta_primitive_metadata.type == A_MODIFY_FIELD) {
      do_modify_field_22;
  }
  else if(meta_primitive_metadata.type == A_ADD_HEADER) {
    do_add_header_22;
  }
  // ... (other primitive types)
}

control switch_primitivetype_23 {
  if(meta_primitive_metadata.type == A_MODIFY_FIELD) {
      do_modify_field_23;
  }
  else if(meta_primitive_metadata.type == A_ADD_HEADER) {
    do_add_header_23;
  }
  // ... (other primitive types)
}

control switch_primitivetype_31 {
  if(meta_primitive_metadata.type == A_MODIFY_FIELD) {
      do_modify_field_31;
  }
  else if(meta_primitive_metadata.type == A_ADD_HEADER) {
    do_add_header_31;
  }
  // ... (other primitive types)
}

control switch_primitivetype_32 {
  if(meta_primitive_metadata.type == A_MODIFY_FIELD) {
      do_modify_field_32;
  }
  else if(meta_primitive_metadata.type == A_ADD_HEADER) {
    do_add_header_32;
  }
  // ... (other primitive types)
}

control switch_primitivetype_33 {
  if(meta_primitive_metadata.type == A_MODIFY_FIELD) {
      do_modify_field_33;
  }
  else if(meta_primitive_metadata.type == A_ADD_HEADER) {
    do_add_header_33;
  }
  // ... (other primitive types)
}
