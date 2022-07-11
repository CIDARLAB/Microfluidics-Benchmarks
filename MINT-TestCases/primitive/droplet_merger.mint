DEVICE droplet_merger

LAYER FLOW

PORT p1;

PORT p2;

DROPLET MERGER m1;

CHANNEL c1 from p1 to m1 1 channelWidth=400;

CHANNEL c2 from m1 2 to p2 channelWidth=400;


END LAYER