DEVICE test_DIY_crossing



LAYER FLOW 

DIYCOMPONENT diycomponent_1 componentSpacing=1000.0 length=10000.0 width=10000.0 height=2000.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
PORT port_1 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_2 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_3 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_4 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;



CHANNEL channel_1 from diycomponent_1 4 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_2 from diycomponent_1 2 to port_2 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_3 from port_3 1 to diycomponent_1 3 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_4 from port_4 1 to diycomponent_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;

 

END LAYER

