class GenSwitch_PrimitiveType():
  def __init__(self, nstages, nprimitives, test):
    fpath = '../p4src/'
    if test:
      fpath += 'test/config_' + str(nstages) + str(nprimitives) + '/'
    fpath += 'includes/switch_primitivetype.p4'
    f_swprim = open(fpath, 'w')

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
    out += "#include \"add_header.p4\"\n"
    out += "#include \"copy_header.p4\"\n"
    out += "#include \"remove_header.p4\"\n"
    out += "#include \"push.p4\"\n"
    out += "#include \"pop.p4\"\n"
    out += "#include \"drop.p4\"\n"
    out += "#include \"multicast.p4\"\n"
    out += "#include \"add_to_field.p4\"\n"
    out += "#include \"truncate.p4\"\n"
    f_swprim.write(out)
    
    indent = "  "

    ifprefix = "if(meta_primitive_state.primitive == "
    for i in range(nstages):
      for j in range(nprimitives):
        ifsuffix = str(i+1) + str(j+1) + "();\n" + indent + "}\n"
        out = "\n\ncontrol switch_primitivetype_" + str(i+1) + str(j+1) + " {\n"

        out += indent + ifprefix + "A_MODIFY_FIELD) {\n"
        out += indent + indent + "do_modify_field_" + ifsuffix

        out += indent + "else " + ifprefix + "A_ADD_HEADER) {\n"
        out += indent + indent + "do_add_header_" + ifsuffix

        out += indent + "else " + ifprefix + "A_TRUNCATE) {\n"
        out += indent + indent + "do_truncate_" + ifsuffix

        out += indent + "else " + ifprefix + "A_DROP) {\n"
        out += indent + indent + "do_drop_" + ifsuffix

        out += indent + "else " + ifprefix + "A_NO_OP) {\n"
        out += indent + "}\n"

        out += indent + "else " + ifprefix + "A_MULTICAST) {\n"
        out += indent + indent + "do_multicast_" + ifsuffix

        out += indent + "else " + ifprefix + "A_ADD_TO_FIELD) {\n"
        out += indent + indent + "do_add_to_field_" + ifsuffix

        out += "}"
        f_swprim.write(out)

    f_swprim.close()
