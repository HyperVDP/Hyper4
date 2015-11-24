/*
David Hancock
University of Utah
dhancock@cs.utah.edu

HyPer4 - A P4 hypervisor extending live reconfigurability and other features
         to all P4 targets with sufficient resources
*/

// ------ Normalize data to 768-bit bitfield
action a_norm_256() {
  modify_field(local_metadata.data, bitfield_256.data);
}

action a_norm_512() {
  modify_field(local_metadata.data, bitfield_512.data);
}

action a_norm_768() {
  modify_field(local_metadata.data, bitfield_768.data);
}

table norm {
  reads {
    local_metadata.parse_width : exact;
  }
  actions {
    a_norm_256;
    a_norm_512;
    a_norm_768;
  }
}
