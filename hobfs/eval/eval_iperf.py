"""
iperf comparison between:
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
singlep = np.loadtxt("./passthroughx1/iperf", dtype='float')
doublep = np.loadtxt("./passthroughx2/iperf", dtype='float')
hobfs1 = np.loadtxt("./hobfsx1_unsecure/iperf_v2", dtype='float')
hobfs2u = np.loadtxt("./hobfsx2_unsecure/iperf_v2", dtype='float')
hobfs2s = np.loadtxt("./hobfsx2_secure/iperf_v2", dtype='float')

data_to_plot = [singlep, hobfs1, doublep, hobfs2u, hobfs2s]
fig = plt.figure(1, figsize=(6, 5))
ax = fig.add_subplot(111)
bp = ax.boxplot(data_to_plot, patch_artist=True)

for box in bp['boxes']:
  box.set(color='black', linewidth=2)
  box.set(facecolor='#FFFFFF')

for whisker in bp['whiskers']:
  whisker.set(color='black', linewidth=2)

for cap in bp['caps']:
  cap.set(color='black', linewidth=2)

for median in bp['medians']:
  median.set(color='black', linewidth=2)

for flier in bp['fliers']:
  flier.set(marker='o', color='#BBBBBB')

ax.set_xticklabels(['single r', 'single hobfs', 'two r', 'two hobfs:\nunsecure', 'two hobfs:\nsecure'])

ax.get_xaxis().tick_bottom()

plt.ylabel('avg TCP bandwidth(Mbps/s)')

plt.show()

fig.savefig('iperf_v2.png', bbox_inches='tight')
