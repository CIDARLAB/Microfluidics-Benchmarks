# Please add default length and width to reaction chamber component
DEVICE device7_enzyme_screening



LAYER FLOW 

REACTION CHAMBER reaction_chamber_1 componentSpacing=9000 ;
PORT port_1 componentSpacing=9000 ;
REACTION CHAMBER reaction_chamber_2 componentSpacing=9000 ;
REACTION CHAMBER reaction_chamber_3 componentSpacing=9000 ;
DROPLET CAPACITANCE SENSOR droplet_capacitance_sensor_1 componentSpacing=9000 ;
PORT port_2 componentSpacing=9000 ;
PORT port_3 componentSpacing=9000 ;
PORT port_4 componentSpacing=9000 ;
PORT port_5 componentSpacing=9000 ;
PORT port_6 componentSpacing=9000 ;
PORT port_7 componentSpacing=9000 ;
PORT port_8 componentSpacing=9000 ;
PORT port_9 componentSpacing=9000 ;



CHANNEL channel_1 from reaction_chamber_1 4 to port_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_2 from reaction_chamber_2 4 to reaction_chamber_1 2 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_3 from port_3 1 to droplet_capacitance_sensor_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_4 from port_6 1 to reaction_chamber_3 2 connectionSpacing=1000 channelWidth=400  ;

 

END LAYER

LAYER CONTROL 







 

END LAYER

