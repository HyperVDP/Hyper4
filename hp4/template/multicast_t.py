class GenMulticast():
  def __init__(self, nstages, nprimitives, test):
    fpath = '../p4src/hp4/includes/multicast'
    if test:
      fpath += '_test'
    fpath += '.p4'
    f_mcast = open(fpath, 'w')

    std_h = open('std_header', 'r')
    f_mcast.write("/*\n")
    f_mcast.write(std_h.read())
    f_mcast.write("\n")
    std_h.close()

    match_d = open('docs/multicast_d', 'r')
    f_mcast.write(match_d.read())
    match_d.close()
    f_mcast.write("*/\n\n")
    
    indent = "  "

    out = "action a_multicast(seq_id, highport) {\n"
    out += indent + "modify_field(meta_ctrl.multicast_seq_id, seq_id);\n"
    out += indent + "modify_field(meta_ctrl.multicast_current_egress, highport);\n"
    out += indent + "modify_field(meta_ctrl.do_multicast, 1);\n"
    out += indent + "modify_field(standard_metadata.egress_spec, highport);\n"
    out += "}"
    f_mcast.write(out)

    for i in range(nstages):
      for j in range(nprimitives):
        out = "\n\ntable t_multicast_" + str(i+1) + str(j+1) + " {\n"
        out += indent + "reads {\n"
        out += indent + indent + "meta_ctrl.program : exact;\n"
        out += indent + "}\n"
        out += indent + "actions {\n"
        out += indent + indent + "a_multicast;\n"
        out += indent + "}\n"
        out += "}"
        f_mcast.write(out)

    for i in range(nstages):
      for j in range(nprimitives):
        out = "\n\ncontrol do_multicast_" + str(i+1) + str(j+1) + " {\n"
        out += indent + "apply(t_multicast_" + str(i+1) + str(j+1) + ");\n"
        out += "}"
        f_mcast.write(out)

    f_mcast.close()
