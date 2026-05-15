DEVICE tree_fanout



LAYER FLOW 

YTREE ytree_1 flowChannelWidth=5 spacing=5 width=5 height=5 stageLength=5 componentSpacing=1000.0 rotation=0.0 in=1.0 out=8.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_1 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_2 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_3 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_4 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_5 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_6 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_7 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_8 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_9 componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from ytree_1 9 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_2 from ytree_1 9 to port_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_3 from ytree_1 9 to port_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_4 from ytree_1 9 to port_4 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_5 from ytree_1 9 to port_5 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_6 from ytree_1 9 to port_6 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_7 from ytree_1 9 to port_7 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_8 from ytree_1 9 to port_8 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_9 from ytree_1 9 to port_9 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_10 from port_8 1 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_11 from port_8 1 to port_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_12 from port_8 1 to port_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_13 from port_8 1 to port_4 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_14 from port_8 1 to port_5 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_15 from port_8 1 to port_6 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_16 from port_8 1 to port_7 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_17 from port_8 1 to port_9 1 connectionSpacing=1000 channelWidth=400;

 

END LAYER

