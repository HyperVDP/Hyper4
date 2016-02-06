#!/usr/bin/python

import argparse
import stages_t
import parser_t
import action_t
import add_to_field_t
import drop_t

parser = argparse.ArgumentParser(description='HP4 Source Code Generator')
parser.add_argument('--numstages', help='Max number of match-action stages',
                    type=int, action="store", default=3)
parser.add_argument('--numprimitives', help='Max number of primitives per compound action',
                    type=int, action="store", default=3)
parser.add_argument('--parse_opt', help='Add an option for parsing',
                    type=int, nargs='*', action="store", default=[256, 512, 768])

args = parser.parse_args()

class GenHp4():
  def __init__(self, nstages, nprimitives, parse_opts):
    f_hp4 = open('../p4src/hp4test.p4', 'w')

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
    out += "\n"

    f_hp4.write(out)

    out = "metadata meta_primitive_state_t meta_primitive_state;\n"
    out += "metadata meta_stdmeta_t meta_stdmeta;\n"
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
      out += indent + indent + "stage" + str(i+1) + "();\n"

    out += indent + "}\n"
    out += "}\n\n"

    f_hp4.write(out)

    out = "field_list clone_fl {\n"
    out += indent + "standard_metadata;\n"
    out += indent + "meta_ctrl;\n"
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

    for i in parse_opts:
      out += "action a_prep_deparse_" + str(i) + "() {\n"
      out += indent + "modify_field(bitfield_" + str(i) + ".data, extracted.data);\n"
      out += "}\n\n"
      t_prep4deparse_actions += indent + indent + "a_prep_deparse_" + str(i) + ";\n"

    out += "table prepare_for_deparsing {\n"
    out += indent + "actions {\n"
    out += t_prep4deparse_actions
    out += indent + "}\n"
    out += "}\n\n"

    f_hp4.write(out)

    out = "control egress {\n"
    out += indent + "if(meta_ctrl.do_multicast == 1) {\n"
    out += indent + indent + "apply(t_multicast);\n"
    out += indent + "}\n"
    out += indent + "apply(csum16);\n"
    out += indent + "apply(prepare_for_deparsing);\n"
    out += "}\n"

    f_hp4.write(out)

    f_hp4.close()

def main():
  GenHp4(args.numstages, args.numprimitives, args.parse_opt)
  stages_t.GenStages(args.numstages, args.numprimitives)
  parser_t.GenParser(args.parse_opt)
  action_t.GenAction(args.numstages, args.numprimitives)
  add_to_field_t.GenAdd_to_Field(args.numstages, args.numprimitives)
  drop_t.GenDrop(args.numstages, args.numprimitives)

if __name__ == '__main__':
    main()
