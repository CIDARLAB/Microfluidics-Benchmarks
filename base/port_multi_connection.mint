DEVICE port_multi_connection

LAYER FLOW

PORT p1, p2;

MIXER m1, m2;

CHANNEL c1 from p1 to m1 channelWidth=400;
CHANNEL c2 from p1 to m2 channelWidth=400;
CHANNEL c3 from m1 to p2 channelWidth=400;
CHANNEL c4 from m2 to p2 channelWidth=400;

END LAYER