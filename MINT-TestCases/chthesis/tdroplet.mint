# Please add default length and width to reaction chamber component
DEVICE tdroplet



LAYER FLOW 

MIXER mixer_1 componentSpacing=9000 ;
REACTION CHAMBER reaction_chamber_1 componentSpacing=9000 ;
MIXER mixer_2 componentSpacing=9000 ;
PORT port_1 portRadius=2000 componentSpacing=9000 ;
PORT port_2 portRadius=2000 componentSpacing=9000 ;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1 componentSpacing=9000 ;
PORT port_3 portRadius=2000 componentSpacing=9000 ;
PORT port_4 portRadius=2000 componentSpacing=9000 ;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_2 componentSpacing=9000 ;
PORT port_5 componentSpacing=9000 ;
PORT port_6 componentSpacing=9000 ;
PORT port_7 componentSpacing=9000 ;



CHANNEL channel_1 from port_1 1 to nozzle_droplet_generator_1 2 channelWidth=400 connectionSpacing=1000  ;
CHANNEL channel_2 from port_2 1 to nozzle_droplet_generator_1 4 channelWidth=400 connectionSpacing=1000  ;
CHANNEL channel_3 from port_3 1 to nozzle_droplet_generator_2 2 channelWidth=400 connectionSpacing=1000  ;
CHANNEL channel_4 from port_4 1 to nozzle_droplet_generator_2 4 channelWidth=400 connectionSpacing=1000  ;
CHANNEL channel_5 from mixer_1 2 to reaction_chamber_1 2 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_6 from mixer_2 2 to reaction_chamber_1 2 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_7 from nozzle_droplet_generator_1 3 to mixer_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_8 from nozzle_droplet_generator_2 3 to mixer_2 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_9 from port_6 1 to nozzle_droplet_generator_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_10 from port_7 1 to nozzle_droplet_generator_2 1 connectionSpacing=1000 channelWidth=400  ;

 

END LAYER

LAYER CONTROL 

PORT Cport_0 componentSpacing=9000 ;
PORT Cport_1 componentSpacing=9000 ;

VALVE3D valve_0 on channel_6 controlPort=Cport_0 componentSpacing=1000 valveRadius=400 height=250 ;
VALVE3D valve_1 on channel_5 controlPort=Cport_1 componentSpacing=1000 valveRadius=400 height=250 ;

CHANNEL Ctrlchannel_0 from Cport_0 1 to valve_0 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL Ctrlchannel_1 from Cport_1 1 to valve_1 1 connectionSpacing=1000 channelWidth=400  ;

 

END LAYER

