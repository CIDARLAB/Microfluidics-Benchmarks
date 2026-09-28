DEVICE Device_7_Enzyme_Screening



LAYER FLOW 

REACTION CHAMBER reaction_chamber_1 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
REACTION CHAMBER reaction_chamber_2 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
MIXER mixer_1 componentSpacing=1000.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 rotation=0.0 bendLength=2000.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
PORT port_1 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT port_2 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1 componentSpacing=1000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 height=250.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
MIXER mixer_2 componentSpacing=1000.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 rotation=0.0 bendLength=2000.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_3 componentSpacing=1000.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 rotation=0.0 bendLength=2000.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
PORT port_3 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT port_4 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
MIXER mixer_4 componentSpacing=1000.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 rotation=0.0 bendLength=2000.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_5 componentSpacing=1000.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 rotation=0.0 bendLength=2000.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
PORT port_5 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
MIXER mixer_6 componentSpacing=1000.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 rotation=0.0 bendLength=2000.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_7 componentSpacing=1000.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 rotation=0.0 bendLength=2000.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
PORT port_6 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT port_7 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT port_8 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT port_9 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;



CHANNEL channel_1 from reaction_chamber_2 1 to reaction_chamber_1 3 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_2 from reaction_chamber_1 3 to port_2 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_3 from mixer_1 2 to reaction_chamber_2 3 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_4 from mixer_2 2 to nozzle_droplet_generator_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_5 from nozzle_droplet_generator_1 3 to mixer_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_6 from mixer_4 2 to mixer_5 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_7 from mixer_6 2 to mixer_4 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_8 from port_9 1 to mixer_4 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_9 from mixer_3 2 to mixer_2 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_10 from port_4 1 to mixer_2 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_11 from mixer_5 2 to mixer_3 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_12 from port_5 1 to mixer_5 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_13 from port_3 1 to mixer_3 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_14 from mixer_7 2 to mixer_6 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_15 from port_8 1 to mixer_6 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_16 from port_1 1 to mixer_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_17 from port_6 1 to mixer_7 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_18 from port_7 1 to mixer_7 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;

 

END LAYER

LAYER CONTROL 

PORT Cport_0 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_1 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_2 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_3 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_4 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_5 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_6 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;

VALVE3D valve_0 on channel_17 componentSpacing=1000.0 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_1 on channel_18 componentSpacing=1000.0 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_2 on channel_15 componentSpacing=1000.0 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_3 on channel_8 componentSpacing=1000.0 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_4 on channel_12 componentSpacing=1000.0 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_5 on channel_13 componentSpacing=1000.0 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_6 on channel_10 componentSpacing=1000.0 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;

CHANNEL Ctrlchannel_0 from Cport_0 1 to valve_0 1 RoundedChannel=1 channelWidth=600 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 width=600  ;
CHANNEL Ctrlchannel_1 from Cport_1 1 to valve_1 1 RoundedChannel=1 channelWidth=600 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 width=600  ;
CHANNEL Ctrlchannel_2 from Cport_2 1 to valve_2 1 RoundedChannel=1 channelWidth=600 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 width=600  ;
CHANNEL Ctrlchannel_3 from Cport_3 1 to valve_3 1 RoundedChannel=1 channelWidth=600 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 width=600  ;
CHANNEL Ctrlchannel_4 from Cport_4 1 to valve_4 1 RoundedChannel=1 channelWidth=600 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 width=600  ;
CHANNEL Ctrlchannel_5 from Cport_5 1 to valve_5 1 RoundedChannel=1 channelWidth=600 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 width=600  ;
CHANNEL Ctrlchannel_6 from Cport_6 1 to valve_6 1 RoundedChannel=1 channelWidth=600 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 width=600  ;

 

END LAYER

