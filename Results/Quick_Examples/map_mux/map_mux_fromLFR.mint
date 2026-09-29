DEVICE map_mux



LAYER FLOW 

MUX mux_1 in=1.0 out=4.0 flowChannelWidth=600.0 controlChannelWidth=600.0 leafSpace=4000.0 width=1800.0 valveWidthY=1000.0 length=1000.0 stageSpace=6000.0 height=250.0 componentSpacing=1000.0 valveWidthX=1800.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 valveWidth=1800.0 ;
PORT port_1 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT port_2 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT port_3 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT port_4 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT port_5 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;



CHANNEL channel_1 from mux_1 2 to port_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_2 from mux_1 5 to port_2 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_3 from mux_1 4 to port_3 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_4 from port_4 1 to mux_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_5 from mux_1 3 to port_5 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;

 

END LAYER

LAYER CONTROL 

PORT cp1 portRadius=1000 componentSpacing=2000.0 height=1100.0 ;
PORT cp2 portRadius=1000 componentSpacing=2000.0 height=1100.0 ;
PORT cp3 portRadius=1000 componentSpacing=2000.0 height=1100.0 ;
PORT cp4 portRadius=1000 componentSpacing=2000.0 height=1100.0 ;



CHANNEL cc1 from cp1 1 to mux_1 6 RoundedChannel=1 channelWidth=600.0 connectionSpacing=1000 width=600.0  ;
CHANNEL cc2 from cp2 1 to mux_1 7 RoundedChannel=1 channelWidth=600.0 connectionSpacing=1000 width=600.0  ;
CHANNEL cc3 from cp3 1 to mux_1 8 RoundedChannel=1 channelWidth=600.0 connectionSpacing=1000 width=600.0  ;
CHANNEL cc4 from cp4 1 to mux_1 9 RoundedChannel=1 channelWidth=600.0 connectionSpacing=1000 width=600.0  ;

 

END LAYER

