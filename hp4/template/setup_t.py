class GenSetup():
  def __init__(self, parse_opts):
    f_setup = open('../p4src/includes/setuptest.p4', 'w')

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

    for i in parse_opts:
      out = "\naction a_norm_" + str(i) + "() {\n"
      out += indent + "modify_field(extracted.data, bitfield_" + str(i) + ".data);\n"
      out += "}\n"
      t_norm_actions += indent + indent + "a_norm_" + str(i) + ";\n"
      f_setup.write(out)

    out = "\ntable t_norm {\n"
    out += indent + "reads {\n"
    out += indent + indent + "meta_ctrl.program : exact;\n"
    out += indent + "}\n"
    out += indent + "actions {\n"
    out += t_norm_actions
    out += indent + "}\n"
    out += "}\n\n"
    f_setup.write(out)

    part2 = open('setup_part2', 'r')
    f_setup.write(part2.read())
    part2.close()
    
    f_setup.close()
