class GenRemove_Header():
  def __init__(self, nstages, nprimitives, test):
    fpath = '../p4src/'
    if test:
      fpath += 'test/config_' + str(nstages) + str(nprimitives) + '/'
    fpath += 'includes/remove_header.p4'
    f_remvh = open(fpath, 'w')

    std_h = open('std_header', 'r')
    f_remvh.write("/*\n")
    f_remvh.write(std_h.read())
    f_remvh.write("\n")
    std_h.close()

    remvh_d = open('docs/remove_header_d', 'r')
    f_remvh.write(remvh_d.read())
    remvh_d.close()
    f_remvh.write("*/\n\n")

    indent = "  "
    out = ""

    f_remvh.write(out)

