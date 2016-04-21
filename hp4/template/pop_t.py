class GenPop():
  def __init__(self, nstages, nprimitives, test):
    fpath = '../p4src/includes/pop'
    if test:
      fpath += '_test'
    fpath += '.p4'
    f_pop = open(fpath, 'w')

    std_h = open('std_header', 'r')
    f_pop.write("/*\n")
    f_pop.write(std_h.read())
    f_pop.write("\n")
    std_h.close()

    pop_d = open('docs/pop_d', 'r')
    f_pop.write(pop_d.read())
    pop_d.close()
    f_pop.write("*/\n\n")

    indent = "  "
    out = ""

    f_pop.write(out)

