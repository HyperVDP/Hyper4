/*
David Hancock
FLUX Research Group
University of Utah
dhancock@cs.utah.edu

HyPer4: A P4 Program to Run Other P4 Programs

action.p4: Prepare the metadata fields that indicate the actual primitive to
           execute.  These fields are used by switch_primitivetype.p4 and the
           components that implement the primitives (e.g. modify_field.p4).
*/

action a_set_primitive_metadata(primitive, primitive_subtype) {
  modify_field(meta_primitive_state.primitive, primitive);
  modify_field(meta_primitive_state.subtype, primitive_subtype);
}

table set_primitive_metadata_11 {
  reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_set_primitive_metadata;
  }
}

table set_primitive_metadata_12 {
  reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_set_primitive_metadata;
  }
}

table set_primitive_metadata_13 {
  reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_set_primitive_metadata;
  }
}

table set_primitive_metadata_21 {
  reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_set_primitive_metadata;
  }
}

table set_primitive_metadata_22 {
  reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_set_primitive_metadata;
  }
}

table set_primitive_metadata_23 {
  reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_set_primitive_metadata;
  }
}

table set_primitive_metadata_31 {
  reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_set_primitive_metadata;
  }
}

table set_primitive_metadata_32 {
  reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_set_primitive_metadata;
  }
}

table set_primitive_metadata_33 {
  reads {
    meta_primitive_state.action_ID : exact;
    meta_primitive_state.primitive_index : exact;
  }
  actions {
    a_set_primitive_metadata;
  }
}
