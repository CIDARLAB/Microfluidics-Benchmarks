DEVICE Device_5_Bacteria_Diagnostics



LAYER FLOW 

MIXER mixer_1 componentSpacing=1000.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 rotation=0.0 bendLength=2000.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_2 componentSpacing=1000.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 rotation=0.0 bendLength=2000.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
PORT port_1 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT port_2 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT port_3 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT port_4 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;



CHANNEL channel_1 from mixer_2 2 to mixer_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_2 from mixer_1 2 to port_3 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_3 from port_4 1 to mixer_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_4 from port_1 1 to mixer_2 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_5 from port_2 1 to mixer_2 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;

 

END LAYER

LAYER CONTROL 

PORT Cport_0 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_1 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;

VALVE3D valve_0 on channel_2 componentSpacing=1000.0 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_1 on channel_2 componentSpacing=1000.0 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;

CHANNEL Ctrlchannel_0 from Cport_0 1 to valve_0 1 RoundedChannel=1 channelWidth=600 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 width=600  ;
CHANNEL Ctrlchannel_1 from Cport_1 1 to valve_1 1 RoundedChannel=1 channelWidth=600 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 width=600  ;

 

END LAYER

