DEVICE dx14



LAYER FLOW 

MIXER mixer_1 componentSpacing=9000 ;
MIXER mixer_2 componentSpacing=9000 ;
DROPLET CAPACITANCE SENSOR droplet_capacitance_sensor_1 componentSpacing=9000 ;
PORT port_1 portRadius=2000 componentSpacing=9000 ;
PORT port_2 portRadius=2000 componentSpacing=9000 ;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1 componentSpacing=9000 ;
PORT port_3 portRadius=2000 componentSpacing=9000 ;
PORT port_4 portRadius=2000 componentSpacing=9000 ;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_2 componentSpacing=9000 ;
DROPLET SORTER droplet_sorter_1 componentSpacing=9000 ;
PORT port_5 componentSpacing=9000 ;
PORT port_6 componentSpacing=9000 ;
MIXER mixer_3 componentSpacing=9000 ;
MIXER mixer_4 componentSpacing=9000 ;
PORT port_7 componentSpacing=9000 ;
PORT port_8 componentSpacing=9000 ;
PORT port_9 componentSpacing=9000 ;



CHANNEL channel_1 from port_1 1 to nozzle_droplet_generator_1 2 channelWidth=400 connectionSpacing=1000  ;
CHANNEL channel_2 from port_2 1 to nozzle_droplet_generator_1 4 channelWidth=400 connectionSpacing=1000  ;
CHANNEL channel_3 from port_3 1 to nozzle_droplet_generator_2 2 channelWidth=400 connectionSpacing=1000  ;
CHANNEL channel_4 from port_4 1 to nozzle_droplet_generator_2 4 channelWidth=400 connectionSpacing=1000  ;
CHANNEL channel_5 from droplet_capacitance_sensor_1 2 to nozzle_droplet_generator_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_6 from droplet_capacitance_sensor_1 2 to nozzle_droplet_generator_2 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_7 from nozzle_droplet_generator_1 3 to mixer_2 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_8 from nozzle_droplet_generator_2 3 to mixer_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_9 from droplet_sorter_1 3 to port_5 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_10 from droplet_sorter_1 3 to port_6 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_11 from mixer_3 2 to droplet_capacitance_sensor_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_12 from mixer_4 2 to mixer_3 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_13 from port_7 1 to mixer_3 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_14 from port_8 1 to mixer_4 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_15 from port_9 1 to mixer_4 1 connectionSpacing=1000 channelWidth=400  ;

 

END LAYER

