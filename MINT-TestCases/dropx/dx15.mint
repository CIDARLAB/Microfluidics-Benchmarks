DEVICE dx15

LAYER flow

PORT port_1portRadius=2000  portRadius=2000;
PORT port_2portRadius=2000  portRadius=2000;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1orificeSize=150
orificeLength=375
oilInputWidth=600
waterInputWidth=375
outputWidth=300
outputLength=5000
height=300;
DIAMOND REACTION CHAMBER diamond_chamber_1;
DROPLET SORTER droplet_sorter_1;
PORT port_3portRadius=2000  portRadius=2000;
PORT port_4portRadius=2000  portRadius=2000;
PORT port_5portRadius=2000  portRadius=2000;

CHANNEL channel_1 from port_1  to nozzle_droplet_generator_1 2channelWidth=400  ;
CHANNEL channel_2 from port_2  to nozzle_droplet_generator_1 4channelWidth=400  ; 

END layer

