DEVICE droplet_sorter

LAYER flow

PORT p1, p2, p3;

DROPLET SORTER s;

CHANNEL c1 from p1 to s 1channelWidth=400;
CHANNEL c2 from p2 to s 2channelWidth=400;
CHANNEL c3 from p3 to s 3channelWidth=400;
END layer