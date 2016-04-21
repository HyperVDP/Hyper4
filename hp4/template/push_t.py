class GenPush():
  def __init__(self, nstages, nprimitives, test):
    fpath = '../p4src/includes/push'
    if test:
      fpath += '_test'
    fpath += '.p4'
    f_push = open(fpath, 'w')

    std_h = open('std_header', 'r')
    f_push.write("/*\n")
    f_push.write(std_h.read())
    f_push.write("\n")
    std_h.close()

    push_d = open('docs/push_d', 'r')
    f_push.write(push_d.read())
    push_d.close()
    f_push.write("*/\n\n")

    indent = "  "
    out = ""

    f_push.write(out)

