class GenModify_Field():
  def __init__(self, nstages, nprimitives):
    f_modfld = open('../p4src/includes/modify_field.p4', 'w')

    std_h = open('std_header', 'r')
    f_modfld.write("/*\n")
    f_modfld.write(std_h.read())
    f_modfld.write("\n")
    std_h.close()

    match_d = open('docs/modify_field_d', 'r')
    f_modfld.write(match_d.read())
    match_d.close()
    f_modfld.write("*/\n\n")

    part1 = open('modify_field_part1', 'r')
    f_modfld.write(part1.read())
    part1.close()
    
    indent = "  "

    for i in range(nstages):
      for j in range(nprimitives):
        out = "\n\ntable t_mod_" + str(i+1) + str(j+1) + " {\n"
        out += indent + "reads {\n"
        out += indent + indent + "meta_ctrl.program : exact;\n"
        out += indent + indent + "meta_primitive_state.subtype : exact;\n"
        out += indent + indent + "meta_primitive_state.match_ID : exact;\n"
        out += indent + "}\n"
        out += indent + "actions {\n"
        out += indent + indent + "mod_meta_stdmeta_ingressport;\n"
        out += indent + indent + "mod_meta_stdmeta_packetlength;\n"
        out += indent + indent + "mod_meta_stdmeta_egressspec;\n"
        out += indent + indent + "mod_meta_stdmeta_egressport;\n"
        out += indent + indent + "mod_meta_stdmeta_egressinst;\n"
        out += indent + indent + "mod_meta_stdmeta_insttype;\n"
        out += indent + indent + "mod_stdmeta_egressspec_meta;\n"
        out += indent + indent + "mod_meta_const;\n"
        out += indent + indent + "mod_stdmeta_egressspec_const;\n"
        out += indent + indent + "mod_extracted_const;\n"
        out += indent + "}\n"
        out += "}"
        f_modfld.write(out)

    for i in range(nstages):
      for j in range(nprimitives):
        out = "\n\ntable t_mod_prep_" + str(i+1) + str(j+1) + " {\n"
        out += indent + "reads {\n"
        out += indent + indent + "meta_ctrl.program : exact;\n"
        out += indent + indent + "meta_primitive_state.action_ID : exact;\n"
        out += indent + indent + "meta_primitive_state.primitive_index : exact;\n"
        out += indent + "}\n"
        out += indent + "actions {\n"
        out += indent + indent + "a_mod_prep;\n"
        out += indent + indent + "_no_op;\n"
        out += indent + "}\n"
        out += "}"
        f_modfld.write(out)

    for i in range(nstages):
      for j in range(nprimitives):
        out = "\n\ncontrol do_modify_field_" + str(i+1) + str(j+1) + " {\n"
        out += indent + "apply(t_mod_prep_" + str(i+1) + str(j+1) + ");\n"
        out += indent + "apply(t_mod_" + str(i+1) + str(j+1) + ");\n"
        out += "}\n"
        f_modfld.write(out)

    f_modfld.close()
