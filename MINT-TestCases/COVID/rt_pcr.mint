# Please add default length and width to reaction chamber component
DEVICE rt_pcr



LAYER FLOW 

REACTION CHAMBER reaction_chamber_1 componentSpacing=9000 ;
PORT port_1 componentSpacing=9000 ;
REACTION CHAMBER reaction_chamber_2 componentSpacing=9000 ;
PORT port_2 componentSpacing=9000 ;



CHANNEL channel_1 from reaction_chamber_1 4 to port_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_2 from reaction_chamber_2 4 to reaction_chamber_1 2 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_3 from port_2 1 to reaction_chamber_2 2 connectionSpacing=1000 channelWidth=400  ;

 

END LAYER

