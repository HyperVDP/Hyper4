/*
David Hancock
University of Utah
dhancock@cs.utah.edu

HyPer4 - A P4 hypervisor extending live reconfigurability and other features
         to all P4 targets with sufficient resources
*/

#include "includes/headers.p4"
#include "includes/parser.p4"
#include "includes/init.p4"
#include "includes/normalize.p4"
#include "includes/defines.p4"

action a_tXX_A(){}
action a_tXX_B(){}
action a_tXX_Z(){}

table set_table {
  reads {
    local_meta.next_table : exact;
  }
  actions {
    a_tXX_A;
    a_tXX_B;
    a_tXX_Z;
  }
}

action prep_compound(num_pas,
                    pa_code0,
                    pa_code1,
                    pa_code2,
                    pa_param0_1,
                    pa_param0_2,
                    pa_param0_3,
                    pa_param0_4,
                    pa_param1_1,
                    pa_param1_2,
                    pa_param1_3,
                    pa_param1_4,
                    pa_param2_1,
                    pa_param2_2,
                    pa_param2_3,
                    pa_param2_4,
                    next_table) {
  modify_field(local_meta.num_pas, num_pas);
  modify_field(local_meta.action_index, 0);
  register_write(r_next_action, 0, pa_code0);
  register_write(r_next_action, 1, pa_code1);
  register_write(r_next_action, 2, pa_code2);
  register_write(r_pa_params_1, 0, pa_param0_1);
  register_write(r_pa_params_2, 0, pa_param0_2);
  register_write(r_pa_params_3, 0, pa_param0_3);
  register_write(r_pa_params_4, 0, pa_param0_4);
  register_write(r_pa_params_1, 1, pa_param1_1);
  register_write(r_pa_params_2, 1, pa_param1_2);
  register_write(r_pa_params_3, 1, pa_param1_3);
  register_write(r_pa_params_4, 1, pa_param1_4);
  register_write(r_pa_params_1, 2, pa_param2_1);
  register_write(r_pa_params_2, 2, pa_param2_2);
  register_write(r_pa_params_3, 2, pa_param2_3);
  register_write(r_pa_params_4, 2, pa_param2_4);
  // ...
  modify_field(local_meta.next_table, next_table);
}

action a_no_op() {}

table t_tXX_A {
  reads {
    local_meta.stage : exact;
    local_meta.data : ternary;
  }
  actions {
    prep_compound;
    a_drop;
    a_no_op;
  }
}

/* TODO - figure out what type of matching required
table t_tXX_B {
  actions {
    prep_compound;
  }
}

table t_tXX_Z {
  actions {
    prep_compound;
  }
}
*/

action a_prep_next_action() {
  register_read(local_meta.next_action, r_next_action, local_meta.action_index);
}

table t_prep_next_action {
  actions {
    a_prep_next_action;
  }
}

action a_add_header_code() {}
action a_copy_header_code() {}
action a_remove_header_code() {}
action a_modify_field_code() {}
action a_drop_code() {}
action a_no_op_code() {}

table t_set_next_action {
  reads {
    local_meta.next_action : exact;
  }
  actions {
    a_add_header_code;
    a_copy_header_code;
    a_remove_header_code;
    a_modify_field_code;
    // ...
    a_drop_code;
    a_no_op_code;
    // ...
  }
}

// ------ Primitive Actions
// TODO: remove compound action params; primitive params should come from
//       local_meta
action a_add_header() {
//  add_header(head_inst);
}

table t_add_header {
  actions {
    a_add_header;
  }
}

action a_copy_header() {
//  copy_header(dst, src);
}

table t_copy_header {
  actions {
    a_copy_header;
  }
}

action a_remove_header() {
//  remove_header(head_inst);
}

table t_remove_header {
  actions {
    a_remove_header;
  }
}

action a_prep_modify_field() {
  register_read(local_meta.pa_tm_index, r_pa_params_1, local_meta.action_index);
  register_read(local_meta.pa_iterations, r_pa_params_2, local_meta.action_index);
  register_read(local_meta.pa_val, r_pa_params_3, local_meta.action_index);
  register_read(local_meta.pa_bitmaskID, r_pa_params_4, local_meta.action_index);
}

table t_prep_modify_field {
  actions {
    a_prep_modify_field;
  }
}

action a_modify_field() {
  register_read(local_meta.pa_scratch, target_meta, local_meta.pa_tm_index);
  
}

// not entirely certain this is necessary...
action a_modify_field_b11111110 {
}
action a_modify_field_b11111100 {
}

table t_modify_field {
  reads {
    local_meta.num_fields : exact;
    local_meta.bitmaskID : exact;
  }
  actions {
    a_modify_field;
  }
}

action a_drop() {
  drop();
}

table t_drop {
  actions {
    a_drop;
  }
}

table t_no_op {
  actions {
    a_no_op;
  }
}
// ------

// action_index++
action a_inc_action_index() {
  add_to_field(local_meta.action_index, 1);
}

table t_inc_action_index {
  actions {
    a_inc_action_index;
  }
}
// ------

// resubmit()
field_list f_resubmit {
  local_meta.parse_width;
  local_meta.data;
  local_meta.next_table;
  local_meta.num_pas;
  local_meta.action_index;
  local_meta.stage;
}

action a_resubmit() {
  resubmit(f_resubmit);
}

table t_loop {
  actions {
    a_resubmit;
  }
}
// ------

/* There is an extra level of indirection here that does not seem strictly
   necessary - instead of applying t_set_next_action and then applying a
   another table in order to execute the action, it seems we could simply
   apply a table called t_do_next_action.  I leave the indirection in for
   now, though, because in many cases there are several different types
   of each primitive that could be executed, depending on the types of
   parameters involved.

   Note also that we would like to explicitly loop, but this is not an option,
   nor is recursion, so we are forced to loop via the resubmit action.
*/
control compound_action {
  if (local_meta.action_index < local_meta.num_pas) {
    apply(t_prep_next_action);
    apply(t_set_next_action) {
      a_add_header_code {
        apply(t_add_header);
      }
      a_copy_header_code {
        apply(t_copy_header);
      }
      a_remove_header_code {
        apply(t_remove_header);
      }
      a_modify_field_code {
        apply(t_prep_modify_field);
        apply(t_modify_field);
      }
      a_drop_code {
        apply(t_drop);
      }
      a_no_op_code {
        apply(t_no_op);
      }
    }
    apply(t_inc_action_index); // action_index++
    apply(t_loop);
  }
}

control main {
  if ( local_meta.stage == INIT ) {
    apply(t_switch_init);
    apply(t_packet_init);
  }
  else if ( local_meta.stage == NORM ) {
    apply(t_norm);
  }
  else if ( local_meta.stage != COMP ) {
    apply(set_table) {
      a_tXX_A {
        apply(t_tXX_A);
      }
    }
  }
  compound_action();
}
