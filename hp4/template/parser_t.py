class GenParser():
  def __init__(self, parse_opts, test):
    fpath = '../p4src/includes/parser'
    if test:
      fpath += '_test'
    fpath += '.p4'
    f_parser = open(fpath, 'w')

    std_h = open('std_header', 'r')
    f_parser.write("/*\n")
    f_parser.write(std_h.read())
    f_parser.write("\n")
    std_h.close()

    parser_d = open('docs/parser_d', 'r')
    f_parser.write(parser_d.read())
    parser_d.close()
    f_parser.write("*/\n\n")

    out = "metadata parse_ctrl_t parse_ctrl;\n"
    out += "header ext_t ext[" + str(parse_opts[1]) + "];\n\n"        
    f_parser.write(out)

    indent = "  "

    out = "parser start {\n"
    out += indent + "set_metadata(parse_ctrl.next_action, PROCEED);\n"
    for i in range(parse_opts[0]):
      out += indent + "extract(ext[next]);\n"
    out += "return select(parse_ctrl.numbytes) {\n"
    out += indent + indent + "0 : ingress;\n"
    out += indent + indent + str(parse_opts[0]) + " : ingress;\n"

    next_ten = 10*((parse_opts[0]+10)/10)

    for i in range(parse_opts[0]+1, next_ten):
      out += indent + indent + str(i) + " : pr0" + str(i % 10) + ";\n"
    out += indent + indent + "default : p" + str(next_ten) + ";\n"
    out += indent + "}\n"
    out += "}\n\n"
    f_parser.write(out)

    for i in range(1, 10):
      out = "parser pr0" + str(i) + " {\n"
      for j in range(i):
        out += indent + "extract(ext[next]);\n"
      out += indent + "return ingress;\n"
      out += "}\n\n"
      f_parser.write(out)

    for i in range(next_ten, parse_opts[1], 10):
      out = "parser p" + str(i) + " {\n"
      for j in range(10):
        out += indent + "extract(ext[next]);\n"
      out += indent + "return select(parse_ctrl.numbytes) {\n"
      out += indent + indent + str(i) + " : ingress;\n"
      for j in range(1, 10):
        out += indent + indent + str(i + j) + " : pr0" + str(j) + ";\n"
      out += indent + indent + "default : p" + str(i + 10) + ";\n"
      out += indent + "}\n"
      out += "}\n\n"
      f_parser.write(out)

    out = "parser p" + str(parse_opts[1]) + " {\n"
    for i in range(10):
      out += indent + "extract(ext[next]);\n"
    out += indent + "return ingress;\n"
    out += "}"
    f_parser.write(out)
    
    f_parser.close()
