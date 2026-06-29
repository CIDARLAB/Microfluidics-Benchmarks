DEVICE tdroplet

LAYER flow

PORT p1portRadius=100;
H DROPLET GENERATOR T t1radius=100 oilChannelWidth=100 waterChannelWidth=20 length=2000 height=30;
H MIXER x1numberOfBends=5 bendSpacing=100 bendLength=100 channelWidth=100;
H DROPLET GENERATOR T t2radius=100 oilChannelWidth=100 waterChannelWidth=20 length=2000 height=30;
H MIXER x2numberOfBends=5 bendSpacing=100 bendLength=100 channelWidth=100;
V MUX m1 1 to 2spacing=500 width=400 length=100 stageLength=1000 flowChannelWidth=100 controlChannelWidth=50;
H LONG CELL TRAP ct1numberOfChambers=10 chamberWidth=100 chamberLength=100 chamberSpacing=30 feedingChannelWidth=100;
CHANNEL c1 from t1 1 to x1 1 channelWidth=100;
CHANNEL c2 from x1 2 to m1 1 channelWidth=100;
CHANNEL c3 from t2 1 to x2 1 channelWidth=100;
CHANNEL c4 from x2 2 to m1 2 channelWidth=100;
CHANNEL c5 from m1 3 to ct1 1 channelWidth=100;
CHANNEL c6 from ct1 2 to p1 channelWidth=100;

END layer

LAYER control

PORT cp1, cp2portRadius=100;
CHANNEL cc1 from cp1 to m1 4channelWidth=100;
CHANNEL cc2 from cp2 to m1 5channelWidth=100;

END layer