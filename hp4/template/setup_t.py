class GenSetup():
  def __init__(self, parse_opts):
    f_setup = open('../p4src/includes/setup_test.p4', 'w')

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
      out += indent + "actions + {\n"
      out += indent + indent + "a" + suffix + ";\n"
      out += indent + "}\n"
      out += "}\n\n"
      f_setup.write(out)
    """
    part2 = open('setup_part2', 'r')
    f_setup.write(part2.read())
    part2.close()
    """
    
    f_setup.close()
