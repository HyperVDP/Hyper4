P1 -> P1' eval

Test 1: ping flood

1. Set up switch with P1 (program: 1) and P1' (program: 2).
2. Configure switch to run P1
3. start pings between h1-h2, and h3-h1
4. Swap to P1', observe h3-h1 pings stop while h1-h2 pings continue
5. Swap back to P1, observe h3-h1 pings resume while h1-h2 pings continue
6. Stop the pings, observe 0% packet loss for h1-h2 pings:

26078 packets transmitted, 26078 received, 0% packet loss, time 15684ms
rtt min/avg/max/mdev = 0.000/0.515/15.478/0.741 ms, pipe 2, ipg/ewma 0.601/0.441 ms

Test 2: wget, 100M file

1. Set up switch with P1 and P1'
2. Configure switch to run P1
3. Start HTTP transfer of 100M file
4. During the transfer, swap to P1'
5. Observe transfer completes at approx 10 MB/s
6. Start another HTTP transfer of 100M file
7. During the transfer, swap back to P1
8. Observe transfer complete at approx 10 MB/s


