DEVICE One_To_One



LAYER FLOW 

PORT port_1 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
PORT port_2 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;



CHANNEL channel_1 from port_1 1 to port_2 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;

 

END LAYER

LAYER CONTROL 

PORT Cport_0 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;

VALVE3D valve_0 on channel_1 componentSpacing=1000 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;

CHANNEL Ctrlchannel_0 from Cport_0 1 to valve_0 1 crossSection=1 connectionSpacing=1000 channelWidth=800  ;

 

END LAYER

