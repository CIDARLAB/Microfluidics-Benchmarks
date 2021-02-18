DEVICE dx15

LAYER FLOW 

PORT port_1 portRadius=2000 ;
PORT port_2 portRadius=2000 ;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1 ;
DROPLET CAPACITANCE SENSOR droplet_capacitance_sensor_1 ;
DROPLET SORTER droplet_sorter_1 ;
PORT port_3 portRadius=2000 ;
PORT port_4 portRadius=2000 ;
PORT port_5 portRadius=2000 ;

CHANNEL channel_1 from port_1  to nozzle_droplet_generator_1 2 channelWidth=400  ;
CHANNEL channel_2 from port_2  to nozzle_droplet_generator_1 4 channelWidth=400  ;
CHANNEL channel_3 from port_3  to nozzle_droplet_generator_1 1 channelWidth=400  ;
CHANNEL channel_4 from nozzle_droplet_generator_1 3 to droplet_capacitance_sensor_1 1 channelWidth=400  ;
CHANNEL channel_5 from droplet_capacitance_sensor_1 2 to droplet_sorter_1 1 channelWidth=400  ;
CHANNEL channel_6 from droplet_sorter_1 2 to port_4  channelWidth=400  ;
CHANNEL channel_7 from droplet_sorter_1 3 to port_5  channelWidth=400  ; 

END LAYER

