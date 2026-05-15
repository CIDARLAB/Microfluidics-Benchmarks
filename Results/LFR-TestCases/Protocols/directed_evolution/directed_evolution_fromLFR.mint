# Please add default length and width to reaction chamber component
DEVICE directed_evolution



LAYER FLOW 

REACTION CHAMBER reaction_chamber_1 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
REACTION CHAMBER reaction_chamber_2 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_1 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
REACTION CHAMBER reaction_chamber_3 componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_1 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
DROPLET SPLITTER droplet_splitter_1 componentSpacing=1000.0 rotation=0.0 height=250.0 inletWidth=2000.0 inletLength=6000.0 outletWidth1=1000.0 outletLength1=3000.0 outletWidth2=2000.0 outletLength2=3000.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_2 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_3 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_4 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_5 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_2 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_3 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_4 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_5 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_6 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_7 componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from reaction_chamber_2 4 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_2 from reaction_chamber_3 4 to mixer_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_3 from mixer_2 2 to mixer_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_4 from mixer_5 2 to mixer_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_5 from mixer_4 2 to droplet_splitter_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_6 from mixer_1 2 to reaction_chamber_2 2 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_7 from mixer_3 2 to mixer_4 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_8 from port_2 1 to mixer_4 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_9 from port_5 1 to mixer_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_10 from port_6 1 to mixer_5 1 connectionSpacing=1000 channelWidth=400;

 

END LAYER

LAYER CONTROL 







 

END LAYER

