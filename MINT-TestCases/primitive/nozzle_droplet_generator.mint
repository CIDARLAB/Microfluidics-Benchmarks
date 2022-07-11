DEVICE nozzle_droplet_generator

LAYER FLOW

PORT p1, p2, p3, p4;

NOZZLE DROPLET GENERATOR g;

CHANNEL co1 from g 1 to p1 channelWidth=200;
CHANNEL co2 from g 2 to p2 channelWidth=200;
CHANNEL co3 from g 3 to p3 channelWidth=200;
CHANNEL c04 from g 4 to p4 channelWidth=200;


END LAYER