DEVICE Hasty_Cell_Traps



LAYER FLOW 

SQUARE CELL TRAP square_cell_trap_1 componentSpacing=2000.0 rotation=0.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 ;
PORT port_1 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
PORT port_2 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
SQUARE CELL TRAP square_cell_trap_2 componentSpacing=2000.0 rotation=0.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 ;
SQUARE CELL TRAP square_cell_trap_3 componentSpacing=2000.0 rotation=0.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 ;
SQUARE CELL TRAP square_cell_trap_4 componentSpacing=2000.0 rotation=0.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 ;



CHANNEL channel_1 from square_cell_trap_1 2 to port_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_2 from port_2 1 to square_cell_trap_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_3 from square_cell_trap_2 2 to port_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_4 from port_2 1 to square_cell_trap_2 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_5 from square_cell_trap_3 2 to port_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_6 from port_2 1 to square_cell_trap_3 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_7 from square_cell_trap_4 2 to port_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_8 from port_2 1 to square_cell_trap_4 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;

 

END LAYER

