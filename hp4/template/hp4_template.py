#!/usr/bin/python

import argparse
import stages_t
import parser_t
import action_t
import add_to_field_t
import drop_t
import match_t
import modify_field_t
import add_header_t
import copy_header_t
import remove_header_t
import push_t
import pop_t
import multicast_t
import setup_t
import switch_primitivetype_t
import switch_stdmeta_t
import truncate_t
import checksums_t
import resize_pr_t
import defines_t
import headers_t

DEFAULT = 0
MAX = 1
STEP = 2

parser = argparse.ArgumentParser(description='HP4 Source Code Generator')
parser.add_argument('--numstages', help='Max number of match-action stages',
                    type=int, action="store", default=3)
parser.add_argument('--numprimitives', help='Max number of primitives per compound action',
                    type=int, action="store", default=3)
parser.add_argument('--parse_opt', help='Set default, max, and step for parsing',
                    type=int, nargs='*', action="store", default=[20, 100, 20])
parser.add_argument('--test', help='Flags whether to append the supplied suffix',
                    action="store")

args = parser.parse_args()

class GenHp4():
  def __init__(self, nstages, nprimitives, parse_opts, test):
    fpath = '../p4src/'
    if test:
      fpath += 'test/config_' + str(nstages) + str(nprimitives) + '/'
    fpath += 'hp4.p4'
    f_hp4 = open(fpath, 'w')

    std_h = open('std_header', 'r')
    f_hp4.write("/*\n")
    f_hp4.write(std_h.read())
    f_hp4.write("\n")
    std_h.close()

    hp4_d = open('docs/hp4_d', 'r')
    f_hp4.write(hp4_d.read())
    f_hp4.write("*/\n\n")
    hp4_d.close()

    prefix = "#include \"includes/"

    out = prefix + "defines.p4\"\n"
    out += prefix + "headers.p4\"\n"
    out += prefix + "parser.p4\"\n"
    out += prefix + "setup.p4\"\n"
    out += prefix + "stages.p4\"\n"
    out += prefix + "checksums.p4\"\n"
    out += prefix + "resize_pr.p4\"\n"
    out += "//" + prefix + "debug.p4\"\n"
    out += "\n"

    f_hp4.write(out)

    out = "metadata meta_ctrl_t meta_ctrl;\n"
    out += "metadata meta_primitive_state_t meta_primitive_state;\n"
    out += "metadata extracted_t extracted;\n"
    out += "metadata tmeta_t tmeta;\n"
    out += "metadata csum_t csum;\n\n"
    out += "metadata intrinsic_metadata_t intrinsic_metadata;\n\n"

    f_hp4.write(out)

    indent = "  "

    out = "control ingress {\n"
    out += indent + "setup();\n\n"
    out += indent + "if (meta_ctrl.stage == NORM) {\n"

    for i in range(nstages):
      out += indent + indent + "if (meta_ctrl.next_table != DONE and meta_ctrl.next_stage == "
      out += str(i+1) + ") {\n" 
      out += indent + indent + indent + "stage" + str(i+1) + "();\n"
      out += indent + indent + "}\n"

    out += indent + "}\n"
    out += "}\n\n"

    f_hp4.write(out)

    out = "field_list clone_fl {\n"
    out += indent + "standard_metadata;\n"
    out += indent + "meta_ctrl;\n"
    out += indent + "extracted;\n"
    out += "}\n\n"

    out += "action mod_and_clone(port) {\n"
    out += indent + "modify_field(meta_ctrl.multicast_current_egress, port);\n"
    out += indent + "clone_egress_pkt_to_egress(port, clone_fl);\n"
    out += "}\n\n"

    f_hp4.write(out)

    out = "table t_multicast {\n"
    out += indent + "reads {\n"
    out += indent + indent + "meta_ctrl.program : exact;\n"
    out += indent + indent + "meta_ctrl.multicast_seq_id : exact;\n"
    out += indent + indent + "meta_ctrl.multicast_current_egress : exact;\n"
    out += indent + "}\n"
    out += indent + "actions {\n"
    out += indent + indent + "mod_and_clone;\n"
    out += indent + indent + "_no_op;\n"
    out += indent + "}\n"
    out += "}\n\n"

    f_hp4.write(out)

    out = ""
    t_prep4deparse_actions = ""

    out += "action a_prep_deparse_SEB() {\n"
    rshift = parse_opts[MAX] * 8;
    for i in range(0, parse_opts[DEFAULT]):
      rshift -= 8;
      out += indent + "modify_field(ext[" + str(i) + "].data, (extracted.data >> " + \
             str(rshift) + ") & 0xFF);\n"
    out += "}\n\n"
    f_hp4.write(out)
    out = "table t_prep_deparse_SEB {\n"
    out += indent + "actions {\n"
    out += indent + indent + "a_prep_deparse_SEB;\n"
    out += indent + "}\n"
    out += "}\n\n"
    f_hp4.write(out)

    for i in range(parse_opts[0], parse_opts[1], parse_opts[2]):
      suffix = "_prep_deparse_"+ str(i) + "_" + str(i + parse_opts[2] - 1)
      out = "action a" + suffix + "() {\n"
      for j in range(i, i+parse_opts[2]):
        rshift -=8;
        out += indent + "modify_field(ext[" + str(j) + "].data, (extracted.data >> " + \
               str(rshift) + ") & 0xFF);\n"
      out += "}\n\n"
      out += "table t" + suffix + "{\n"
      out += indent + "actions {\n"
      out += indent + indent + "a" + suffix + ";\n"
      out += indent + "}\n"
      out += "}\n\n"
      f_hp4.write(out)

    out = "control egress {\n"
    out += indent + "if(meta_ctrl.do_multicast == 1) {\n"
    out += indent + indent + "apply(t_multicast);\n"
    out += indent + "}\n"
    out += indent + "apply(csum16);\n"
    out += indent + "apply(t_resize_pr);\n"
    out += indent + "apply(t_prep_deparse_SEB);\n"
    for i in range(parse_opts[0], parse_opts[1], parse_opts[2]):
      tname = "t_prep_deparse_" + str(i) + "_" + str(i + parse_opts[2] - 1)
      out += indent + "if(parse_ctrl.numbytes > " + str(i) + ") {\n"
      indent = indent + "  "
      out += indent + "apply(" + tname + ");\n"
    for i in range(parse_opts[0], parse_opts[1], parse_opts[2]):
      indent = indent[0:len(indent) - 2]
      out += indent + "}\n"

    out += "}\n"

    f_hp4.write(out)

    f_hp4.close()

def main():
  GenHp4(args.numstages, args.numprimitives, args.parse_opt, args.test)
  stages_t.GenStages(args.numstages, args.numprimitives, args.test)
  parser_t.GenParser(args.numstages, args.numprimitives, args.parse_opt, args.test)
  action_t.GenAction(args.numstages, args.numprimitives, args.test)
  add_to_field_t.GenAdd_to_Field(args.numstages, args.numprimitives, args.test)
  drop_t.GenDrop(args.numstages, args.numprimitives, args.test)
  match_t.GenMatch(args.numstages, args.numprimitives, args.test)
  modify_field_t.GenModify_Field(args.numstages, args.numprimitives, args.test)
  add_header_t.GenAdd_Header(args.numstages, args.numprimitives, args.parse_opt, args.test)
  copy_header_t.GenCopy_Header(args.numstages, args.numprimitives, args.test)
  remove_header_t.GenRemove_Header(args.numstages, args.numprimitives, args.test)
  push_t.GenPush(args.numstages, args.numprimitives, args.test)
  pop_t.GenPop(args.numstages, args.numprimitives, args.test)
  multicast_t.GenMulticast(args.numstages, args.numprimitives, args.test)
  setup_t.GenSetup(args.numstages, args.numprimitives, args.parse_opt, args.test)
  switch_primitivetype_t.GenSwitch_PrimitiveType(args.numstages, args.numprimitives, args.test)
  switch_stdmeta_t.GenSwitch_StdMeta(args.numstages, args.numprimitives, args.test)
  truncate_t.GenTruncate(args.numstages, args.numprimitives, args.test)
  checksums_t.GenChecksums(args.numstages, args.numprimitives, args.test)
  resize_pr_t.GenResize_PR(args.numstages, args.numprimitives, args.parse_opt, args.test)
  defines_t.GenDefines(args.numstages, args.numprimitives, args.parse_opt, args.test)
  headers_t.GenHeaders(args.numstages, args.numprimitives, args.parse_opt, args.test)

if __name__ == '__main__':
    main()
