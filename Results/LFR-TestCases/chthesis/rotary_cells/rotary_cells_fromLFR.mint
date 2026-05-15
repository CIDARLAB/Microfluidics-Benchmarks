# Please add default length and width to reaction chamber component
DEVICE rotary_cells



LAYER FLOW 

REACTION CHAMBER reaction_chamber_1 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_1 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
SQUARE CELL TRAP square_cell_trap_1 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0;
SQUARE CELL TRAP square_cell_trap_2 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0;
SQUARE CELL TRAP square_cell_trap_3 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0;
SQUARE CELL TRAP square_cell_trap_4 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0;
REACTION CHAMBER reaction_chamber_2 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_2 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_3 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_4 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_5 componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from reaction_chamber_1 4 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_2 from reaction_chamber_1 4 to square_cell_trap_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_3 from reaction_chamber_1 4 to square_cell_trap_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_4 from reaction_chamber_1 4 to square_cell_trap_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_5 from reaction_chamber_1 4 to square_cell_trap_4 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_6 from square_cell_trap_1 2 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_7 from square_cell_trap_2 2 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_8 from square_cell_trap_3 2 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_9 from square_cell_trap_4 2 to port_1 1 connectionSpacing=1000 channelWidth=400;

 

END LAYER

