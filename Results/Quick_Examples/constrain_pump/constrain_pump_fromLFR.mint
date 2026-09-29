DEVICE constrain_pump



LAYER FLOW 

PUMP pump_1 valveWidthY=800.0 componentSpacing=2000.0 rotation=0.0 width=1600.0 length=800.0 height=250.0 spacing=2000.0 flowChannelWidth=600.0 mirrorByX=0.0 mirrorByY=0.0 valveWidthX=1600.0 ;
PORT port_1 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT port_2 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;



CHANNEL channel_1 from pump_1 2 to port_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_2 from port_2 1 to pump_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;

 

END LAYER

LAYER CONTROL 

PORT cp1 portRadius=1000 componentSpacing=2000.0 height=1100.0 ;
PORT cp2 portRadius=1000 componentSpacing=2000.0 height=1100.0 ;
PORT cp3 portRadius=1000 componentSpacing=2000.0 height=1100.0 ;



CHANNEL cc1 from cp1 1 to pump_1 3 RoundedChannel=1 channelWidth=200.0 connectionSpacing=1000 width=200.0  ;
CHANNEL cc2 from cp2 1 to pump_1 4 RoundedChannel=1 channelWidth=200.0 connectionSpacing=1000 width=200.0  ;
CHANNEL cc3 from cp3 1 to pump_1 5 RoundedChannel=1 channelWidth=200.0 connectionSpacing=1000 width=200.0  ;

 

END LAYER

