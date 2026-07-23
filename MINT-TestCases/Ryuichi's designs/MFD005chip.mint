# Please add default length and width to reaction chamber component
DEVICE mfd005chip



LAYER FLOW 

REACTION CHAMBER reaction_chamber_1 componentSpacing=9000 ;
REACTION CHAMBER reaction_chamber_2 componentSpacing=9000 ;
PORT port_1 componentSpacing=9000 ;
REACTION CHAMBER reaction_chamber_3 componentSpacing=9000 ;
DROPLET CAPACITANCE SENSOR droplet_capacitance_sensor_1 componentSpacing=9000 ;
MIXER mixer_1 componentSpacing=9000 ;
MIXER mixer_2 componentSpacing=9000 ;
MIXER mixer_3 componentSpacing=9000 ;
MIXER mixer_4 componentSpacing=9000 ;
PORT port_2 componentSpacing=9000 ;
PORT port_3 componentSpacing=9000 ;
PORT port_4 componentSpacing=9000 ;
PORT port_5 componentSpacing=9000 ;



CHANNEL channel_1 from reaction_chamber_2 4 to port_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_2 from mixer_1 2 to port_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_3 from port_4 1 to mixer_3 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_4 from port_5 1 to mixer_2 1 connectionSpacing=1000 channelWidth=400  ;

 

END LAYER

