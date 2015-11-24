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

action a_t01_A(){
  //no_op();
}

action a_t01_B(){
  //no_op();
}

action a_t01_Z(){
  //no_op();
}

table set_table_01 {
  reads {
    local_metadata.next_table : exact;
  }
  actions { // set one of these as the default action
    a_t01_A;
    a_t01_B;
    // ...
    a_t01_Z;
  }
}

action prep_compound(num_pas,
                    pa_code0, // +[]
                    pa_code1,
                    pa_code2,
                    pa_params, // +[]
                    pa_param_offsets, // +[]
                    next_table) {
  modify_field(local_metadata.num_pas, num_pas);
  modify_field(local_metadata.action_index, 0);
  register_write(r_next_action, 0, pa_code0);
  register_write(r_next_action, 1, pa_code1);
  register_write(r_next_action, 2, pa_code2);
  // ...
  modify_field(local_metadata.next_table, next_table);
}

action a_no_op() {
  //no_op();
}

table t_t01_A {
  reads { local_metadata.data : ternary; }
  actions {
    prep_compound;
    a_drop;
    a_no_op;
  }
}

/* TODO - figure out what type of matching required
table t_t01_B {
  actions {
    prep_compound;
  }
}

table t_t01_Z {
  actions {
    prep_compound;
  }
}
*/

action a_prep_next_action() {
  register_read(local_metadata.next_action, r_next_action, local_metadata.action_index);
}

table t_prep_next_action {
  actions {
    a_prep_next_action;
  }
}

action a_add_header_code() {
  //no_op();
}

action a_copy_header_code() {
  //no_op();
}

action a_remove_header_code() {
  //no_op();
}

action a_modify_field_code() {
  //no_op();
}

action a_drop_code() {
  //no_op();
}

action a_no_op_code() {
  //no_op();
}

table t_set_next_action {
  reads {
    local_metadata.next_action : exact;
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
//       local_metadata
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

action a_modify_field() {
  //no_op(); // TODO
}

table t_modify_field {
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
  add_to_field(local_metadata.action_index, 1);
}

table t_inc_action_index {
  actions {
    a_inc_action_index;
  }
}
// ------

// resubmit()
field_list f_resubmit {
  local_metadata.parse_width;
  local_metadata.data;
  local_metadata.next_table;
  local_metadata.num_pas;
  local_metadata.action_index;
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
  if (local_metadata.action_index < local_metadata.num_pas) {
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
        apply(t_modify_field);
      }
      a_drop_code {
        apply(t_drop);
      }
      a_no_op_code {
        apply(t_no_op);
      }
    }
    apply(t_inc_action_index);
    apply(t_loop);
  }
}

control main {
  apply(check_init) {
    init {
      apply(t_switch_init); 
      apply(t_packet_init);
    }   
  }

  // normalize data
  apply(norm);

  apply(set_table_01) {
    a_t01_A {
      apply(t_t01_A) {
        prep_compound {
          compound_action();
        }
      }
    }
 // a_t01_B { apply(t_t01_B); }
 // a_t01_Z { apply(t_t01_Z); }
   }
}
