class GenSwitch_StdMeta():
  def __init__(self, nstages):
    f_swstdm = open('../p4src/includes/switch_stdmeta.p4', 'w')

    std_h = open('std_header', 'r')
    f_swstdm.write("/*\n")
    f_swstdm.write(std_h.read())
    f_swstdm.write("\n")
    std_h.close()

    match_d = open('docs/switch_stdmeta_d', 'r')
    f_swstdm.write(match_d.read())
    match_d.close()
    f_swstdm.write("*/\n\n")
  
    indent = "  "

    fields = ["ingress_port", "packet_length", "instance_type", "egress_spec"]

    for i in range(nstages):
      for field in fields:
        out = "\ntable t" + str(i+1) + "_stdmeta_" + field + " {\n" 
        out += indent + "reads {\n"
        out += indent + indent + "meta_ctrl.program : exact;\n"
        out += indent + indent + "standard_metadata." + field + " : exact;\n"
        out += indent + "}\n"
        out += indent + "actions {\n"
        out += indent + indent + "init_program_state;\n"
        out += indent + "}\n"
        out += "}\n"
        f_swstdm.write(out)

    for i in range(nstages):
      out = "\n\ncontrol switch_stdmeta_" + str(i+1) + " {\n"
      out += indent + "if"
      for field in fields:
        out += "(meta_stdmeta.stdmeta_ID == STDMETA_" + field.upper() + ") {\n"
        out += indent + indent + "apply(t" + str(i+1) + "_stdmeta_" + field + ");\n"
        out += indent + "}\n"
        f_swstdm.write(out)
        out = indent + "else if"

      out = "}"
      f_swstdm.write(out)

    f_swstdm.close()
