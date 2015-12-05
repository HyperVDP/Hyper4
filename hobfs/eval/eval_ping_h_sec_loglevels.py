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
hobfs2s_out, loss = np.loadtxt("./hobfsx2_secure/ping_v2_lowlog", dtype='int', usecols=(0,1), unpack=True)
hobfs2s_info, loss = np.loadtxt("./hobfsx2_secure/ping_v2", dtype='int', usecols=(0,1), unpack=True)

data_to_plot = [hobfs2s_out, hobfs2s_info]
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

ax.set_xticklabels(['out', 'info'])

ax.get_xaxis().tick_bottom()

plt.ylabel('RTT(ms)')

plt.show()

fig.savefig('ping_v2_h_sec_loglevels.png', bbox_inches='tight')
