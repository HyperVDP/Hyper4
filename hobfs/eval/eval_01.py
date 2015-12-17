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
singlep = np.loadtxt("./passthroughx1/http", dtype='float')
#doublep = np.loadtxt("./passthroughx2/ping", dtype='int')
hobfs1v1 = np.loadtxt("./hobfsx1_unsecure/http", dtype='float')
#hobfs2uv1 = np.loadtxt("./hobfsx2_unsecure/ping", dtype='int')
hobfs1v2 = np.loadtxt("./hobfsx1_unsecure/http_v2", dtype='float')
#hobfs2uv2 = np.loadtxt("./hobfsx2_unsecure/ping_v2", dtype='int')
#hobfs2s, loss = np.loadtxt("./hobfsx2_secure/ping_v2", dtype='int', usecols=(0,1), unpack=True)

data_to_plot = [singlep, hobfs1v1, hobfs1v2]
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

#ax.set_xticklabels(['single r', 'single hobfs', 'two r', 'two hobfs:\nunsecure', 'two hobfs:\nsecure'])
ax.set_xticklabels(['single r', 'single hobfs v1', 'single hobfs v2'])

ax.get_xaxis().tick_bottom()

plt.ylabel('Transfer rate (MB/s)')

plt.show()

fig.savefig('http_v1_v2.png', bbox_inches='tight')
