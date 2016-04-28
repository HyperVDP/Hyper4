class GenAdd_Header():
  def __init__(self, addh_opt, addh_numsteps, parse_opt, nstages, nprimitives, test):
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

    out += "action a_addh_prep(remaining) {\n"
    out += indent + "modify_field(meta_primitive_state.hmanip_remaining, "
    out += "remaining);\n}\n\n"

    f_addh.write(out)

    for i in range(nstages):
      for j in range(nprimitives):
        out = "table t_addh_prep_" + str(i+1) + str(j+1) + " {\n"
        out += indent + "reads {\n"
        out += indent + indent + "meta_ctrl.program : exact;\n"
        out += indent + "}\n"
        out += indent + "actions {\n"
        out += indent + indent + "a_addh_prep;\n"
        out += indent + "}\n"
        out += "}\n\n"
        f_addh.write(out)

    actionprofile = "action_profile addhs {\n"
    actionprofile += indent + "actions {\n"

    for i in range(parse_opt[1]):
      for j in addh_opt:
        if (i + j > parse_opt[1]):
          continue
        digit = ""
        if i < 10:
          digit = "0"
        digit += str(i)
        actionname = "a_add_header_" + digit + "_" + str(j)
        actionprofile += indent + indent + actionname + ";\n"
        out = "action " + actionname + "() {\n"
        for k in range(j):
          out += indent + "add_header(ext[" + str(i) + "]);\n"
        out += indent + "modify_field(meta_primitive_state.hmanip_remaining, "
        out += "meta_primitive_state.hmanip_remaining - " + str(j) + ");\n"
        out += "}\n\n"
        f_addh.write(out)

    actionprofile += indent + "}\n"
    actionprofile += "}\n\n"
    f_addh.write(actionprofile)

    for i in range(nstages):
      for j in range(nprimitives):
        for k in range(addh_numsteps):
          out = "table t_add_header_" + str(i+1) + str(j+1) + "_" + str(k+1) + " {\n"
          out += indent + "reads {\n"
          out += indent + indent + "meta_ctrl.program : exact;\n"
          out += indent + indent + "meta_primitive_state.action_ID : exact;\n"
          out += indent + indent + "meta_primitive_state.primitive_index : exact;\n"
          out += indent + "}\n"
          out += indent + "action_profile : addhs;\n"
          out += "}\n\n"
          f_addh.write(out)

    for i in range(nstages):
      for j in range(nprimitives):
        out = "control do_add_header_" + str(i+1) + str(j+1) + " {\n"
        out += indent + "apply(t_addh_prep_" + str(i+1) + str(j+1) + ");\n"
        indent2 = indent
        for k in range(addh_numsteps):
          out += indent2 + "if (meta_primitive_state.hmanip_remaining > 0) {\n"
          indent2 += indent
          out += indent2 + "apply(t_add_header_" + str(i+1) + str(j+1) + "_" + str(k+1) + ");\n"
        for k in range(addh_numsteps):
          indent2 = indent2[:len(indent2)-len(indent)]
          out += indent2 + "}\n"
        out += "}\n\n"
        f_addh.write(out)

    f_addh.close()
