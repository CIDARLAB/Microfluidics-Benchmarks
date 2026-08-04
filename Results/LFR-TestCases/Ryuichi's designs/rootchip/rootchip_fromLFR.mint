DEVICE rootchip



LAYER FLOW 

SQUARE CELL TRAP square_cell_trap_1 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
PORT port_1 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
SQUARE CELL TRAP square_cell_trap_2 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
SQUARE CELL TRAP square_cell_trap_3 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
PORT port_2 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
SQUARE CELL TRAP square_cell_trap_4 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
PORT port_3 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
SQUARE CELL TRAP square_cell_trap_5 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
PORT port_4 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
SQUARE CELL TRAP square_cell_trap_6 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
PORT port_5 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
SQUARE CELL TRAP square_cell_trap_7 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
PORT port_6 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
SQUARE CELL TRAP square_cell_trap_8 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
PORT port_7 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
SQUARE CELL TRAP square_cell_trap_9 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
PORT port_8 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
PORT port_9 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
PORT port_10 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;
PORT port_11 componentSpacing=1000.0 portRadius=700.0 height=1100.0 ;



CHANNEL channel_1 from square_cell_trap_1 2 to port_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_2 from square_cell_trap_2 2 to square_cell_trap_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_3 from square_cell_trap_2 2 to square_cell_trap_3 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_4 from square_cell_trap_2 2 to square_cell_trap_4 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_5 from square_cell_trap_2 2 to square_cell_trap_5 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_6 from square_cell_trap_2 2 to square_cell_trap_6 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_7 from square_cell_trap_2 2 to square_cell_trap_7 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_8 from square_cell_trap_2 2 to square_cell_trap_8 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_9 from square_cell_trap_2 2 to square_cell_trap_9 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_10 from square_cell_trap_3 2 to port_2 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_11 from square_cell_trap_4 2 to port_3 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_12 from square_cell_trap_5 2 to port_4 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_13 from square_cell_trap_6 2 to port_5 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_14 from square_cell_trap_7 2 to port_6 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_15 from square_cell_trap_8 2 to port_7 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_16 from square_cell_trap_9 2 to port_8 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_17 from port_9 1 to square_cell_trap_2 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_18 from port_10 1 to square_cell_trap_2 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_19 from port_11 1 to square_cell_trap_2 1 connectionSpacing=1000 channelWidth=400  ;

 

END LAYER

