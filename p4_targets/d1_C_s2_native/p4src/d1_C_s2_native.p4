/* ARP proxy */

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

header_type ipv4_t {
    fields {
        version : 4;
        ihl : 4;
        diffserv : 8;
        totalLen : 16;
        identification : 16;
        flags : 3;
        fragOffset : 13;
        ttl : 8;
        protocol : 8;
        hdrChecksum : 16;
        srcAddr : 32;
        dstAddr: 32;
    } // 20 B / 160 b
}

header_type tcp_t {
  fields {
    src_port : 16;
    dst_port : 16;
    seq_num : 32;
    ack_num : 32;
    data_offset : 4;
    rsvd : 3;
    flags : 9;
    window_sz : 16;
    checksum : 16;
    urgent_ptr : 16;
  } // 20 B / 160 b
}

header_type udp_t {
  fields {
    src_port : 16;
    dst_port : 16;
    len : 16;
    checksum : 16;
  } // 8 B / 64 b
}

// ethernet + arp = 42 B / 336 b

header_type meta_t {
  fields {
    egress : 8;
    temp : 32;
    do_process : 8;
    marked_for_drop : 8;
    modified_by_router : 8;
  }
}

header_type routing_metadata_t {
    fields {
        nhop_ipv4 : 32;
    }
}

// 1
header ethernet_t ethernet;
// 2
header arp_t arp;

header ipv4_t ipv4;
header tcp_t tcp;
header udp_t udp;

metadata meta_t meta;
metadata routing_metadata_t routing_metadata;

parser start {
  extract(ethernet);
  return select(ethernet.etherType) {
    0x0806 : parse_arp;
    0x0800 : parse_ipv4;
    default : ingress;
  }
}

parser parse_arp {
  extract(arp);
  return ingress;
}

parser parse_ipv4 {
  extract(ipv4);
  return select(ipv4.protocol) {
    0x06 : parse_tcp;
    0x11 : parse_udp;
    default : ingress;
  }
}

parser parse_tcp {
  extract(tcp);
  return ingress;
}

parser parse_udp {
  extract(udp);
  return ingress;
}

// action_ID: 1
action a_init_meta_egress(port) {
  modify_field(meta.egress, port);
}

table init_meta_egress {
  reads {
    standard_metadata.ingress_port : exact;
  }
  actions {
    a_init_meta_egress;
  }
}

// action_ID: 2
action arp_present() {
}

table check_arp {
  reads {
    arp : valid;
  }
  actions {
    arp_present;
    send_packet;
  }
}

// action_ID: 3
action arp_request() {
}

table check_opcode {
  reads {
    arp.opcode : exact;
  }
  actions {
    arp_request;
    send_packet;
  }
}

// action_ID: 4
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
    send_packet;
  }
}

// action_ID: 5
action send_packet() {
  modify_field(standard_metadata.egress_spec, meta.egress);
}

action _no_op() {
}

action tcp_present() {
}

action udp_present() {
}

table is_tcp_or_udp_valid {
  reads {
    tcp : valid;
    udp : valid;
  }
  actions {
    tcp_present;
    udp_present;
    _no_op;
  }
}

action _drop() {
  modify_field(meta.marked_for_drop, 1);
  drop();
}

table tcp_block {
  reads {
    tcp.src_port : ternary;
    tcp.dst_port : ternary;
  }
  actions {
    _drop;
    _no_op;
    // conditional_block;
  }
}

table udp_block {
  reads {
    udp.src_port : ternary;
    udp.dst_port : ternary;
  }
  actions {
    _drop;
    _no_op;
    // conditional_block;
  }
}

action set_nhop(nhop_ipv4, port) {
    modify_field(routing_metadata.nhop_ipv4, nhop_ipv4);
    modify_field(standard_metadata.egress_spec, port);
    add_to_field(ipv4.ttl, -1);
    modify_field(meta.modified_by_router, 1);
}

table ipv4_lpm {
    reads {
        ipv4.dstAddr : lpm;
    }
    actions {
        set_nhop;
        _drop;
    }
    size: 1024;
}

action set_dmac(dmac) {
    modify_field(ethernet.dest, dmac);
}

table forward {
    reads {
        routing_metadata.nhop_ipv4 : exact;
    }
    actions {
        set_dmac;
        _drop;
    }
    size: 512;
}

action rewrite_mac(smac) {
    modify_field(ethernet.src, smac);
}

table send_frame {
    reads {
        standard_metadata.egress_spec: exact;
    }
    actions {
        rewrite_mac;
        _drop;
    }
    size: 256;
}

control ingress {
  apply(init_meta_egress);
  apply(check_arp) {
    arp_present {
      apply(check_opcode) {
        arp_request {
          apply(handle_arp_request);
        }
      }
    }
  }
  if(standard_metadata.egress_spec != standard_metadata.ingress_port) { // not arp_request
    apply(is_tcp_or_udp_valid) {
      tcp_present {
        apply(tcp_block);
      }
      udp_present {
        apply(udp_block);
      }
    }
  }
  if(meta.marked_for_drop != 1) { // not already marked for drop
    apply(ipv4_lpm);
    apply(forward);
    apply(send_frame);
  }
}

action a_csum() {
  modify_field(meta.temp, ((ipv4.version << 12) + (ipv4.ihl << 8) + ipv4.diffserv));
  modify_field(meta.temp, meta.temp + ipv4.totalLen);
  modify_field(meta.temp, meta.temp + ipv4.identification);
  modify_field(meta.temp, meta.temp + (ipv4.flags << 13 + ipv4.fragOffset));
  modify_field(meta.temp, meta.temp + ((ipv4.ttl << 8) + ipv4.protocol));
  modify_field(meta.temp, meta.temp + (ipv4.srcAddr >> 16));
  modify_field(meta.temp, meta.temp + (ipv4.srcAddr & 0xFFFF));
  modify_field(meta.temp, meta.temp + (ipv4.dstAddr >> 16));
  modify_field(meta.temp, meta.temp + (ipv4.dstAddr & 0xFFFF));
  modify_field(meta.temp, meta.temp + ((meta.temp >> 16) & 0xFFFF)); // add carry
  modify_field(ipv4.hdrChecksum, ~meta.temp);
}

table csum {
  actions {
    a_csum;
  }
}

control egress {
  if(meta.modified_by_router == 1) {
    apply(csum);
  }
}
