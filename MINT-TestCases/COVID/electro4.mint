DEVICE electro4



LAYER FLOW 

DROPLET CAPACITANCE SENSOR droplet_capacitance_sensor_1 componentSpacing=9000 ;
DROPLET CAPACITANCE SENSOR droplet_capacitance_sensor_2 componentSpacing=9000 ;
DROPLET CAPACITANCE SENSOR droplet_capacitance_sensor_3 componentSpacing=9000 ;
DROPLET CAPACITANCE SENSOR droplet_capacitance_sensor_4 componentSpacing=9000 ;
DROPLET CAPACITANCE SENSOR droplet_capacitance_sensor_5 componentSpacing=9000 ;
DROPLET CAPACITANCE SENSOR droplet_capacitance_sensor_6 componentSpacing=9000 ;
DROPLET CAPACITANCE SENSOR droplet_capacitance_sensor_7 componentSpacing=9000 ;
PORT port_1 componentSpacing=9000 ;
DROPLET CAPACITANCE SENSOR droplet_capacitance_sensor_8 componentSpacing=9000 ;
DROPLET CAPACITANCE SENSOR droplet_capacitance_sensor_9 componentSpacing=9000 ;
DROPLET CAPACITANCE SENSOR droplet_capacitance_sensor_10 componentSpacing=9000 ;
MIXER mixer_1 componentSpacing=9000 ;
MIXER mixer_2 componentSpacing=9000 ;
PORT port_2 componentSpacing=9000 ;
PORT port_3 componentSpacing=9000 ;
PORT port_4 componentSpacing=9000 ;
PORT port_5 componentSpacing=9000 ;
PORT port_6 componentSpacing=9000 ;



CHANNEL channel_1 from droplet_capacitance_sensor_7 2 to port_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_2 from droplet_capacitance_sensor_9 2 to port_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_3 from droplet_capacitance_sensor_10 2 to port_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_4 from mixer_1 2 to droplet_capacitance_sensor_6 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_5 from mixer_2 2 to mixer_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_6 from port_2 1 to mixer_2 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_7 from port_4 1 to mixer_2 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_8 from port_6 1 to mixer_1 1 connectionSpacing=1000 channelWidth=400  ;

 

END LAYER

