DEVICE issue6



LAYER FLOW 

SQUARE CELL TRAP square_cell_trap_1 componentSpacing=9000 ;
PORT port_1 componentSpacing=9000 ;
PORT port_2 componentSpacing=9000 ;
PORT port_3 componentSpacing=9000 ;
PORT port_4 componentSpacing=9000 ;
PORT port_5 componentSpacing=9000 ;
PORT port_6 componentSpacing=9000 ;
PORT port_7 componentSpacing=9000 ;
PORT port_8 componentSpacing=9000 ;
PORT port_9 componentSpacing=9000 ;
PORT port_10 componentSpacing=9000 ;
PORT port_11 componentSpacing=9000 ;



CHANNEL channel_1 from square_cell_trap_1 2 to port_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_2 from square_cell_trap_1 2 to port_2 1 connectionSpacing=1000 channelWidth=400  ;

 

END LAYER

LAYER CONTROL 







 

END LAYER

