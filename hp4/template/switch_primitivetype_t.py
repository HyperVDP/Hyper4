class GenSwitch_PrimitiveType():
  def __init__(self, nstages, nprimitives):
    f_swprim = open('../p4src/template/includes/switch_primitivetype.p4', 'w')

    std_h = open('std_header', 'r')
    f_swprim.write("/*\n")
    f_swprim.write(std_h.read())
    f_swprim.write("\n")
    std_h.close()

    match_d = open('docs/switch_primitivetype_d', 'r')
    f_swprim.write(match_d.read())
    match_d.close()
    f_swprim.write("*/\n\n")

    out = "#include \"modify_field.p4\"\n"
    out += "#include \"drop.p4\"\n"
    out += "#include \"multicast.p4\"\n"
    out += "#include \"add_to_field.p4\"\n"
    f_swprim.write(out)
    
    indent = "  "

    for i in range(nstages):
      for j in range(nprimitives):
        out = "\n\ncontrol switch_primitivetype_" + str(i+1) + str(j+1) + " {\n"
        out += indent + "if(meta_primitive_state.primitive == A_MODIFY_FIELD) {\n"
        out += indent + indent + "do_modify_field_" + str(i+1) + str(j+1) + "();\n"
        out += indent + "}\n"
        out += indent + "else if(meta_primitive_state.primitive == A_DROP) {\n"
        out += indent + indent + "do_drop_" + str(i+1) + str(j+1) + "();\n"
        out += indent + "}\n"
        out += indent + "else if(meta_primitive_state.primitive == A_NO_OP) {\n"
        out += indent + "}\n"
        out += indent + "else if(meta_primitive_state.primitive == A_MULTICAST) {\n"
        out += indent + indent + "do_multicast_" + str(i+1) + str(j+1) + "();\n"
        out += indent + "}\n"
        out += indent + "else if(meta_primitive_state.primitive == A_ADD_TO_FIELD) {\n"
        out += indent + indent + "do_add_to_field_" + str(i+1) + str(j+1) + "();\n"
        out += indent + "}\n"
        out += "}"
        f_swprim.write(out)

    f_swprim.close()
