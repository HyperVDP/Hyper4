class GenSetup():
  def __init__(self, parse_opts, test):
    fpath = '../p4src/includes/setup'
    if test:
      fpath += '_test'
    fpath += '.p4'
    f_setup = open(fpath, 'w')

    std_h = open('std_header', 'r')
    f_setup.write("/*\n")
    f_setup.write(std_h.read())
    f_setup.write("\n")
    std_h.close()

    match_d = open('docs/setup_d', 'r')
    f_setup.write(match_d.read())
    match_d.close()
    f_setup.write("*/\n\n")
    
    indent = "  "

    t_norm_actions = ""

    lshift = parse_opts[1] * 8

    out = "action a_norm_SEB() {\n"
    for i in range(parse_opts[0]):
      lshift -= 8
      out += indent + "modify_field(extracted.data, extracted.data + (ext[" + \
             str(i) + "].data << " + str(lshift) + "));\n"
    out += "}\n\n"
    out += "table t_norm_SEB {\n"
    out += indent + "actions {\n"
    out += indent + indent + "a_norm_SEB;\n"
    out += indent + "}\n"
    out += "}\n\n"
    f_setup.write(out)
   
    for i in range(parse_opts[0], parse_opts[1], parse_opts[2]):
      suffix = "_norm_" + str(i) + "_" + str(i + parse_opts[2] - 1)
      out = "action a" + suffix + "() {\n"
      for j in range(i, i + parse_opts[2]):
        lshift -= 8
        out += indent + "modify_field(extracted.data, extracted.data + (ext[" + \
               str(j) + "].data << " + str(lshift) + "));\n"
      out += "}\n\n"
      out += "table t" + suffix + " {\n"
      out += indent + "actions {\n"
      out += indent + indent + "a" + suffix + ";\n"
      out += indent + "}\n"
      out += "}\n\n"
      f_setup.write(out)

    part1 = open('setup_part1', 'r')
    f_setup.write(part1.read())
    part1.close()

    actions = indent + "actions {\n"
    actions += indent + indent + "set_next_action;\n"
    actions += indent + indent + "set_next_action_chg_program;\n"
    actions += indent + indent + "extract_more;\n"
    actions += indent + indent + "extract_more_chg_program;\n"
    actions += indent + "}\n"

    out = "\ntable t_inspect_SEB {\n"
    out += indent + "reads {\n"
    out += indent + indent + "meta_ctrl.program : exact;\n"
    for i in range(parse_opts[0]):
      out += indent + indent + "ext[" + str(i) + "].data : ternary;\n"
    out += indent + "}\n"
    out += actions
    out += "}\n\n"
    f_setup.write(out)

    for i in range(parse_opts[0], parse_opts[1], 10):
      out = "table t_inspect_" + str(i) + "_" + str(i + 9) + " {\n"
      out += indent + "reads {\n"
      out += indent + indent + "meta_ctrl.program : exact;\n"
      out += indent + indent + "parse_ctrl.state : exact;\n"
      for j in range(i, i + 10):
        out += indent + indent + "ext[" + str(j) + "].data : ternary;\n"
      out += indent + "}\n"
      out += actions
      out += "}\n\n"
      f_setup.write(out)
    
    part2 = open('setup_part2', 'r')
    f_setup.write(part2.read())
    part2.close()

    for i in range(parse_opts[0], parse_opts[1], 10):
      out = indent + "if(parse_ctrl.next_action == INSPECT_" + str(i) + "_" + \
            str(i + 9) + ") {\n"
      out += indent + indent + "apply(t_inspect_" + str(i) + "_" + str(i + 9) + ");\n"
      out += indent + "}\n"
      f_setup.write(out)

    out = indent + "if(parse_ctrl.next_action == PROCEED) {\n"
    out += indent + indent + "apply(t_norm_SEB);\n"
    indentb = indent + indent
    for i in range(parse_opts[0], parse_opts[1], parse_opts[2]):
      out += indentb + "if(parse_ctrl.numbytes > " + str(i) + ") {\n"
      indentb += indent
      out += indentb + "apply(t_norm_" + str(i) + "_" + str(i + parse_opts[2] - 1) + \
             ");\n"
    for i in range(parse_opts[0], parse_opts[1], parse_opts[2]):
      indentb = indentb[0:len(indentb) - 2]
      out += indentb + "}\n"
    out += indent + indent + "apply(t_set_first_table);\n"
    out += indent + "}\n"
    out += "}"

    f_setup.write(out)
    
    f_setup.close()
