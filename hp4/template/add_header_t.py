class GenAdd_Header():
  def __init__(self, nstages, nprimitives, test):
    fpath = '../p4src/includes/add_header'
    if test:
      fpath += '_test'
    fpath += '.p4'
    f_addh = open(fpath, 'w')

    std_h = open('std_header', 'r')
    f_addh.write("/*\n")
    f_addh.write(std_h.read())
    f_addh.write("\n")
    std_h.close()

    addh_d = open('docs/add_header_d', 'r')
    f_addh.write(addh_d.read())
    addh_d.close()
    f_addh.write("*/\n\n")

    indent = "  "
    out = ""

    

    f_addh.write(out)

