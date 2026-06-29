DEVICE test05

LAYER flow
 PORT p1, p2portRadius=100;
H LONG CELL TRAP ct1numberOfChambers=10 chamberWidth=100 chamberLength=100 chamberSpacing=50 feedingChannelWidth=100 ;

CHANNEL c1 from p1 2 to ct1 1 channelWidth=100;
CHANNEL c2 from ct1 2 to p2 4 channelWidth=100;


END layer

