DEVICE expression1



LAYER FLOW 

PORT port_1 portRadius=2000 componentSpacing=9000 ;
PORT port_2 portRadius=2000 componentSpacing=9000 ;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1 componentSpacing=9000 ;
MIXER mixer_1 componentSpacing=9000 ;
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
CHANNEL channel_5 from nozzle_droplet_generator_1 3 to mixer_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_6 from port_5 1 to nozzle_droplet_generator_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_7 from port_6 1 to nozzle_droplet_generator_2 1 connectionSpacing=1000 channelWidth=400  ;

 

END LAYER

