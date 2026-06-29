DEVICE tree_test_01

LAYER flow

 PORT pin, pout_1, pout_2portRadius=200;

H TREE tr 1 to 2flowChannelWidth=100;

H BANK ct0, ct1 of  LONG CELL TRAPnumberOfChambers=10 chamberLength=100 
    chamberWidth=100 chamberSpacing=30 flowChannelWidth=100 controlChannelWidth=20;

CHANNEL c1 from pin to tr 1channelWidth=100;
CHANNEL c2 from tr to ct0channelWidth=100;
CHANNEL c3 from tr to ct1channelWidth=100;

CHANNEL c4 from ct0 to pout_1channelWidth=100;
CHANNEL c5 from ct1 to pout_2channelWidth=100;

END layer
