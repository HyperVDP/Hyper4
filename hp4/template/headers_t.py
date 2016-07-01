class GenHeaders():
  def __init__(self, nstages, nprimitives, parse_opts, test):
    fpath = '../p4src/'
    if test:
      fpath += 'test/config_' + str(nstages) + str(nprimitives) + '/'
    fpath += 'includes/headers.p4'
    f_headers = open(fpath, 'w')

    std_h = open('std_header', 'r')
    f_headers.write("/*\n")
    f_headers.write(std_h.read())
    f_headers.write("\n")
    std_h.close()

    headers_d = open('docs/headers_d', 'r')
    f_headers.write(headers_d.read())
    headers_d.close()
    f_headers.write("*/\n\n")

    headers_src = open('headers.p4', 'r')
    f_headers.write(headers_src.read())
    headers_src.close()

    out = "header_type extracted_t {\n"
    out += "  fields {\n"
    out += "    data : " + str(parse_opts[1] * 8) + ";\n"
    out += "    dcpy : " + str(parse_opts[1] * 8) + ";\n"
    out += "    validbits : 80;\n"
    out += "  }\n"
    out += "}"
    f_headers.write(out)

    f_headers.close()
