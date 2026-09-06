DEVICE diy_with_mixer_demo



LAYER FLOW 

DIYCOMPONENT diycomponent_1 componentSpacing=1000.0 length=12000.0 width=6000.0 height=1500.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
PORT port_1 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
MIXER mixer_1 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
PORT port_2 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_3 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;



CHANNEL channel_1 from diycomponent_1 3 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_2 from mixer_1 2 to diycomponent_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_3 from port_2 1 to mixer_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_4 from port_3 1 to mixer_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;

 

END LAYER

