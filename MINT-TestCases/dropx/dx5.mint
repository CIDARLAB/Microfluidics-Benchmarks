DEVICE dx5

LAYER flow

PORT port_1portRadius=2000 ;
PORT port_2portRadius=2000 ;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1;
PICOINJECTOR picoinjector_1;
DROPLET SPLITTER droplet_splitter_1;
MIXER mixer_1;
DROPLET SORTER droplet_sorter_1;
MIXER mixer_2;
DROPLET SORTER droplet_sorter_2;
PORT port_3portRadius=2000 ;
PORT port_4portRadius=2000 ;
PORT port_5portRadius=2000 ;
PORT port_6portRadius=2000 ;
PORT port_7portRadius=2000 ;
PORT port_8portRadius=2000 ;

CHANNEL channel_1 from port_1  to nozzle_droplet_generator_1 2channelWidth=400  ;
CHANNEL channel_2 from port_2  to nozzle_droplet_generator_1 4channelWidth=400  ;
CHANNEL channel_3 from port_3  to nozzle_droplet_generator_1 1channelWidth=400  ;
CHANNEL channel_4 from port_4  to picoinjector_1 1channelWidth=400  ;
CHANNEL channel_5 from nozzle_droplet_generator_1 3 to picoinjector_1 2 channelWidth=400  ;
CHANNEL channel_6 from picoinjector_1 3 to droplet_splitter_1 1 channelWidth=400  ;
CHANNEL channel_7 from droplet_sorter_1 2 to mixer_1 1 channelWidth=400  ;
CHANNEL channel_8 from droplet_splitter_1 2 to mixer_1 1 channelWidth=400  ;
CHANNEL channel_9 from port_7  to droplet_sorter_1 1channelWidth=400  ;
CHANNEL channel_10 from droplet_sorter_2 2 to mixer_2 1 channelWidth=400  ;
CHANNEL channel_11 from droplet_splitter_1 3 to mixer_2 1 channelWidth=400  ;
CHANNEL channel_12 from port_8  to droplet_sorter_2 1channelWidth=400  ;
CHANNEL channel_13 from droplet_sorter_1 3 to port_5  channelWidth=400  ;
CHANNEL channel_14 from droplet_sorter_2 3 to port_6  channelWidth=400  ; 

END layer

