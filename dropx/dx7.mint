DEVICE dx7

LAYER FLOW 

PORT port_1 portRadius=2000 ;
PORT port_2 portRadius=2000 ;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1 ;
PORT port_3 portRadius=2000 ;
PORT port_4 portRadius=2000 ;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_2 ;
PICOINJECTOR picoinjector_1 ;
PICOINJECTOR picoinjector_2 ;
PICOINJECTOR picoinjector_3 ;
DROPLET SPLITTER droplet_splitter_1 ;
PORT port_5 portRadius=2000 ;
PORT port_6 portRadius=2000 ;
PORT port_7 portRadius=2000 ;
PORT port_8 portRadius=2000 ;
PORT port_9 portRadius=2000 ;
PORT port_10 portRadius=2000 ;

CHANNEL channel_1 from port_1  to nozzle_droplet_generator_1 2 channelWidth=400  ;
CHANNEL channel_2 from port_2  to nozzle_droplet_generator_1 4 channelWidth=400  ;
CHANNEL channel_3 from port_3  to nozzle_droplet_generator_2 2 channelWidth=400  ;
CHANNEL channel_4 from port_4  to nozzle_droplet_generator_2 4 channelWidth=400  ;
CHANNEL channel_5 from port_5  to nozzle_droplet_generator_1 1 channelWidth=400  ;
CHANNEL channel_6 from port_6  to nozzle_droplet_generator_2 1 channelWidth=400  ;
CHANNEL channel_7 from nozzle_droplet_generator_1 3 to picoinjector_1 1 channelWidth=400  ;
CHANNEL channel_8 from nozzle_droplet_generator_2 3 to picoinjector_1 2 channelWidth=400  ;
CHANNEL channel_9 from port_7  to picoinjector_2 1 channelWidth=400  ;
CHANNEL channel_10 from port_8  to picoinjector_2 2 channelWidth=400  ;
CHANNEL channel_11 from picoinjector_2 3 to picoinjector_3 1 channelWidth=400  ;
CHANNEL channel_12 from picoinjector_1 3 to picoinjector_3 2 channelWidth=400  ;
CHANNEL channel_13 from picoinjector_3 3 to droplet_splitter_1 1 channelWidth=400  ;
CHANNEL channel_14 from droplet_splitter_1 2 to port_9  channelWidth=400  ;
CHANNEL channel_15 from droplet_splitter_1 3 to port_10  channelWidth=400  ; 

END LAYER

