/*
David Hancock
University of Utah
dhancock@cs.utah.edu

HyPer4 - A P4 hypervisor extending live reconfigurability and other features
         to all P4 targets with sufficient resources
*/

header_type local_metadata_t {
  fields {
    parse_width  : 16;
    data         : 768;
    next_table   : 8;
    num_pas      : 8;
    next_action   : 8;
    curr_param_offset : 8;
    action_index : 8;
    pa_tm_index : 8;
    pa_iterations : 4;
    pa_val : 32;
    pa_bitmaskID : 4;
    pa_scratch : 32;
    stage : 16;
  }
}

header_type bitfield_256_t {
  fields {
    data : 256;
  }
}

header_type bitfield_512_t {
  fields {
    data : 512;
  }
}

header_type bitfield_768_t {
  fields {
    data : 768;
  }
}
