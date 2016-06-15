class GenAdd_to_Field():
  def __init__(self, nstages, nprimitives, test):
    fpath = '../p4src/'
    if test:
      fpath += 'config_' + str(nstages) + str(nprimitives) + '/'
    fpath += 'includes/add_to_field.p4'
    f_a2f = open(fpath, 'w')

    std_h = open('std_header', 'r')
    f_a2f.write("/*\n")
    f_a2f.write(std_h.read())
    f_a2f.write("\n")
    std_h.close()

    a2f_d = open('docs/add_to_field_d', 'r')
    f_a2f.write(a2f_d.read())
    a2f_d.close()
    f_a2f.write("*/\n\n")

    indent = "  "

    out = "action a_add2f_extracted_const(val, leftshift, rightshift, emask) {\n"
    out += indent + "modify_field(extracted.dcpy, (extracted.data << leftshift) >> rightshift);\n"
    out += indent + "modify_field(extracted.dcpy, extracted.dcpy + val);\n"
    out += indent + "modify_field(extracted.data, (extracted.data & ~emask) | ( ((extracted.dcpy << rightshift) >> leftshift) & emask));\n"
    out += "}"

    f_a2f.write(out)

    for i in range(nstages):
      for j in range(nprimitives):
        out = "\n\ntable t_add_to_field_" + str(i+1) + str(j+1) + " {\n"
        out += indent + "reads {\n"
        out += indent + indent + "meta_ctrl.program : exact;\n"
        out += indent + indent + "meta_primitive_state.subtype : exact;\n"
        out += indent + indent + "meta_primitive_state.match_ID : exact;\n"
        out += indent + "}\n"
        out += indent + "actions {\n"
        out += indent + indent + "a_add2f_extracted_const;\n"
        out += indent + "}\n"
        out += "}"
        f_a2f.write(out)
    
    for i in range(nstages):
      for j in range(nprimitives):
        out = "\n\ncontrol do_add_to_field_" + str(i+1) + str(j+1) + " {\n"
        out += indent + "apply(t_add_to_field_" + str(i+1) + str(j+1) + ");\n"
        out += "}"
        f_a2f.write(out)

    f_a2f.close()
