class GenParse_Opts():
  def __init__(self, parse_opts):
    f_po = open('../p4src/template/includes/parse_opts.p4', 'w')

    std_h = open('std_header', 'r')
    f_po.write("/*\n")
    f_po.write(std_h.read())
    f_po.write("\n")
    std_h.close()

    po_d = open('docs/parse_opts_d', 'r')
    f_po.write(po_d.read())
    po_d.close()
    f_po.write("*/")

    indent = "  "

    for i in parse_opts:
      out = "\n\nheader_type bitfield_" + str(i) + "_t {\n"
      out += indent + "fields {\n"
      out += indent + indent + "data : " + str(i) + ";\n"
      out += indent + "}\n"
      out += "}"
      f_po.write(out)
    
    f_po.close()
