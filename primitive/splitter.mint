DEVICE droplet_splitter

LAYER FLOW

PORT p1, p2, p3;

DROPLET SPLITTER s ;

CHANNEL c1 from p1 to s 1 channelWidth=400;
CHANNEL c2 from p2 to s 2 channelWidth=400;
CHANNEL c3 from p3 to s 3 channelWidth=400;

END LAYER