DEVICE valve

LAYER flow

PORT p1, p2;

CHANNEL c1 from p1 to p2channelWidth = 100;

END layer

LAYER control

PORT cp1;

VALVE v1 on c1;

CHANNEL cc1 from cp1 to v1channelWidth = 100;

END layer