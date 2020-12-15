DEVICE satest

LAYER FLOW

PORT p1, p2 portRadius=2000;
V MIXER m1 numberOfBends=1 bendSpacing=1230 bendLength=2460 channelWidth=800;

CHANNEL c1 from p1 to m1 1 channelWidth=800 height=250;

CHANNEL c2 from p2 to m1 2 channelWidth=800 height=250;


END LAYER