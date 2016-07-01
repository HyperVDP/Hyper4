class GenAdd_Header():
  def __init__(self, nstages, nprimitives, parse_opt, test):
    fpath = '../p4src/'
    if test:
      fpath += 'test/config_' + str(nstages) + str(nprimitives) + '/'
    fpath += 'includes/add_header.p4'
    f_addh = open(fpath, 'w')

    std_h = open('std_header', 'r')
    f_addh.write("/*\n")
    f_addh.write(std_h.read())
    f_addh.write("\n")
    std_h.close()

    addh_d = open('docs/add_header_d', 'r')
    f_addh.write(addh_d.read())
    addh_d.close()
    f_addh.write("*/\n\n")

    indent = "  "
    out = ""

    out += "action a_addh(sz, offset, msk, vbits) {\n"
    out += indent + "modify_field(extracted.dcpy, extracted.data);\n"
    out += indent + "modify_field(extracted.data, extracted.data >> (sz*8));\n"
    out += indent + "modify_field(extracted.data, (extracted.data & ~msk));\n\n"

    out += indent + "// zero out bytes we don't need by rightshifting them out\n"
    out += indent + "// of bounds, then leftshift to bring the mask for the bytes\n"
    out += indent + "// we do need back into position\n"
    out += indent + "modify_field( extracted.data, (extracted.data & ~((~msk >> "
    out += "(EXTRACTED_SIZE - (offset*8))) << (EXTRACTED_SIZE - (offset*8)))) | "
    out += "(extracted.dcpy & ((~msk >> (EXTRACTED_SIZE - (offset*8))) << "
    out += "(EXTRACTED_SIZE - (offset*8)))) );\n\n"

    out += indent + "modify_field(parse_ctrl.numbytes, parse_ctrl.numbytes + sz);\n"
    out += indent + "modify_field(extracted.validbits, extracted.validbits | vbits);\n"
    out += "}\n\n"
    
    f_addh.write(out)

    for i in range(nstages):
      for j in range(nprimitives):
        out = "table t_addh_" + str(i+1) + str(j+1) + " {\n"
        out += indent + "reads {\n"
        out += indent + indent + "meta_ctrl.program : exact;\n"
        out += indent + indent + "meta_primitive_state.action_ID : exact;\n"
        out += indent + indent + "meta_primitive_state.primitive_index : exact;\n"
        out += indent + "}\n"
        out += indent + "actions {\n"
        out += indent + indent + "a_addh;\n"
        out += indent + "}\n"
        out += "}\n\n"
        f_addh.write(out)

    for i in range(nstages):
      for j in range(nprimitives):
        out = "control do_add_header_" + str(i+1) + str(j+1) + " {\n"
        out += indent + "apply(t_addh_" + str(i+1) + str(j+1) + ");\n"
        out += "}\n\n"
        f_addh.write(out)

    f_addh.close()
