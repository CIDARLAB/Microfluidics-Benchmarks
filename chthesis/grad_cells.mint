DEVICE grad_cells

LAYER FLOW

V BANK pb1, pb2 of PORT portRadius=100 spacing=1200 ;
PORT p1 portRadius=100;
NODE n1;
H GRADIENT GENERATOR g 1 to 4 numberOfBends=10 bendSpacing=100 bendLength=500 
    channelWidth=100 spacing=2000;
V MUX m1 1 to 4 spacing=500 width=400 length=100 stageLength=1000 flowChannelWidth=100 controlChannelWidth=50;
V TREE t1 4 to 1 spacing=500 flowChannelWidth=100 stageLength=500;
V BANK ctb of 4 LONG CELL TRAP numberOfChambers=20 chamberWidth=100 
    chamberLength=100 chamberSpacing=30 feedingChannelWidth=100;
CHANNEL c1 from pb1 to n1 channelWidth=100;
CHANNEL c2 from pb2 to n1 channelWidth=100;
CHANNEL c3 from n1 to g 1 channelWidth=100;
CHANNEL c4 from g 2 to m1 1 channelWidth=100;
CHANNEL c5 from m1 2 to ctb_1 channelWidth=100;
CHANNEL c6 from m1 3 to ctb_2 channelWidth=100;
CHANNEL c7 from m1 4 to ctb_3 channelWidth=100;
CHANNEL c8 from m1 5 to ctb_4 channelWidth=100;
CHANNEL c9 from ctb_1 to t1 1 channelWidth=100;
CHANNEL c10 from ctb_2 to t1 2 channelWidth=100;
CHANNEL c11 from ctb_3 to t1 3 channelWidth=100;
CHANNEL c12 from ctb_4 to t1 4 channelWidth=100;
CHANNEL c13 from t1 5 to p1 channelWidth=100;

END LAYER

LAYER CONTROL

H BANK cpb1_1, cpb1_2 of   PORT portRadius=100 spacing=1200 ;
H BANK cpb2_1, cpb2_2 of   PORT portRadius=100 spacing=1200 ;
CHANNEL cc1 from cpb1_1 to m1 7 channelWidth=50;
CHANNEL cc2 from cpb1_2 to m1 9 channelWidth=50;
CHANNEL cc3 from cpb2_1 to m1 6 channelWidth=50;
CHANNEL cc4 from cpb2_2 to m1 8 channelWidth=50;

END LAYER

