DEVICE tree_fanout_mapping2



LAYER FLOW 

YTREE ytree_1 flowChannelWidth=5 spacing=5 leafs=5 width=5 height=5 stageLength=5 componentSpacing=9000 ;
PORT port_1 componentSpacing=9000 ;
PORT port_2 componentSpacing=9000 ;
PORT port_3 componentSpacing=9000 ;
PORT port_4 componentSpacing=9000 ;
PORT port_5 componentSpacing=9000 ;
PORT port_6 componentSpacing=9000 ;
PORT port_7 componentSpacing=9000 ;
PORT port_8 componentSpacing=9000 ;
PORT port_9 componentSpacing=9000 ;



CHANNEL channel_1 from ytree_1 9 to port_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_2 from ytree_1 9 to port_2 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_3 from ytree_1 9 to port_3 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_4 from ytree_1 9 to port_4 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_5 from ytree_1 9 to port_5 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_6 from ytree_1 9 to port_6 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_7 from ytree_1 9 to port_7 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_8 from ytree_1 9 to port_8 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_9 from port_9 1 to ytree_1 1 connectionSpacing=1000 channelWidth=400  ;

 

END LAYER

