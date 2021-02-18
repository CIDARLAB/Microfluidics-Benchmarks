DEVICE dx2

LAYER FLOW 

PORT port_1 portRadius=2000 ;
PORT port_2 portRadius=2000 ;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1 ;
PORT port_3 portRadius=2000 ;
PORT port_4 portRadius=2000 ;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_2 ;
PICOINJECTOR picoinjector_1 ;
MIXER mixer_1 ;
DROPLET SORTER droplet_sorter_1 ;
PORT port_5 portRadius=2000 ;
PORT port_6 portRadius=2000 ;
PORT port_7 portRadius=2000 ;
PORT port_8 portRadius=2000 ;

CHANNEL channel_1 from port_1  to nozzle_droplet_generator_1 2 channelWidth=400  ;
CHANNEL channel_2 from port_2  to nozzle_droplet_generator_1 4 channelWidth=400  ;
CHANNEL channel_3 from port_3  to nozzle_droplet_generator_2 2 channelWidth=400  ;
CHANNEL channel_4 from port_4  to nozzle_droplet_generator_2 4 channelWidth=400  ;
CHANNEL channel_5 from port_5  to nozzle_droplet_generator_1 1 channelWidth=400  ;
CHANNEL channel_6 from port_6  to nozzle_droplet_generator_2 1 channelWidth=400  ;
CHANNEL channel_7 from nozzle_droplet_generator_1 3 to picoinjector_1 1 channelWidth=400  ;
CHANNEL channel_8 from nozzle_droplet_generator_2 3 to picoinjector_1 2 channelWidth=400  ;
CHANNEL channel_9 from picoinjector_1 3 to mixer_1 1 channelWidth=400  ;
CHANNEL channel_10 from mixer_1 2 to droplet_sorter_1 1 channelWidth=400  ;
CHANNEL channel_11 from droplet_sorter_1 2 to port_7  channelWidth=400  ;
CHANNEL channel_12 from droplet_sorter_1 3 to port_8  channelWidth=400  ; 

END LAYER

