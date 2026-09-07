DEVICE Microreactor



LAYER FLOW 

SQUARE CELL TRAP square_cell_trap_1 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
MIXER mixer_1 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
PORT port_1 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
SQUARE CELL TRAP square_cell_trap_2 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
MIXER mixer_2 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
SQUARE CELL TRAP square_cell_trap_3 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
MIXER mixer_3 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
PORT port_2 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;



CHANNEL channel_1 from square_cell_trap_1 2 to mixer_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_2 from square_cell_trap_2 2 to mixer_2 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_3 from square_cell_trap_3 2 to mixer_3 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_4 from mixer_1 2 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_5 from mixer_3 2 to mixer_2 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_6 from mixer_2 2 to mixer_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_7 from port_2 1 to square_cell_trap_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_8 from port_2 1 to square_cell_trap_2 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_9 from port_2 1 to square_cell_trap_3 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_10 from port_2 1 to mixer_3 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_11 from port_2 1 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;

 

END LAYER

LAYER CONTROL 

PORT Cport_0 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_1 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_2 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_3 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_4 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_5 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_6 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_7 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_8 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_9 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;

VALVE3D valve_0 on channel_11 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_1 on channel_11 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_2 on channel_11 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_3 on channel_11 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_4 on channel_11 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_5 on channel_11 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_6 on channel_11 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_7 on channel_11 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_8 on channel_11 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_9 on channel_11 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;

CHANNEL Ctrlchannel_0 from Cport_0 1 to valve_0 1 crossSection=1 channelWidth=600 connectionSpacing=1000  ;
CHANNEL Ctrlchannel_1 from Cport_1 1 to valve_1 1 crossSection=1 channelWidth=600 connectionSpacing=1000  ;
CHANNEL Ctrlchannel_2 from Cport_2 1 to valve_2 1 crossSection=1 channelWidth=600 connectionSpacing=1000  ;
CHANNEL Ctrlchannel_3 from Cport_3 1 to valve_3 1 crossSection=1 channelWidth=600 connectionSpacing=1000  ;
CHANNEL Ctrlchannel_4 from Cport_4 1 to valve_4 1 crossSection=1 channelWidth=600 connectionSpacing=1000  ;
CHANNEL Ctrlchannel_5 from Cport_5 1 to valve_5 1 crossSection=1 channelWidth=600 connectionSpacing=1000  ;
CHANNEL Ctrlchannel_6 from Cport_6 1 to valve_6 1 crossSection=1 channelWidth=600 connectionSpacing=1000  ;
CHANNEL Ctrlchannel_7 from Cport_7 1 to valve_7 1 crossSection=1 channelWidth=600 connectionSpacing=1000  ;
CHANNEL Ctrlchannel_8 from Cport_8 1 to valve_8 1 crossSection=1 channelWidth=600 connectionSpacing=1000  ;
CHANNEL Ctrlchannel_9 from Cport_9 1 to valve_9 1 crossSection=1 channelWidth=600 connectionSpacing=1000  ;

 

END LAYER

