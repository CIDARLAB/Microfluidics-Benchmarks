DEVICE dropletgenerator2



LAYER FLOW 

PORT port_1 componentSpacing=9000 ;
PORT port_2 componentSpacing=9000 ;
PORT port_3 componentSpacing=9000 ;
PORT port_4 componentSpacing=9000 ;
PORT port_5 componentSpacing=9000 ;
PORT port_6 componentSpacing=9000 ;
PORT port_7 componentSpacing=9000 ;



CHANNEL channel_1 from port_5 1 to port_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_2 from port_7 1 to port_3 1 connectionSpacing=1000 channelWidth=400  ;

 

END LAYER

