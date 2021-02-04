DEVICE pump


LAYER FLOW

PORT p1, p2;

PUMP pump;

CHANNEL c1 from p1 to pump 1 channelWidth=400;
CHANNEL c2 from p2 to pump 2 channelWidth=400;

END LAYER

LAYER CONTROL

PORT cp1, cp2, cp3;

CHANNEL cc1 from cp1 to pump 3 channelWidth=400;
CHANNEL cc2 from cp2 to pump 4 channelWidth=400;
CHANNEL cc3 from cp3 to pump 5 channelWidth=400;

END LAYER