# Please add default length and width to reaction chamber component
DEVICE grad_cells



LAYER FLOW 

REACTION CHAMBER reaction_chamber_1 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_1 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
SQUARE CELL TRAP square_cell_trap_1 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0;
SQUARE CELL TRAP square_cell_trap_2 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0;
SQUARE CELL TRAP square_cell_trap_3 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0;
SQUARE CELL TRAP square_cell_trap_4 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_1 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_2 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_3 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_4 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_5 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_6 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_7 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_8 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_9 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_10 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_11 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_12 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_2 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_3 componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from reaction_chamber_1 4 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_2 from reaction_chamber_1 4 to square_cell_trap_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_3 from reaction_chamber_1 4 to square_cell_trap_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_4 from reaction_chamber_1 4 to square_cell_trap_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_5 from reaction_chamber_1 4 to square_cell_trap_4 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_6 from mixer_1 2 to mixer_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_7 from mixer_3 2 to mixer_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_8 from mixer_4 2 to mixer_5 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_9 from mixer_6 2 to mixer_7 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_10 from mixer_8 2 to mixer_5 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_11 from mixer_9 2 to mixer_10 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_12 from mixer_11 2 to mixer_10 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_13 from mixer_12 2 to mixer_7 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_14 from port_2 1 to mixer_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_15 from port_2 1 to mixer_4 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_16 from port_2 1 to mixer_11 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_17 from port_2 1 to mixer_12 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_18 from port_3 1 to mixer_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_19 from port_3 1 to mixer_6 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_20 from port_3 1 to mixer_8 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_21 from port_3 1 to mixer_9 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_22 from square_cell_trap_1 2 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_23 from square_cell_trap_2 2 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_24 from square_cell_trap_3 2 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_25 from square_cell_trap_4 2 to port_1 1 connectionSpacing=1000 channelWidth=400;

 

END LAYER

LAYER CONTROL 







 

END LAYER

