DEVICE dx8

LAYER FLOW 

PICOINJECTOR picoinjector_1 ;
PICOINJECTOR picoinjector_2 ;
PORT port_1 portRadius=2000 ;
PORT port_2 portRadius=2000 ;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1 ;
PICOINJECTOR picoinjector_3 ;
PICOINJECTOR picoinjector_4 ;
PICOINJECTOR picoinjector_5 ;
MIXER mixer_1 ;
DROPLET SORTER droplet_sorter_1 ;
DROPLET SORTER droplet_sorter_2 ;
PORT port_3 portRadius=2000 ;
PORT port_4 portRadius=2000 ;
PORT port_5 portRadius=2000 ;
PORT port_6 portRadius=2000 ;
PORT port_7 portRadius=2000 ;
PORT port_8 portRadius=2000 ;
PORT port_9 portRadius=2000 ;
PORT port_10 portRadius=2000 ;
PORT port_11 portRadius=2000 ;

CHANNEL channel_1 from port_1  to nozzle_droplet_generator_1 2 channelWidth=400  ;
CHANNEL channel_2 from port_2  to nozzle_droplet_generator_1 4 channelWidth=400  ;
CHANNEL channel_3 from port_3  to picoinjector_1 1 channelWidth=400  ;
CHANNEL channel_4 from port_4  to picoinjector_1 2 channelWidth=400  ;
CHANNEL channel_5 from port_5  to picoinjector_2 1 channelWidth=400  ;
CHANNEL channel_6 from picoinjector_1 3 to picoinjector_2 2 channelWidth=400  ;
CHANNEL channel_7 from picoinjector_2 3 to nozzle_droplet_generator_1 1 channelWidth=400  ;
CHANNEL channel_8 from port_6  to picoinjector_3 1 channelWidth=400  ;
CHANNEL channel_9 from nozzle_droplet_generator_1 3 to picoinjector_3 2 channelWidth=400  ;
CHANNEL channel_10 from port_7  to picoinjector_4 1 channelWidth=400  ;
CHANNEL channel_11 from picoinjector_3 3 to picoinjector_4 2 channelWidth=400  ;
CHANNEL channel_12 from port_8  to picoinjector_5 1 channelWidth=400  ;
CHANNEL channel_13 from picoinjector_4 3 to picoinjector_5 2 channelWidth=400  ;
CHANNEL channel_14 from picoinjector_5 3 to mixer_1 1 channelWidth=400  ;
CHANNEL channel_15 from mixer_1 2 to droplet_sorter_1 1 channelWidth=400  ;
CHANNEL channel_16 from droplet_sorter_1 2 to droplet_sorter_2 1 channelWidth=400  ;
CHANNEL channel_17 from droplet_sorter_2 2 to port_9  channelWidth=400  ;
CHANNEL channel_18 from droplet_sorter_1 3 to port_10  channelWidth=400  ;
CHANNEL channel_19 from droplet_sorter_2 3 to port_11  channelWidth=400  ; 

END LAYER

