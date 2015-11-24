/*
David Hancock
University of Utah
dhancock@cs.utah.edu

HyPer4 - A P4 hypervisor extending live reconfigurability and other features
         to all P4 targets with sufficient resources
*/

// ------ Initialize the switch
action a_switch_init(pw) {
  register_write(parse_width, 0, pw);
}

action _no_op() {
  //no_op();
}

table t_switch_init {
  actions {
    a_switch_init; // <- set as default when need to initialize switch
    _no_op;  // <- normal ops
  }
}
// ------

// ------ Set local_metadata as necessary for packet processing
field_list f_packet_init {
  local_metadata.parse_width;
  local_metadata.next_table;
}

action a_packet_init(nt) {
  register_read(local_metadata.parse_width, parse_width, 0);
  modify_field(local_metadata.next_table, nt); // <-- why not register_read?

  // send packet back to parser
  resubmit(f_packet_init); // <-- p4c-bmv2 won't compile resubmit w/
                             //     field_list param yet; Antonin says it is
                             //     coming soon.  In the meantime, we may have
                             //     to use bmv1.
  //resubmit(); // <-- this is only a placeholder - we really need to pass the field_list as a 
              // parameter so we can use local_metadata.parse_width/next_table
}

table t_packet_init {
  actions {
    a_packet_init;
    // params:
    // - nt: next table
  }
}

action init() {
  //no_op();
}

table check_init {
  reads {
    local_metadata.parse_width : exact;
  }
  actions {
    init;
    _no_op;
  }
}
