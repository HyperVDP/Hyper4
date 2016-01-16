#include "defines.p4"

metadata meta_parse_t meta_parse;

header bitfield_256_t bitfield_256;
header bitfield_512_t bitfield_512;
header bitfield_768_t bitfield_768;

parser start {
  return select(meta_parse.parse_width) {
    256 : parse_256;
    512 : parse_512;
    768 : parse_768;
    default : ingress;
  }
}

parser parse_256 {
  extract(bitfield_256);
  set_metadata(meta_ctrl.stage, NORM);
  return ingress;
}

parser parse_512 {
  extract(bitfield_512);
  set_metadata(meta_ctrl.stage, NORM);
  return ingress;
}

parser parse_768 {
  extract(bitfield_768);
  set_metadata(meta_ctrl.stage, NORM);
  return ingress;
}
