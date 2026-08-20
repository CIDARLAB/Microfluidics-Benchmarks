DEVICE Multi_Input



LAYER FLOW 

MIXER mixer_1 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
MIXER mixer_2 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
PORT port_1 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
MIXER mixer_3 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
MIXER mixer_4 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
MIXER mixer_5 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
MIXER mixer_6 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
MIXER mixer_7 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
MIXER mixer_8 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
MIXER mixer_9 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
MIXER mixer_10 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 ;
PORT port_2 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_3 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_4 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_5 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_6 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_7 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;



CHANNEL channel_1 from mixer_1 2 to mixer_2 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_2 from mixer_3 2 to mixer_1 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_3 from mixer_4 2 to mixer_3 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_4 from mixer_5 2 to mixer_6 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_5 from mixer_7 2 to mixer_8 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_6 from mixer_10 2 to mixer_4 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_7 from mixer_9 2 to mixer_5 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_8 from mixer_2 2 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_9 from mixer_8 2 to mixer_9 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_10 from mixer_6 2 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_11 from port_2 1 to mixer_2 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_12 from port_2 1 to mixer_6 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_13 from port_3 1 to mixer_7 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_14 from port_3 1 to mixer_10 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_15 from port_4 1 to mixer_1 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_16 from port_4 1 to mixer_5 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_17 from port_5 1 to mixer_4 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_18 from port_5 1 to mixer_8 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_19 from port_6 1 to mixer_3 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_20 from port_6 1 to mixer_9 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_21 from port_7 1 to mixer_7 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL channel_22 from port_7 1 to mixer_10 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;

 

END LAYER

LAYER CONTROL 

PORT Cport_0 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_1 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_2 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;

VALVE3D valve_0 on channel_10 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;

CHANNEL Ctrlchannel_0 from Cport_0 1 to valve_0 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL Ctrlchannel_1 from Cport_1 1 to valve_0 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;
CHANNEL Ctrlchannel_2 from Cport_2 1 to valve_0 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;

 

END LAYER

