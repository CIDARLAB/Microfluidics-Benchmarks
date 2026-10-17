DEVICE One_To_One



LAYER FLOW 

PORT port_1 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
PORT port_2 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;



CHANNEL channel_1 from port_1 1 to port_2 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;

 

END LAYER

LAYER CONTROL 

PORT Cport_0 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;

VALVE3D valve_0 on channel_1 componentSpacing=1000.0 valveRadius=1200 gap=600 depth=250 rotation=0.0 ;

CHANNEL Ctrlchannel_0 from Cport_0 1 to valve_0 1 RoundedChannel=1 channelWidth=600 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 width=600  ;

 

END LAYER

