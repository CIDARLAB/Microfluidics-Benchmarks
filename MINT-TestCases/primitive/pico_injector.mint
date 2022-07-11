DEVICE pico_injector

LAYER FLOW

PORT p1, p2, p3;

PICOINJECTOR pi;

CHANNEL c1 from p1 to pi 1 channelWidth=400;
CHANNEL c2 from p2 to pi 2 channelWidth=400;
CHANNEL c3 from p3 to pi 3 channelWidth=400;

END LAYER
