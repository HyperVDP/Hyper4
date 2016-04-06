class GenParser():
  def __init__(self, parse_opts):
    f_parser = open('../p4src/includes/parser.p4', 'w')

    std_h = open('std_header', 'r')
    f_parser.write("/*\n")
    f_parser.write(std_h.read())
    f_parser.write("\n")
    std_h.close()

    parser_d = open('docs/parser_d', 'r')
    f_parser.write(parser_d.read())
    parser_d.close()
    f_parser.write("*/\n\n")

    out = "metadata meta_parse_t meta_parse;\n\n"

    for i in parse_opts:
      out += "header bitfield_" + str(i) + "_t bitfield_" + str(i) + ";\n"
        
    f_parser.write(out)

    indent = "  "

    out = "\nparser start {\n"
    out += indent + "return select(meta_parse.parse_width) {\n"
    for i in parse_opts:
      out += indent + indent + str(i) + " : parse_" + str(i) + ";\n"
    out += indent + indent + "default : ingress;\n"
    out += indent + "}\n"
    out += "}"

    f_parser.write(out)

    for i in parse_opts:
      out = "\n\nparser parse_" + str(i) + " {\n"
      out += indent + "extract(bitfield_" + str(i) + ");\n"
      out += indent + "set_metadata(meta_ctrl.stage, NORM);\n"
      out += indent + "return ingress;\n"
      out += "}"
      f_parser.write(out)
    
    f_parser.close()
