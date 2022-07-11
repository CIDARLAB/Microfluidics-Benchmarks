DEVICE dx15

LAYER FLOW 

PORT port_1 portRadius=2000  portRadius=2000;
PORT port_2 portRadius=2000  portRadius=2000;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1  orificeSize=150
orificeLength=375
oilInputWidth=600
waterInputWidth=375
outputWidth=300
outputLength=5000
height=300;
DIAMOND CHAMBER diamond_chamber_1 ;
DROPLET SORTER droplet_sorter_1 ;
PORT port_3 portRadius=2000  portRadius=2000;
PORT port_4 portRadius=2000  portRadius=2000;
PORT port_5 portRadius=2000  portRadius=2000;

CHANNEL channel_1 from port_1  to nozzle_droplet_generator_1 2 channelWidth=400  ;
CHANNEL channel_2 from port_2  to nozzle_droplet_generator_1 4 channelWidth=400  ; 

END LAYER

