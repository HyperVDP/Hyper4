class GenAdd_Header():
  def __init__(self, parse_opt, nstages, nprimitives, test):
    fpath = '../p4src/includes/add_header'
    if test:
      fpath += '_test'
    fpath += '.p4'
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

    out += "action a_addh(sz, offset, msk) {\n"
    out += indent + "modify_field(extracted.dcpy, extracted.data);\n"
    out += indent + "modify_field(extracted.data, extracted.data >> (sz*8));\n"
    out += indent + "modify_field(extracted.data, 0, msk);\n"
    out += indent + "modify_field(extracted.data, extracted.dcpy, (~msk >> "
    out += "(32 - (offset*8))) << (32 - (offset*8)));\n"
    out += indent + "modify_field(parse_ctrl.numbytes, parse_ctrl.numbytes + sz);\n"
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
