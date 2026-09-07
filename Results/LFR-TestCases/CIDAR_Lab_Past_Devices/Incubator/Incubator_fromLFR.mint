DEVICE Incubator



LAYER FLOW 

REACTION CHAMBER reaction_chamber_1 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
SQUARE CELL TRAP square_cell_trap_1 componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
PORT port_1 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_2 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_3 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
REACTION CHAMBER reaction_chamber_2 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
REACTION CHAMBER reaction_chamber_3 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
MIXER mixer_1 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
REACTION CHAMBER reaction_chamber_4 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
MIXER mixer_2 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_3 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_4 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_5 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_6 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_7 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_8 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_9 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
PORT port_4 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_5 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_6 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_7 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_8 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;



CHANNEL channel_1 from reaction_chamber_1 3 to square_cell_trap_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_2 from reaction_chamber_2 3 to reaction_chamber_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_3 from reaction_chamber_3 3 to reaction_chamber_2 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_4 from mixer_1 2 to reaction_chamber_3 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_5 from reaction_chamber_4 3 to mixer_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_6 from square_cell_trap_1 2 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_7 from square_cell_trap_1 2 to port_2 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_8 from square_cell_trap_1 2 to port_3 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_9 from mixer_2 2 to mixer_3 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_10 from mixer_4 2 to port_2 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_11 from mixer_5 2 to mixer_4 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_12 from mixer_6 2 to mixer_7 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_13 from mixer_8 2 to mixer_5 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_14 from mixer_9 2 to mixer_8 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_15 from mixer_7 2 to mixer_2 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_16 from mixer_3 2 to reaction_chamber_4 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_17 from port_4 1 to mixer_4 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_18 from port_4 1 to mixer_3 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_19 from port_5 1 to mixer_8 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_20 from port_5 1 to mixer_7 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_21 from port_6 1 to mixer_6 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_22 from port_6 1 to mixer_9 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_23 from port_7 1 to mixer_6 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_24 from port_7 1 to mixer_9 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_25 from port_8 1 to mixer_2 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_26 from port_8 1 to mixer_5 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;

 

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
PORT Cport_10 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_11 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_12 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_13 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_14 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_15 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_16 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;

VALVE3D valve_0 on channel_10 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_1 on channel_10 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_2 on channel_10 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_3 on channel_10 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_4 on channel_10 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_5 on channel_10 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_6 on channel_10 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_7 on channel_10 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_8 on channel_10 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_9 on channel_10 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_10 on channel_10 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_11 on channel_10 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_12 on channel_10 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_13 on channel_10 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_14 on channel_10 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_15 on channel_10 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_16 on channel_10 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;

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
CHANNEL Ctrlchannel_10 from Cport_10 1 to valve_10 1 crossSection=1 channelWidth=600 connectionSpacing=1000  ;
CHANNEL Ctrlchannel_11 from Cport_11 1 to valve_11 1 crossSection=1 channelWidth=600 connectionSpacing=1000  ;
CHANNEL Ctrlchannel_12 from Cport_12 1 to valve_12 1 crossSection=1 channelWidth=600 connectionSpacing=1000  ;
CHANNEL Ctrlchannel_13 from Cport_13 1 to valve_13 1 crossSection=1 channelWidth=600 connectionSpacing=1000  ;
CHANNEL Ctrlchannel_14 from Cport_14 1 to valve_14 1 crossSection=1 channelWidth=600 connectionSpacing=1000  ;
CHANNEL Ctrlchannel_15 from Cport_15 1 to valve_15 1 crossSection=1 channelWidth=600 connectionSpacing=1000  ;
CHANNEL Ctrlchannel_16 from Cport_16 1 to valve_16 1 crossSection=1 channelWidth=600 connectionSpacing=1000  ;

 

END LAYER

