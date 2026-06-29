# Please add default length and width to reaction chamber component
DEVICE device7_enzyme_screening



LAYER flow

REACTION CHAMBER reaction_chamber_1componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_1componentSpacing=1000.0 portRadius=700.0 height=1100.0;
REACTION CHAMBER reaction_chamber_2componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
REACTION CHAMBER reaction_chamber_3componentSpacing=1000.0 width=5000.0 length=5000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
DROPLET CAPACITANCE SENSOR droplet_capacitance_sensor_1componentSpacing=1000.0 rotation=0.0 height=250.0 inletWidth=1000.0 inletLength=10000.0 electrodeWidth=1500.0 electrodeLength=4000.0 electrodeDistance=2000.0 sensorWidth=1000.0 sensorLength=3000.0 channelDepth=1000.0 electrodeDepth=1000.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_2componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_3componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_4componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_5componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_6componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_7componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_8componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_9componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from reaction_chamber_1 4 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_2 from reaction_chamber_2 4 to reaction_chamber_1 2 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_3 from port_3 1 to reaction_chamber_3 2 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_4 from port_5 1 to droplet_capacitance_sensor_1 1 connectionSpacing=1000 channelWidth=400;

 

END layer

LAYER control







 

END layer

