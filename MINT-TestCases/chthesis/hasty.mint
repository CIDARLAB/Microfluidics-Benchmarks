DEVICE hasty



LAYER FLOW 

SQUARE CELL TRAP square_cell_trap_1 componentSpacing=9000 ;
PORT port_1 componentSpacing=9000 ;
SQUARE CELL TRAP square_cell_trap_2 componentSpacing=9000 ;
SQUARE CELL TRAP square_cell_trap_3 componentSpacing=9000 ;
SQUARE CELL TRAP square_cell_trap_4 componentSpacing=9000 ;
PORT port_2 componentSpacing=9000 ;



CHANNEL channel_1 from square_cell_trap_1 2 to port_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_2 from square_cell_trap_2 2 to port_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_3 from square_cell_trap_3 2 to port_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_4 from square_cell_trap_4 2 to port_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_5 from port_2 1 to square_cell_trap_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_6 from port_2 1 to square_cell_trap_2 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_7 from port_2 1 to square_cell_trap_3 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_8 from port_2 1 to square_cell_trap_4 1 connectionSpacing=1000 channelWidth=400  ;

 

END LAYER

