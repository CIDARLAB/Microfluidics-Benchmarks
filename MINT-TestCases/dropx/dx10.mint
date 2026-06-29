DEVICE dx10

LAYER flow

PORT port_1portRadius=2000 ;
PORT port_2portRadius=2000 ;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1;
MIXER mixer_1;
DROPLET SORTER droplet_sorter_1;
PORT port_3portRadius=2000 ;
PORT port_4portRadius=2000 ;
PORT port_5portRadius=2000 ;
PORT port_6portRadius=2000 ;

CHANNEL channel_1 from port_1  to nozzle_droplet_generator_1 2channelWidth=400  ;
CHANNEL channel_2 from port_2  to nozzle_droplet_generator_1 4channelWidth=400  ; 

END layer

