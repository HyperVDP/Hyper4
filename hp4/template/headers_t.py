class GenHeaders():
  def __init__(self):
    f_headers = open('../p4src/template/includes/headers.p4', 'w')

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

    f_headers.close()
