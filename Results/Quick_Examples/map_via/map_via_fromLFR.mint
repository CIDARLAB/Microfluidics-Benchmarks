DEVICE map_via



LAYER FLOW 

VIA via_1 componentSpacing=1000.0 radius=700.0 height=0.0 mirrorByX=0.0 mirrorByY=0.0 portRadius=700.0 ;
PORT port_1 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;



CHANNEL channel_1 from port_1 1 to via_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;

 

END LAYER

