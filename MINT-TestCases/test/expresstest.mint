# Please add default length and width to reaction chamber component
DEVICE expresstest



LAYER FLOW 

REACTION CHAMBER reaction_chamber_1 componentSpacing=9000 ;
SQUARE CELL TRAP square_cell_trap_1 componentSpacing=9000 ;
PORT port_1 componentSpacing=9000 ;
MIXER mixer_1 componentSpacing=9000 ;
PORT port_2 componentSpacing=9000 ;
PORT port_3 componentSpacing=9000 ;



CHANNEL channel_1 from reaction_chamber_1 4 to square_cell_trap_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_2 from square_cell_trap_1 2 to port_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_3 from mixer_1 2 to reaction_chamber_1 2 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_4 from port_2 1 to mixer_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_5 from port_3 1 to mixer_1 1 connectionSpacing=1000 channelWidth=400  ;

 

END LAYER

