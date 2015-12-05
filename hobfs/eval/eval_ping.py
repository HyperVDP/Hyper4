"""
Ping RTT comparison between:
- single repeater
- single instance of hobfs (unsecure mode)
- two repeaters
- two instances of hobfs (unsecure mode)
- two instances of hobfs (secure mode)

Relied on example at http://matplotlib.org/examples/statistics/histogram_demo_features.html

David Hancock
Univ of Utah
"""
import numpy as np
import matplotlib.mlab as mlab
import matplotlib.pyplot as plt

# Get data
singlep = np.loadtxt("./passthroughx1/ping", dtype='int')
doublep = np.loadtxt("./passthroughx2/ping", dtype='int')
hobfs1 = np.loadtxt("./hobfsx1_unsecure/ping_v2", dtype='int')
hobfs2u = np.loadtxt("./hobfsx2_unsecure/ping_v2", dtype='int')
hobfs2s, loss = np.loadtxt("./hobfsx2_secure/ping_v2", dtype='int', usecols=(0,1), unpack=True)

"""
num_bins = 5
#n, bins, patches = plt.hist(x, num_bins, normed=1, facecolor='green', alpha=0.5)
plt.hist(singlep, num_bins, normed=0, histtype='stepfilled', facecolor='red', alpha=0.5)
plt.hist(doublep, num_bins, normed=0, histtype='stepfilled', facecolor='blue', alpha=0.5)
plt.hist(hobfs1, num_bins, normed=0, histtype='stepfilled', facecolor='green', alpha=0.5)
plt.hist(hobfs2u, num_bins, normed=0, histtype='stepfilled', facecolor='yellow', alpha=0.5)
plt.hist(hobfs2s, num_bins, normed=0, histtype='stepfilled', facecolor='black', alpha=0.5)
plt.xlabel('RTT(ms)')
plt.ylabel('# 1000-ping runs')
plt.title(r'Ping RTT: Single vs Double Passthrough')

plt.subplots_adjust(left=0.15)
plt.show()
"""

data_to_plot = [singlep, hobfs1, doublep, hobfs2u, hobfs2s]
fig = plt.figure(1, figsize=(6, 5))
ax = fig.add_subplot(111)
bp = ax.boxplot(data_to_plot, patch_artist=True)

for box in bp['boxes']:
  box.set(color='black', linewidth=2)
  box.set(facecolor='#202020')

for whisker in bp['whiskers']:
  whisker.set(color='black', linewidth=2)

for cap in bp['caps']:
  cap.set(color='black', linewidth=2)

for median in bp['medians']:
  median.set(color='white', linewidth=2)

for flier in bp['fliers']:
  flier.set(marker='o', color='#202020')

ax.set_xticklabels(['single r', 'single hobfs', 'two r', 'two hobfs:\nunsecure', 'two hobfs:\nsecure'])

ax.get_xaxis().tick_bottom()

plt.ylabel('RTT(ms)')

plt.show()

fig.savefig('ping_v2.png', bbox_inches='tight')
