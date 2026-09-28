DEVICE Device_4_Molecular_Diagnostics



LAYER FLOW 

DIYCOMPONENT diycomponent_1 length=8000.0 width=6000.0 height=250.0 componentSpacing=2000.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
DIYCOMPONENT diycomponent_2 length=8000.0 width=6000.0 height=250.0 componentSpacing=2000.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
NODE node_1 componentSpacing=1000.0 height=100.0 radius=0.0 ;
MIXER mixer_1 componentSpacing=1000.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=1.0 rotation=0.0 bendLength=2000.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
PORT port_1 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT port_2 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT port_3 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT port_4 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT port_5 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;



CHANNEL channel_1 from node_1 1 to diycomponent_1 3 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_2 from diycomponent_1 1 to port_4 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_3 from diycomponent_1 1 to port_5 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_4 from node_1 1 to diycomponent_2 3 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_5 from diycomponent_2 1 to port_3 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_6 from mixer_1 2 to node_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_7 from port_2 1 to node_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_8 from port_1 1 to mixer_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;

 

END LAYER

