DEVICE Tree_Storage_Bus_Mapping



LAYER FLOW 

YTREE ytree_1 in=8.0 out=1.0 flowChannelWidth=600.0 leafSpace=4000.0 stageSpace=4000.0 depth=250.0 componentSpacing=1000.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
YTREE ytree_2 in=1.0 out=8.0 flowChannelWidth=600.0 leafSpace=4000.0 stageSpace=4000.0 depth=250.0 componentSpacing=1000.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
REACTION CHAMBER reaction_chamber_1 componentSpacing=2000.0 width=5000.0 length=5000.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 ;
REACTION CHAMBER reaction_chamber_2 componentSpacing=2000.0 width=5000.0 length=5000.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 ;
REACTION CHAMBER reaction_chamber_3 componentSpacing=2000.0 width=5000.0 length=5000.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 ;
REACTION CHAMBER reaction_chamber_4 componentSpacing=2000.0 width=5000.0 length=5000.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 ;
REACTION CHAMBER reaction_chamber_5 componentSpacing=2000.0 width=5000.0 length=5000.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 ;
REACTION CHAMBER reaction_chamber_6 componentSpacing=2000.0 width=5000.0 length=5000.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 ;
REACTION CHAMBER reaction_chamber_7 componentSpacing=2000.0 width=5000.0 length=5000.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 ;
REACTION CHAMBER reaction_chamber_8 componentSpacing=2000.0 width=5000.0 length=5000.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 ;
REACTION CHAMBER reaction_chamber_9 componentSpacing=2000.0 width=5000.0 length=5000.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 ;
REACTION CHAMBER reaction_chamber_10 componentSpacing=2000.0 width=5000.0 length=5000.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 ;
REACTION CHAMBER reaction_chamber_11 componentSpacing=2000.0 width=5000.0 length=5000.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 ;
REACTION CHAMBER reaction_chamber_12 componentSpacing=2000.0 width=5000.0 length=5000.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 ;
REACTION CHAMBER reaction_chamber_13 componentSpacing=2000.0 width=5000.0 length=5000.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 ;
REACTION CHAMBER reaction_chamber_14 componentSpacing=2000.0 width=5000.0 length=5000.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 ;
REACTION CHAMBER reaction_chamber_15 componentSpacing=2000.0 width=5000.0 length=5000.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 ;
REACTION CHAMBER reaction_chamber_16 componentSpacing=2000.0 width=5000.0 length=5000.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 depth=250.0 ;
PORT port_1 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
PORT port_2 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;



CHANNEL channel_1 from ytree_2 2 to ytree_1 2 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_2 from reaction_chamber_1 3 to ytree_1 9 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_3 from reaction_chamber_3 3 to ytree_1 8 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_4 from reaction_chamber_5 3 to ytree_1 7 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_5 from reaction_chamber_7 3 to ytree_1 6 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_6 from reaction_chamber_9 3 to ytree_1 5 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_7 from reaction_chamber_11 3 to ytree_1 4 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_8 from reaction_chamber_13 3 to ytree_1 3 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_9 from reaction_chamber_15 3 to ytree_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_10 from ytree_1 1 to port_2 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_11 from reaction_chamber_16 3 to ytree_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_12 from reaction_chamber_14 3 to ytree_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_13 from reaction_chamber_12 3 to ytree_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_14 from reaction_chamber_10 3 to ytree_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_15 from reaction_chamber_8 3 to ytree_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_16 from reaction_chamber_6 3 to ytree_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_17 from reaction_chamber_4 3 to ytree_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_18 from reaction_chamber_2 3 to ytree_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_19 from ytree_2 9 to reaction_chamber_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_20 from ytree_2 8 to reaction_chamber_3 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_21 from ytree_2 7 to reaction_chamber_5 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_22 from ytree_2 6 to reaction_chamber_7 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_23 from ytree_2 5 to reaction_chamber_9 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_24 from ytree_2 4 to reaction_chamber_11 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_25 from ytree_2 3 to reaction_chamber_13 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_26 from ytree_2 1 to reaction_chamber_15 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_27 from port_1 1 to ytree_2 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_28 from ytree_2 1 to reaction_chamber_16 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_29 from ytree_2 1 to reaction_chamber_14 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_30 from ytree_2 1 to reaction_chamber_12 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_31 from ytree_2 1 to reaction_chamber_10 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_32 from ytree_2 1 to reaction_chamber_8 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_33 from ytree_2 1 to reaction_chamber_6 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_34 from ytree_2 1 to reaction_chamber_4 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_35 from ytree_2 1 to reaction_chamber_2 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_36 from reaction_chamber_1 3 to reaction_chamber_2 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_37 from reaction_chamber_3 3 to reaction_chamber_4 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_38 from reaction_chamber_5 3 to reaction_chamber_6 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_39 from reaction_chamber_7 3 to reaction_chamber_8 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_40 from reaction_chamber_9 3 to reaction_chamber_10 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_41 from reaction_chamber_11 3 to reaction_chamber_12 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_42 from reaction_chamber_13 3 to reaction_chamber_14 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_43 from reaction_chamber_15 3 to reaction_chamber_16 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;

 

END LAYER

