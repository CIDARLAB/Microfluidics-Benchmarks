DEVICE mux_04_in



LAYER FLOW 

PORT port_1 componentSpacing=9000 ;
PORT port_2 componentSpacing=9000 ;
PORT port_3 componentSpacing=9000 ;
PORT port_4 componentSpacing=9000 ;
PORT port_5 componentSpacing=9000 ;



CHANNEL channel_1 from port_1 1 to port_2 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_2 from port_3 1 to port_2 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_3 from port_4 1 to port_2 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_4 from port_5 1 to port_2 1 connectionSpacing=1000 channelWidth=400  ;

 

END LAYER

LAYER CONTROL 

PORT Cport_0 componentSpacing=9000 ;
PORT Cport_1 componentSpacing=9000 ;
PORT Cport_2 componentSpacing=9000 ;
PORT Cport_3 componentSpacing=9000 ;

VALVE3D valve_0 on channel_1 controlPort=Cport_0 componentSpacing=1000 valveRadius=400 height=250 ;
VALVE3D valve_1 on channel_4 controlPort=Cport_1 componentSpacing=1000 valveRadius=400 height=250 ;
VALVE3D valve_2 on channel_3 controlPort=Cport_2 componentSpacing=1000 valveRadius=400 height=250 ;
VALVE3D valve_3 on channel_2 controlPort=Cport_3 componentSpacing=1000 valveRadius=400 height=250 ;

CHANNEL Ctrlchannel_0 from Cport_0 1 to valve_0 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL Ctrlchannel_1 from Cport_1 1 to valve_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL Ctrlchannel_2 from Cport_2 1 to valve_2 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL Ctrlchannel_3 from Cport_3 1 to valve_3 1 connectionSpacing=1000 channelWidth=400  ;

 

END LAYER

