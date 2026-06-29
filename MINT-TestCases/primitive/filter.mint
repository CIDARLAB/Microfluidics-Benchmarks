DEVICE filter

LAYER flow

PORT p1;

PORT p2;

FILTER m1;

CHANNEL c1 from p1 to m1 1channelWidth=400;

CHANNEL c2 from m1 2 to p2 channelWidth=400;

END layer