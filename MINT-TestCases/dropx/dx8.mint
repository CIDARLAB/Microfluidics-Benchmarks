DEVICE dx8

LAYER flow

MIXER mixer_1;
MIXER mixer_2;
PORT port_1portRadius=2000 ;
PORT port_2portRadius=2000 ;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1;
MIXER mixer_3;
MIXER mixer_4;
MIXER mixer_5;
MIXER mixer_6;
DROPLET SORTER droplet_sorter_1;
DROPLET SORTER droplet_sorter_2;
PORT port_3portRadius=2000 ;
PORT port_4portRadius=2000 ;
PORT port_5portRadius=2000 ;
PORT port_6portRadius=2000 ;
PORT port_7portRadius=2000 ;
PORT port_8portRadius=2000 ;
PORT port_9portRadius=2000 ;
PORT port_10portRadius=2000 ;
PORT port_11portRadius=2000 ;

CHANNEL channel_1 from port_1  to nozzle_droplet_generator_1 2channelWidth=400  ;
CHANNEL channel_2 from port_2  to nozzle_droplet_generator_1 4channelWidth=400  ; 

END layer

