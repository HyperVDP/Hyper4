class GenDefines():
  def __init__(self):
    f_defines = open('../p4src/template/includes/defines.p4', 'w')

    std_h = open('std_header', 'r')
    f_defines.write("/*\n")
    f_defines.write(std_h.read())
    f_defines.write("\n")
    std_h.close()

    defines_d = open('docs/defines_d', 'r')
    f_defines.write(defines_d.read())
    defines_d.close()
    f_defines.write("*/\n\n")

    defines_src = open('defines.p4', 'r')
    f_defines.write(defines_src.read())
    defines_src.close()

    f_defines.close()
