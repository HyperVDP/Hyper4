class GenAction():
  def __init__(self, nstages, nprimitives):
    f_action = open('../p4src/includes/actiontest.p4', 'w')

    std_h = open('std_header', 'r')
    f_action.write("/*\n")
    f_action.write(std_h.read())
    f_action.write("\n")
    std_h.close()

    action_d = open('docs/action_d', 'r')
    f_action.write(action_d.read())
    action_d.close()
    f_action.write("*/\n\n")

    indent = "  "

    out = "action a_set_primitive_metadata(primitive, primitive_subtype) {\n"
    out += indent + "modify_field(meta_primitive_state.primitive, primitive);\n"
    out += indent + "modify_field(meta_primitive_state.subtype, primitive_subtype);\n"
    out += "}"

    f_action.write(out)

    for i in range(nstages):
      for j in range(nprimitives):
        out = "\n\ntable set_primitive_metadata_" + str(i+1) + str(j+1) + " {\n"
        out += indent + "reads {\n"
        out += indent + indent + "meta_ctrl.program : exact;\n"
        out += indent + indent + "meta_primitive_state.primitive_index : exact;\n"
        out += indent + "}\n"
        out += indent + "actions {\n"
        out += indent + indent + "a_set_primitive_metadata;\n"
        out += indent + "}\n"
        out += "}"
        f_action.write(out)
    
    f_action.close()
