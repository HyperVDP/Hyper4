class GenDrop():
  def __init__(self, nstages, nprimitives):
    f_drop = open('../p4src/includes/drop.p4', 'w')

    std_h = open('std_header', 'r')
    f_drop.write("/*\n")
    f_drop.write(std_h.read())
    f_drop.write("\n")
    std_h.close()

    drop_d = open('docs/drop_d', 'r')
    f_drop.write(drop_d.read())
    drop_d.close()
    f_drop.write("*/\n\n")

    indent = "  "

    out = "action a_drop() {\n"
    out += indent + "drop();\n"
    out += "}"

    f_drop.write(out)

    for i in range(nstages):
      for j in range(nprimitives):
        out = "\n\ntable t_drop_" + str(i+1) + str(j+1) + " {\n"
        out += indent + "actions {\n"
        out += indent + indent + "a_drop;\n"
        out += indent + "}\n"
        out += "}"
        f_drop.write(out)
    
    for i in range(nstages):
      for j in range(nprimitives):
        out = "\n\ncontrol do_drop_" + str(i+1) + str(j+1) + " {\n"
        out += indent + "apply(t_drop_" + str(i+1) + str(j+1) + ");\n"
        out += "}"
        f_drop.write(out)

    f_drop.close()
