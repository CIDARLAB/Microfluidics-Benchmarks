DEVICE Tree_Storage_Bus_Mapping



LAYER FLOW 

YTREE ytree_1 flowChannelWidth=5 spacing=5 width=5 height=5 stageLength=5 componentSpacing=1000.0 rotation=0.0 in=1.0 out=8.0 mirrorByX=0.0 mirrorByY=0.0 ;
YTREE ytree_2 flowChannelWidth=5 spacing=5 width=5 height=5 stageLength=5 componentSpacing=1000.0 rotation=0.0 in=1.0 out=8.0 mirrorByX=0.0 mirrorByY=0.0 ;
REACTION CHAMBER reaction_chamber_1 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
PORT port_1 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;
REACTION CHAMBER reaction_chamber_2 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
REACTION CHAMBER reaction_chamber_3 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
REACTION CHAMBER reaction_chamber_4 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
REACTION CHAMBER reaction_chamber_5 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
REACTION CHAMBER reaction_chamber_6 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
REACTION CHAMBER reaction_chamber_7 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
REACTION CHAMBER reaction_chamber_8 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
REACTION CHAMBER reaction_chamber_9 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
REACTION CHAMBER reaction_chamber_10 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
REACTION CHAMBER reaction_chamber_11 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
REACTION CHAMBER reaction_chamber_12 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
REACTION CHAMBER reaction_chamber_13 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
REACTION CHAMBER reaction_chamber_14 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
REACTION CHAMBER reaction_chamber_15 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
REACTION CHAMBER reaction_chamber_16 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
PORT port_2 componentSpacing=1000.0 portRadius=1000.0 height=1100.0 ;



CHANNEL channel_1 from ytree_1 1 to ytree_2 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_2 from ytree_1 1 to reaction_chamber_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_3 from ytree_1 1 to reaction_chamber_3 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_4 from ytree_1 1 to reaction_chamber_5 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_5 from ytree_1 1 to reaction_chamber_7 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_6 from ytree_1 1 to reaction_chamber_9 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_7 from ytree_1 1 to reaction_chamber_11 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_8 from ytree_1 1 to reaction_chamber_13 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_9 from ytree_1 1 to reaction_chamber_15 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_10 from ytree_1 1 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_11 from ytree_1 1 to reaction_chamber_16 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_12 from ytree_1 1 to reaction_chamber_14 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_13 from ytree_1 1 to reaction_chamber_12 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_14 from ytree_1 1 to reaction_chamber_10 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_15 from ytree_1 1 to reaction_chamber_8 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_16 from ytree_1 1 to reaction_chamber_6 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_17 from ytree_1 1 to reaction_chamber_4 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_18 from ytree_1 1 to reaction_chamber_2 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_19 from ytree_2 9 to reaction_chamber_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_20 from ytree_2 9 to reaction_chamber_3 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_21 from ytree_2 9 to reaction_chamber_5 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_22 from ytree_2 9 to reaction_chamber_7 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_23 from ytree_2 9 to reaction_chamber_9 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_24 from ytree_2 9 to reaction_chamber_11 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_25 from ytree_2 9 to reaction_chamber_13 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_26 from ytree_2 9 to reaction_chamber_15 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_27 from ytree_2 9 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_28 from ytree_2 9 to port_2 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_29 from ytree_2 9 to reaction_chamber_16 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_30 from ytree_2 9 to reaction_chamber_14 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_31 from ytree_2 9 to reaction_chamber_12 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_32 from ytree_2 9 to reaction_chamber_10 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_33 from ytree_2 9 to reaction_chamber_8 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_34 from ytree_2 9 to reaction_chamber_6 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_35 from ytree_2 9 to reaction_chamber_4 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_36 from ytree_2 9 to reaction_chamber_2 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_37 from reaction_chamber_1 3 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_38 from reaction_chamber_1 3 to reaction_chamber_2 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_39 from reaction_chamber_3 3 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_40 from reaction_chamber_3 3 to reaction_chamber_4 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_41 from reaction_chamber_5 3 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_42 from reaction_chamber_5 3 to reaction_chamber_6 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_43 from reaction_chamber_7 3 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_44 from reaction_chamber_7 3 to reaction_chamber_8 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_45 from reaction_chamber_9 3 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_46 from reaction_chamber_9 3 to reaction_chamber_10 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_47 from reaction_chamber_11 3 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_48 from reaction_chamber_11 3 to reaction_chamber_12 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_49 from reaction_chamber_13 3 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_50 from reaction_chamber_13 3 to reaction_chamber_14 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_51 from reaction_chamber_15 3 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_52 from reaction_chamber_15 3 to reaction_chamber_16 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_53 from port_2 1 to ytree_1 9 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_54 from port_2 1 to reaction_chamber_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_55 from port_2 1 to reaction_chamber_3 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_56 from port_2 1 to reaction_chamber_5 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_57 from port_2 1 to reaction_chamber_7 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_58 from port_2 1 to reaction_chamber_9 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_59 from port_2 1 to reaction_chamber_11 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_60 from port_2 1 to reaction_chamber_13 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_61 from port_2 1 to reaction_chamber_15 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_62 from port_2 1 to reaction_chamber_16 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_63 from port_2 1 to reaction_chamber_14 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_64 from port_2 1 to reaction_chamber_12 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_65 from port_2 1 to reaction_chamber_10 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_66 from port_2 1 to reaction_chamber_8 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_67 from port_2 1 to reaction_chamber_6 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_68 from port_2 1 to reaction_chamber_4 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_69 from port_2 1 to reaction_chamber_2 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_70 from reaction_chamber_16 3 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_71 from reaction_chamber_14 3 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_72 from reaction_chamber_12 3 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_73 from reaction_chamber_10 3 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_74 from reaction_chamber_8 3 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_75 from reaction_chamber_6 3 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_76 from reaction_chamber_4 3 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;
CHANNEL channel_77 from reaction_chamber_2 3 to port_1 1 crossSection=1 connectionSpacing=1000 channelWidth=600  ;

 

END LAYER

