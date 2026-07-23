DEVICE issue15



LAYER FLOW 

DROPLET CAPACITANCE SENSOR droplet_capacitance_sensor_1 componentSpacing=9000 ;
DROPLET SORTER droplet_sorter_1 componentSpacing=9000 ;
PORT port_1 componentSpacing=9000 ;
PORT port_2 componentSpacing=9000 ;
PORT port_3 portRadius=2000 componentSpacing=9000 ;
PORT port_4 portRadius=2000 componentSpacing=9000 ;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1 componentSpacing=9000 ;
PORT port_5 componentSpacing=9000 ;



CHANNEL channel_1 from port_3 1 to nozzle_droplet_generator_1 2 channelWidth=400 connectionSpacing=1000  ;
CHANNEL channel_2 from port_4 1 to nozzle_droplet_generator_1 4 channelWidth=400 connectionSpacing=1000  ;
CHANNEL channel_3 from droplet_capacitance_sensor_1 2 to droplet_sorter_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_4 from nozzle_droplet_generator_1 3 to droplet_capacitance_sensor_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_5 from droplet_sorter_1 3 to port_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_6 from droplet_sorter_1 3 to port_2 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_7 from port_5 1 to nozzle_droplet_generator_1 1 connectionSpacing=1000 channelWidth=400  ;

 

END LAYER

