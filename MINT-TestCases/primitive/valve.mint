DEVICE valve

LAYER FLOW

PORT p1, p2;

CHANNEL c1 from p1 to p2 channelWidth = 100;

END LAYER

LAYER CONTROL

PORT cp1;

VALVE v1 on c1;

CHANNEL cc1 from cp1 to v1 channelWidth = 100;

END LAYER