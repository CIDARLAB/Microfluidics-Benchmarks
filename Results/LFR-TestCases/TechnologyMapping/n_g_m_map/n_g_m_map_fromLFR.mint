# Please add default length and width to reaction chamber component
DEVICE n_g_m_map



LAYER FLOW 

REACTION CHAMBER reaction_chamber_1 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_1 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_2 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_3 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_4 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_5 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_6 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_7 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_8 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_9 componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from reaction_chamber_1 4 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_2 from reaction_chamber_1 4 to port_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_3 from reaction_chamber_1 4 to port_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_4 from reaction_chamber_1 4 to port_4 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_5 from port_5 1 to reaction_chamber_1 2 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_6 from port_6 1 to reaction_chamber_1 2 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_7 from port_7 1 to reaction_chamber_1 2 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_8 from port_8 1 to reaction_chamber_1 2 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_9 from port_9 1 to reaction_chamber_1 2 connectionSpacing=1000 channelWidth=400;

 

END LAYER

