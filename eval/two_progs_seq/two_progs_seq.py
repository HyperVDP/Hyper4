import pylab

list_of_files = [ ('h2-h1-reqs', 'h2 - h1 echo requests'), ('h1-h2-resps', 'h1 - h2 echo replies'), ('h1-h3-reqs', 'h1 - h3 echo requests'), ('h3-h1-resps', 'h3 - h1 echo replies')]

datalist = [ ( pylab.loadtxt(filename), label ) for filename, label in list_of_files ]

i = 0

mrk = ['r.', 'g.', 'b.', 'k.']

for data, label in datalist:
    pylab.plot( data[:,0], data[:,1], mrk[i], label=label)
    i += 1

pylab.ylim(0, 5)
pylab.xlim(45, 77)
frame = pylab.gca()

my_yticks = ['h3-h1\nreplies','h1-h3\nrequests','h1-h2\nreplies','h2-h1\nrequests']
y = [1, 2, 3, 4]
pylab.yticks(y, my_yticks)
pylab.fill_between([62.51, 69.34], 0, 5, facecolor='gray', alpha=0.2)
pylab.text(55, 0.3, 'P1')
pylab.text(65, 0.3, 'P1\'')
pylab.text(72.5, 0.3, 'P1')

#pylab.title("Program Swap Test Using Ping")
pylab.xlabel("packet timestamps from start of capture")

pylab.show()
