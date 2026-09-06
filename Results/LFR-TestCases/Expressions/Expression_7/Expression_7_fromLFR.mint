DEVICE Expression_7



LAYER FLOW 

YTREE ytree_1 flowChannelWidth=5 spacing=5 width=5 height=5 stageLength=5 componentSpacing=1000.0 rotation=0.0 in=1.0 out=8.0 mirrorByX=0.0 mirrorByY=0.0 ;
PORT port_1 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
MIXER mixer_1 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_2 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_3 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
PORT port_2 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_3 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_4 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_5 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_6 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_7 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;



CHANNEL channel_1 from ytree_1 1 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_2 from ytree_1 1 to mixer_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_3 from ytree_1 1 to mixer_2 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_4 from ytree_1 1 to mixer_3 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_5 from port_2 1 to ytree_1 4 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_6 from port_2 1 to mixer_2 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_7 from port_3 1 to ytree_1 4 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_8 from port_3 1 to mixer_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_9 from port_4 1 to ytree_1 4 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_10 from port_4 1 to mixer_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_11 from port_5 1 to ytree_1 4 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_12 from port_5 1 to mixer_3 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_13 from port_6 1 to ytree_1 4 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_14 from port_6 1 to mixer_2 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_15 from port_7 1 to ytree_1 4 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_16 from port_7 1 to mixer_3 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_17 from mixer_1 2 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_18 from mixer_2 2 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_19 from mixer_3 2 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;

 

END LAYER

