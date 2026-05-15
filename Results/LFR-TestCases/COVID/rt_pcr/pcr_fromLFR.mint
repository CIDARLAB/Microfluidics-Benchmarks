# Please add default length and width to reaction chamber component
DEVICE pcr



LAYER FLOW 

REACTION CHAMBER reaction_chamber_1 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_1 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
REACTION CHAMBER reaction_chamber_2 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_2 componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from reaction_chamber_1 4 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_2 from reaction_chamber_2 4 to reaction_chamber_1 2 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_3 from port_2 1 to reaction_chamber_2 2 connectionSpacing=1000 channelWidth=400;

 

END LAYER

