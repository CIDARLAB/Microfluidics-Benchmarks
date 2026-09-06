DEVICE Grad_Cells



LAYER FLOW 

SQUARE CELL TRAP square_cell_trap_1 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
PORT port_1 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
SQUARE CELL TRAP square_cell_trap_2 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
SQUARE CELL TRAP square_cell_trap_3 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
SQUARE CELL TRAP square_cell_trap_4 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
MIXER mixer_1 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_2 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
PORT port_2 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_3 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;



CHANNEL channel_1 from square_cell_trap_1 2 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_2 from square_cell_trap_2 2 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_3 from square_cell_trap_3 2 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_4 from square_cell_trap_4 2 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_5 from mixer_1 2 to square_cell_trap_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_6 from mixer_1 2 to square_cell_trap_2 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_7 from mixer_1 2 to square_cell_trap_3 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_8 from mixer_1 2 to square_cell_trap_4 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_9 from mixer_2 2 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_10 from port_2 1 to mixer_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_11 from port_2 1 to mixer_2 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_12 from port_3 1 to mixer_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;

 

END LAYER

LAYER CONTROL 

PORT Cport_0 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_1 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;

VALVE3D valve_0 on channel_9 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_1 on channel_9 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;

CHANNEL Ctrlchannel_0 from Cport_0 1 to valve_0 1 crossSection=1 channelWidth=600 connectionSpacing=1000  ;
CHANNEL Ctrlchannel_1 from Cport_1 1 to valve_1 1 crossSection=1 channelWidth=600 connectionSpacing=1000  ;

 

END LAYER

