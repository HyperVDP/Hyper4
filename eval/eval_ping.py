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
sr = np.loadtxt("./sr_ping.t", dtype='int')
hp4_sr = np.loadtxt("./hp4-sr-ping.t", dtype='int')

data_to_plot = [sr, hp4_sr]
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

ax.set_xticklabels(['simple router', 'hp4[simple router]'])

ax.get_xaxis().tick_bottom()

plt.ylabel('Time to complete (ms)')

plt.show()

#fig.savefig('ping_v2.png', bbox_inches='tight')
