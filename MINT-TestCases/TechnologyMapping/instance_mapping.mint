DEVICE instance_mapping



LAYER FLOW 

MIXER mixer_1 componentSpacing=9000 ;
PORT port_1 componentSpacing=9000 ;
PORT port_2 componentSpacing=9000 ;



CHANNEL channel_1 from mixer_1 2 to port_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_2 from port_2 1 to mixer_1 1 connectionSpacing=1000 channelWidth=400  ;

 

END LAYER

