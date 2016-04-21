class GenCopy_Header():
  def __init__(self, nstages, nprimitives, test):
    fpath = '../p4src/includes/copy_header'
    if test:
      fpath += '_test'
    fpath += '.p4'
    f_copyh = open(fpath, 'w')

    std_h = open('std_header', 'r')
    f_copyh.write("/*\n")
    f_copyh.write(std_h.read())
    f_copyh.write("\n")
    std_h.close()

    copyh_d = open('docs/copy_header_d', 'r')
    f_copyh.write(copyh_d.read())
    copyh_d.close()
    f_copyh.write("*/\n\n")

    indent = "  "
    out = ""

    f_copyh.write(out)

