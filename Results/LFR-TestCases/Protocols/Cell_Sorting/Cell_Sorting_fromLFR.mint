DEVICE Cell_Sorting



LAYER FLOW 

PORT port_1 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_2 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_3 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_4 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;



CHANNEL channel_1 from port_4 1 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_2 from port_4 1 to port_2 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_3 from port_4 1 to port_3 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;

 

END LAYER

