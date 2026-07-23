DEVICE cell_sorting



LAYER FLOW 

PORT port_1 componentSpacing=9000 ;
PORT port_2 componentSpacing=9000 ;
PORT port_3 componentSpacing=9000 ;
PORT port_4 componentSpacing=9000 ;



CHANNEL channel_1 from port_4 1 to port_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_2 from port_4 1 to port_2 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_3 from port_4 1 to port_3 1 connectionSpacing=1000 channelWidth=400  ;

 

END LAYER

