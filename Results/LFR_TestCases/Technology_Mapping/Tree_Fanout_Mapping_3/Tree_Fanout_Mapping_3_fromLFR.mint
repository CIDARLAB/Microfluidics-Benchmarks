DEVICE Tree_Fanout_Mapping_3



LAYER FLOW 

YTREE ytree_1 in=1.0 out=8.0 flowChannelWidth=600.0 leafSpace=4000.0 stageSpace=4000.0 depth=250.0 componentSpacing=1000.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
PORT port_1 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
PORT port_2 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
PORT port_3 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
PORT port_4 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
PORT port_5 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
PORT port_6 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
PORT port_7 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
PORT port_8 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
PORT port_9 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;



CHANNEL channel_1 from ytree_1 4 to port_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_2 from ytree_1 6 to port_2 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_3 from port_3 1 to ytree_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_4 from ytree_1 8 to port_4 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_5 from ytree_1 5 to port_5 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_6 from ytree_1 7 to port_6 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_7 from ytree_1 9 to port_7 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_8 from ytree_1 3 to port_8 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_9 from ytree_1 2 to port_9 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;

 

END LAYER

