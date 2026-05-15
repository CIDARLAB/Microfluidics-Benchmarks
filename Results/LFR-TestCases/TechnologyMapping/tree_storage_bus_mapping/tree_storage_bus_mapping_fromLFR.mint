# Please add default length and width to reaction chamber component
DEVICE tree_storage_bus_mapping



LAYER FLOW 

YTREE ytree_1 flowChannelWidth=5 spacing=5 width=5 height=5 stageLength=5 componentSpacing=1000.0 rotation=0.0 in=1.0 out=8.0 mirrorByX=0.0 mirrorByY=0.0;
YTREE ytree_2 flowChannelWidth=5 spacing=5 width=5 height=5 stageLength=5 componentSpacing=1000.0 rotation=0.0 in=1.0 out=8.0 mirrorByX=0.0 mirrorByY=0.0;
REACTION CHAMBER reaction_chamber_1 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_1 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
REACTION CHAMBER reaction_chamber_2 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
REACTION CHAMBER reaction_chamber_3 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
REACTION CHAMBER reaction_chamber_4 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
REACTION CHAMBER reaction_chamber_5 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
REACTION CHAMBER reaction_chamber_6 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
REACTION CHAMBER reaction_chamber_7 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
REACTION CHAMBER reaction_chamber_8 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_2 componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from ytree_1 1 to ytree_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_2 from ytree_1 1 to reaction_chamber_1 2 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_3 from ytree_1 1 to reaction_chamber_2 2 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_4 from ytree_1 1 to reaction_chamber_3 2 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_5 from ytree_1 1 to reaction_chamber_4 2 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_6 from ytree_1 1 to reaction_chamber_5 2 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_7 from ytree_1 1 to reaction_chamber_6 2 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_8 from ytree_1 1 to reaction_chamber_7 2 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_9 from ytree_1 1 to reaction_chamber_8 2 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_10 from ytree_1 1 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_11 from ytree_2 9 to reaction_chamber_1 2 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_12 from ytree_2 9 to reaction_chamber_2 2 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_13 from ytree_2 9 to reaction_chamber_3 2 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_14 from ytree_2 9 to reaction_chamber_4 2 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_15 from ytree_2 9 to reaction_chamber_5 2 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_16 from ytree_2 9 to reaction_chamber_6 2 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_17 from ytree_2 9 to reaction_chamber_7 2 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_18 from ytree_2 9 to reaction_chamber_8 2 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_19 from ytree_2 9 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_20 from ytree_2 9 to port_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_21 from reaction_chamber_1 4 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_22 from reaction_chamber_2 4 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_23 from reaction_chamber_3 4 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_24 from reaction_chamber_4 4 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_25 from reaction_chamber_5 4 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_26 from reaction_chamber_6 4 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_27 from reaction_chamber_7 4 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_28 from reaction_chamber_8 4 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_29 from port_2 1 to ytree_1 9 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_30 from port_2 1 to reaction_chamber_1 2 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_31 from port_2 1 to reaction_chamber_2 2 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_32 from port_2 1 to reaction_chamber_3 2 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_33 from port_2 1 to reaction_chamber_4 2 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_34 from port_2 1 to reaction_chamber_5 2 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_35 from port_2 1 to reaction_chamber_6 2 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_36 from port_2 1 to reaction_chamber_7 2 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_37 from port_2 1 to reaction_chamber_8 2 connectionSpacing=1000 channelWidth=400;

 

END LAYER

