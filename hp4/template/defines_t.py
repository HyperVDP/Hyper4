class GenDefines():
  def __init__(self, nstages, nprimitives, parse_opts, test):
    fpath = '../p4src/'
    if test:
      fpath += 'test/config_' + str(nstages) + str(nprimitives) + '/'
    fpath += 'includes/defines.p4'
    f_defines = open(fpath, 'w')

    std_h = open('std_header', 'r')
    f_defines.write("/*\n")
    f_defines.write(std_h.read())
    f_defines.write("\n")
    std_h.close()

    defines_d = open('docs/defines_d', 'r')
    f_defines.write(defines_d.read())
    defines_d.close()
    f_defines.write("*/\n\n")

    out = "// extracted.data/.dcpy field width\n"
    out += "#define EXTRACTED_SIZE\t" + str(parse_opts[1]*8) + "\n\n"
    f_defines.write(out)

    out = "// parse_ctrl.next_action\n"
    out += "#define PROCEED\t\t\t\t0\n"
    out += "#define INSPECT_SEB\t\t1\n"
    j = 2
    for i in range(parse_opts[0], parse_opts[1], 10):
      out += "#define INSPECT_" + str(i) + "_" + str(i + 9) + " " + str(j) + "\n"
      j += 1
    out += "#define EXTRACT_MORE\t" + str(j) + "\n\n"
    f_defines.write(out)

    defines_src = open('defines.p4', 'r')
    f_defines.write(defines_src.read())
    defines_src.close()

    f_defines.close()
