DEVICE dx6

LAYER FLOW 

PICOINJECTOR picoinjector_1 ;
PORT port_1 portRadius=2000 ;
PORT port_2 portRadius=2000 ;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1 ;
DROPLET SPLITTER droplet_splitter_1 ;
PORT port_3 portRadius=2000 ;
PORT port_4 portRadius=2000 ;
PORT port_5 portRadius=2000 ;
PORT port_6 portRadius=2000 ;

CHANNEL channel_1 from port_1  to nozzle_droplet_generator_1 2 channelWidth=400  ;
CHANNEL channel_2 from port_2  to nozzle_droplet_generator_1 4 channelWidth=400  ;
CHANNEL channel_3 from port_3  to picoinjector_1 1 channelWidth=400  ;
CHANNEL channel_4 from port_4  to picoinjector_1 2 channelWidth=400  ;
CHANNEL channel_5 from picoinjector_1 3 to nozzle_droplet_generator_1 1 channelWidth=400  ;
CHANNEL channel_6 from nozzle_droplet_generator_1 3 to droplet_splitter_1 1 channelWidth=400  ;
CHANNEL channel_7 from droplet_splitter_1 2 to port_5  channelWidth=400  ;
CHANNEL channel_8 from droplet_splitter_1 3 to port_6  channelWidth=400  ; 

END LAYER

