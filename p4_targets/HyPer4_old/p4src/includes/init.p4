/*
David Hancock
University of Utah
dhancock@cs.utah.edu

HyPer4 - A P4 hypervisor extending live reconfigurability and other features
         to all P4 targets with sufficient resources
*/
#include "defines.p4"

// ------ Initialize the switch
action a_switch_init(pw,
                     ft,
                     var1,
                     var2,
                     var3,
                     var4,
                     var5,
                     var6,
                     var7,
                     var8) {
  register_write(parse_width, 0, pw);
  register_write(first_table, 0, ft);

  // TODO: Figure out what all this is for - eliminate if necessary:
  register_write(target_meta, 0, var1);
  register_write(target_meta, 1, var2);
  register_write(target_meta, 2, var3);
  register_write(target_meta, 3, var4);
  register_write(target_meta, 4, var5);
  register_write(target_meta, 5, var6);
  register_write(target_meta, 6, var7);
  register_write(target_meta, 7, var8);
}

action _no_op() {}

table t_switch_init {
  actions {
    a_switch_init; // <- set as default when need to initialize switch
    _no_op;  // <- normal ops
  }
}
// ------

// ------ Set local_meta as necessary for packet processing
field_list f_packet_init {
  local_meta.parse_width;
  local_meta.next_table;
  local_meta.stage;
}

action a_packet_init() {
  register_read(local_meta.parse_width, parse_width, 0);
  register_read(local_meta.next_table, first_table, 0); // <-- why not register_read?
  modify_field(local_meta.stage, NORM);
  // send packet back to parser
  resubmit(f_packet_init); // <-- p4c-bmv2 won't compile resubmit w/
                             //     field_list param yet
}

table t_packet_init {
  actions {
    a_packet_init;
    // params:
    // - nt: next table
  }
}
