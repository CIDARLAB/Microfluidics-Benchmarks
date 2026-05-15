DEVICE device1_scRNA_seq



LAYER FLOW 

SQUARE CELL TRAP square_cell_trap_1 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_1 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_2 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
MIXER mixer_1 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_2 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_3 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_3 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_4 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_5 componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from square_cell_trap_1 2 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_2 from square_cell_trap_1 2 to port_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_3 from mixer_1 2 to mixer_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_4 from mixer_2 2 to square_cell_trap_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_5 from mixer_3 2 to mixer_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_6 from port_3 1 to mixer_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_7 from port_4 1 to mixer_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_8 from port_4 1 to mixer_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_9 from port_5 1 to mixer_3 1 connectionSpacing=1000 channelWidth=400;

 

END LAYER

