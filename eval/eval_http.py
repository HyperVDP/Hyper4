"""
HTTP wget 10MB file comparison between:
- L2 switch
- HP4 emulating the L2 switch

Relied on example at http://matplotlib.org/examples/statistics/histogram_demo_features.html

David Hancock
Univ of Utah
"""
import numpy as np
import matplotlib.mlab as mlab
import matplotlib.pyplot as plt

# Get data
sr = np.loadtxt("./sr-http.t", dtype='float')
hp4_sr = np.loadtxt("./hp4-sr-http.t", dtype='float')

data_to_plot = [sr, hp4_sr]
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

ax.set_xticklabels(['l2 switch', 'hp4[l2 switch]'])

ax.get_xaxis().tick_bottom()

plt.ylabel('Avg transfer rate (MB/s)')

plt.show()

# fig.savefig('http_v2.png', bbox_inches='tight')
