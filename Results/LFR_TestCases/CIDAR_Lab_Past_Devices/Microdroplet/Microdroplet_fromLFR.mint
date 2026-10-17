DEVICE Microdroplet



LAYER FLOW 

NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1 componentSpacing=2000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 ;
MIXER mixer_1 componentSpacing=2000.0 rotation=0.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 bendLength=2000.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_2 componentSpacing=2000.0 rotation=0.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 bendLength=2000.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 edgeBend1=300.0 edgeBend2=300.0 ;
PORT port_1 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
PORT port_2 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_2 componentSpacing=2000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 ;
MIXER mixer_3 componentSpacing=2000.0 rotation=0.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 bendLength=2000.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_4 componentSpacing=2000.0 rotation=0.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 bendLength=2000.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 edgeBend1=300.0 edgeBend2=300.0 ;
PORT port_3 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
PORT port_4 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
PORT port_5 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
SQUARE CELL TRAP square_cell_trap_1 componentSpacing=2000.0 rotation=0.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 ;
MIXER mixer_5 componentSpacing=2000.0 rotation=0.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 bendLength=2000.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 edgeBend1=300.0 edgeBend2=300.0 ;
PORT port_6 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
PORT port_7 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
PORT port_8 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
PORT port_9 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
MIXER mixer_6 componentSpacing=2000.0 rotation=0.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 bendLength=2000.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_7 componentSpacing=2000.0 rotation=0.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 bendLength=2000.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_8 componentSpacing=2000.0 rotation=0.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 bendLength=2000.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_9 componentSpacing=2000.0 rotation=0.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 bendLength=2000.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_10 componentSpacing=2000.0 rotation=0.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 bendLength=2000.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 edgeBend1=300.0 edgeBend2=300.0 ;



CHANNEL channel_1 from nozzle_droplet_generator_1 3 to mixer_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_2 from port_2 1 to nozzle_droplet_generator_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_3 from nozzle_droplet_generator_2 3 to mixer_3 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_4 from port_5 1 to nozzle_droplet_generator_2 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_5 from mixer_5 2 to square_cell_trap_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_6 from square_cell_trap_1 2 to port_7 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_7 from square_cell_trap_1 2 to port_8 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_8 from square_cell_trap_1 2 to port_9 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_9 from mixer_7 2 to mixer_6 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_10 from port_6 1 to mixer_6 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_11 from mixer_6 2 to port_8 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_12 from mixer_8 2 to mixer_7 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_13 from port_1 1 to mixer_7 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_14 from mixer_9 2 to mixer_8 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_15 from port_2 1 to mixer_8 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_16 from mixer_3 2 to mixer_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_17 from mixer_4 2 to mixer_3 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_18 from mixer_10 2 to mixer_9 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_19 from port_5 1 to mixer_9 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_20 from mixer_1 2 to mixer_2 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_21 from mixer_2 2 to mixer_5 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_22 from port_6 1 to mixer_5 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_23 from port_3 1 to mixer_4 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_24 from port_4 1 to mixer_4 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_25 from port_1 1 to mixer_2 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_26 from port_3 1 to mixer_10 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_27 from port_4 1 to mixer_10 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;

 

END LAYER

LAYER CONTROL 

PORT Cport_0 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
PORT Cport_1 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
PORT Cport_2 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
PORT Cport_3 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
PORT Cport_4 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
PORT Cport_5 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
PORT Cport_6 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
PORT Cport_7 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
PORT Cport_8 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;

VALVE3D valve_0 on channel_11 componentSpacing=1000.0 valveRadius=1200 gap=600 depth=250 rotation=0.0 ;
VALVE3D valve_1 on channel_11 componentSpacing=1000.0 valveRadius=1200 gap=600 depth=250 rotation=0.0 ;
VALVE3D valve_2 on channel_11 componentSpacing=1000.0 valveRadius=1200 gap=600 depth=250 rotation=0.0 ;
VALVE3D valve_3 on channel_11 componentSpacing=1000.0 valveRadius=1200 gap=600 depth=250 rotation=0.0 ;
VALVE3D valve_4 on channel_11 componentSpacing=1000.0 valveRadius=1200 gap=600 depth=250 rotation=0.0 ;
VALVE3D valve_5 on channel_11 componentSpacing=1000.0 valveRadius=1200 gap=600 depth=250 rotation=0.0 ;
VALVE3D valve_6 on channel_11 componentSpacing=1000.0 valveRadius=1200 gap=600 depth=250 rotation=0.0 ;
VALVE3D valve_7 on channel_11 componentSpacing=1000.0 valveRadius=1200 gap=600 depth=250 rotation=0.0 ;
VALVE3D valve_8 on channel_11 componentSpacing=1000.0 valveRadius=1200 gap=600 depth=250 rotation=0.0 ;

CHANNEL Ctrlchannel_0 from Cport_0 1 to valve_0 1 RoundedChannel=1 channelWidth=600 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 width=600  ;
CHANNEL Ctrlchannel_1 from Cport_1 1 to valve_1 1 RoundedChannel=1 channelWidth=600 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 width=600  ;
CHANNEL Ctrlchannel_2 from Cport_2 1 to valve_2 1 RoundedChannel=1 channelWidth=600 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 width=600  ;
CHANNEL Ctrlchannel_3 from Cport_3 1 to valve_3 1 RoundedChannel=1 channelWidth=600 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 width=600  ;
CHANNEL Ctrlchannel_4 from Cport_4 1 to valve_4 1 RoundedChannel=1 channelWidth=600 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 width=600  ;
CHANNEL Ctrlchannel_5 from Cport_5 1 to valve_5 1 RoundedChannel=1 channelWidth=600 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 width=600  ;
CHANNEL Ctrlchannel_6 from Cport_6 1 to valve_6 1 RoundedChannel=1 channelWidth=600 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 width=600  ;
CHANNEL Ctrlchannel_7 from Cport_7 1 to valve_7 1 RoundedChannel=1 channelWidth=600 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 width=600  ;
CHANNEL Ctrlchannel_8 from Cport_8 1 to valve_8 1 RoundedChannel=1 channelWidth=600 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 width=600  ;

 

END LAYER

