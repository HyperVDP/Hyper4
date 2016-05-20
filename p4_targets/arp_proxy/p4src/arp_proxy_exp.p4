/* ARP proxy - experimental
   This won't work directly because the bcast_packet action is unspecified;
   the action translates to HP4 functionality however
*/

header_type ethernet_t {
  fields {
    dest : 48;
    src : 48;
    etherType : 16;
  } // 14 B / 112 b
}

header_type arp_t {
  fields {
    hw_type : 16;
    prot_type : 16;
    hw_size : 8;
    prot_size : 8;
    opcode : 16;
    sender_MAC : 48;
    sender_IP : 32;
    target_MAC : 48;
    target_IP : 32;
  } // 28 B / 224 b
}

// ethernet + arp = 42 B / 336 b

header_type meta_t {
  fields {
    temp : 32;
  }
}

// 1
header ethernet_t ethernet;
// 2
header arp_t arp;

parser start {
  extract(ethernet);
  return select(ethernet.etherType) {
    0x0806 : parse_arp;
    default : ingress;
  }
}

parser parse_arp {
  extract(arp);
  return ingress;
}

// action_ID: 1
action arp_present() {
}

table check_arp {
  reads {
    arp : valid;
  }
  actions {
    arp_present;
    bcast_packet;
  }
}

// action_ID: 2
action arp_request() {
}

table check_opcode {
  reads {
    arp.opcode : exact;
  }
  actions {
    arp_request;
    bcast_packet;
  }
}

// action_ID: 3
action arp_reply(MAC) {
  // send back out same port on which request was received
  // 1
  modify_field(standard_metadata.egress_spec, standard_metadata.ingress_port);
  // build arp reply
  // 2
  modify_field(arp.opcode, 2);
  // 3
  modify_field(arp.target_MAC, arp.sender_MAC);
  // 4
  modify_field(arp.sender_MAC, MAC);
  // 5
  modify_field(meta.temp, arp.sender_IP);
  // 6
  modify_field(arp.sender_IP, arp.target_IP);
  // 7
  modify_field(arp.target_IP, meta.temp);
  
  // ethernet
  // 8
  modify_field(ethernet.dest, ethernet.src);
  // 9
  modify_field(ethernet.src, MAC);
}

table handle_arp_request {
  reads {
    arp.target_IP : exact;
  }
  actions {
    arp_reply;
    bcast_packet;
  }
}

// action_ID: 4
action bcast_packet() {
  //modify_field(standard_metadata.egress_spec, meta.egress);
  // broadcast packet
}

control ingress {
  apply(check_arp) {
    arp_present {
      apply(check_opcode) {
        arp_request {
          apply(handle_arp_request);
        }
      }
    }
  }
}
