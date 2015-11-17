//#include "headers.p4"
//#include "parser.p4"

header_type local_metadata_t {
  fields {
    parse_width  : 16;
    data         : 768;
    next_table   : 8;
    num_pas      : 8;
    next_action   : 8;
    curr_param_offset : 8;
    action_index : 8;
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

/* ------ Parse */
header bitfield_256_t bitfield_256;
header bitfield_512_t bitfield_512;
header bitfield_768_t bitfield_768;

register parse_width {
  width : 16;
  instance_count : 1;
}

register r_next_action {
  width : 8;
  instance_count : 20;
}

metadata local_metadata_t local_metadata;

parser start {
  return select(local_metadata.parse_width) {
    256 : parse_256;
    512 : parse_512;
    768 : parse_768;
    default : main;
  }
}

parser parse_256 {
  extract(bitfield_256);
  return main;
}

parser parse_512 {
  extract(bitfield_512);
  return main;
}

parser parse_768 {
  extract(bitfield_768);
  return main;
}
// ------

// ------ Initialize the switch
action a_switch_init(pw) {
  register_write(parse_width, 0, pw);
}

action _no_op() {
  no_op();
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
  modify_field(local_metadata.next_table, nt);

  // send packet back to parser
  //resubmit(f_packet_init); // <-- this reference to f_packet_init causing compile error
  // FAIL - doesn't work even if I break it into separate table
  resubmit(); // <-- this is only a placeholder - we really need to pass the field_list as a 
              // parameter so we can use local_metadata.parse_width/next_table
}

table t_packet_init {
  actions {
    a_packet_init;
    // params:
    // - nt: next table
  }
}

// ------

action a_t01_A(){
  no_op();
}

action a_t01_B(){
  no_op();
}

action a_t01_Z(){
  no_op();
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

action prep_complex(num_pas,
                    pa_code0, // +[]
                    pa_code1,
                    pa_code2,
                    pa_params, // +[]
                    pa_param_offsets, // +[]
                    next_table) {
  modify_field(local_metadata.num_pas, num_pas);
  register_write(r_next_action, 0, pa_code0);
  register_write(r_next_action, 1, pa_code1);
  register_write(r_next_action, 2, pa_code2);
  // ...
  modify_field(local_metadata.next_table, next_table);
}

table t_t01_A {
  reads { local_metadata.data : ternary; }
  actions { prep_complex; }
}

/* TODO - figure out what type of matching required
table t_t01_B {
  actions {
    prep_complex;
  }
}

table t_t01_Z {
  actions {
    prep_complex;
  }
}
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
// ------

action init() {
  no_op();
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

action a_prep_next_action() {
  register_read(local_metadata.next_action, r_next_action, local_metadata.action_index);
}

table t_prep_next_action {
  actions {
    a_prep_next_action;
  }
}

action a_pa_1_code() {
  no_op();
}

action a_pa_2_code() {
  no_op();
}

action a_pa_3_code() {
  no_op();
}

table t_set_next_action {
  reads {
    local_metadata.next_action : exact;
  }
  actions {
    a_pa_1_code;
    a_pa_2_code;
    a_pa_3_code;
  }
}

// ------ Primitive Actions
// TODO: remove compound action params; primitive params should come from
//       local_metadata
action a_add_header() {
//  add_header(head_inst);
}

table pa_1 {
  actions {
    a_add_header;
  }
}

action a_copy_header() {
//  copy_header(dst, src);
}

table pa_2 {
  actions {
    a_copy_header;
  }
}

action a_remove_header() {
//  remove_header(head_inst);
}

table pa_3 {
  actions {
    a_remove_header;
  }
}
// ------

control complex_action {
  if (local_metadata.action_index < local_metadata.num_pas) {
    apply(t_prep_next_action);
    apply(t_set_next_action) {
      a_pa_1_code {
        apply(pa_1);
      }
      a_pa_2_code {
        apply(pa_2);
      }
      a_pa_3_code {
        apply(pa_3);
      }
    }
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
        prep_complex {
          complex_action();
        }
      }
    }
 // a_t01_B { apply(t_t01_B); }
 // a_t01_Z { apply(t_t01_Z); }
   }
}
