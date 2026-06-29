DEVICE transposer

LAYER flow

PORT p1, p2, p3, p4;

TRANSPOSER t;

CHANNEL c1 from p1 to t 1channelWidth=400;
CHANNEL c2 from p2 to t 2channelWidth=400;
CHANNEL c3 from p3 to t 3channelWidth=400;
CHANNEL c4 from p4 to t 4channelWidth=400;

END layer

LAYER control

PORT cp1, cp2;

CHANNEL cc1 from cp1 to t 5channelWidth=400;
CHANNEL cc2 from cp2 to t 6channelWidth=400;

END layer