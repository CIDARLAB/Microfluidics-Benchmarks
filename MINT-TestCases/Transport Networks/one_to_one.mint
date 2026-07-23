DEVICE one_to_one



LAYER FLOW 

PORT port_1 componentSpacing=9000 ;
PORT port_2 componentSpacing=9000 ;



CHANNEL channel_1 from port_1 1 to port_2 1 connectionSpacing=1000 channelWidth=400  ;

 

END LAYER

LAYER CONTROL 

PORT Cport_0 componentSpacing=9000 ;

VALVE3D valve_0 on channel_1 controlPort=Cport_0 componentSpacing=1000 valveRadius=400 height=250 ;

CHANNEL Ctrlchannel_0 from Cport_0 1 to valve_0 1 connectionSpacing=1000 channelWidth=400  ;

 

END LAYER

