class GenTruncate():
  def __init__(self, nstages, nprimitives):
    f_trunc = open('../p4src/template/includes/truncate.p4', 'w')

    std_h = open('std_header', 'r')
    f_trunc.write("/*\n")
    f_trunc.write(std_h.read())
    f_trunc.write("\n")
    std_h.close()

    trunc_d = open('docs/truncate_d', 'r')
    f_trunc.write(trunc_d.read())
    trunc_d.close()
    f_trunc.write("*/\n\n")

    indent = "  "

    out = "action a_truncate(val) {\n"
    out += indent + "truncate(val);\n"
    out += "}"

    f_trunc.write(out)

    for i in range(nstages):
      for j in range(nprimitives):
        out = "\n\ntable t_truncate_" + str(i+1) + str(j+1) + " {\n"
        out += indent + "actions {\n"
        out += indent + indent + "a_truncate;\n"
        out += indent + "}\n"
        out += "}"
        f_trunc.write(out)
    
    for i in range(nstages):
      for j in range(nprimitives):
        out = "\n\ncontrol do_truncate_" + str(i+1) + str(j+1) + " {\n"
        out += indent + "apply(t_truncate_" + str(i+1) + str(j+1) + ";\n"
        out += "}"
        f_trunc.write(out)

    f_trunc.close()
