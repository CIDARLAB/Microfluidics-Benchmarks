DEVICE tree_test_01

LAYER FLOW

 PORT pin, pout_1, pout_2 portRadius=200;

H TREE tr 1 to 2 flowChannelWidth=100;

H BANK ct0, ct1 of  LONG CELL TRAP numberOfChambers=10 chamberLength=100 
    chamberWidth=100 chamberSpacing=30 flowChannelWidth=100 controlChannelWidth=20;

CHANNEL c1 from pin to tr 1 channelWidth=100;
CHANNEL c2 from tr to ct0 channelWidth=100;
CHANNEL c3 from tr to ct1 channelWidth=100;

CHANNEL c4 from ct0 to pout_1 channelWidth=100;
CHANNEL c5 from ct1 to pout_2 channelWidth=100;

END LAYER
