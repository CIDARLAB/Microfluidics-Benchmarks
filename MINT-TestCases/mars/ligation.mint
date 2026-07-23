DEVICE ligation



LAYER FLOW 

DROPLET CAPACITANCE SENSOR droplet_capacitance_sensor_1 componentSpacing=9000 ;
PORT port_1 componentSpacing=9000 ;
PORT port_2 portRadius=2000 componentSpacing=9000 ;
PORT port_3 portRadius=2000 componentSpacing=9000 ;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1 componentSpacing=9000 ;
MIXER mixer_1 componentSpacing=9000 ;
MIXER mixer_2 componentSpacing=9000 ;
PORT port_4 portRadius=2000 componentSpacing=9000 ;
PORT port_5 portRadius=2000 componentSpacing=9000 ;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_2 componentSpacing=9000 ;
MIXER mixer_3 componentSpacing=9000 ;
PORT port_6 portRadius=2000 componentSpacing=9000 ;
PORT port_7 portRadius=2000 componentSpacing=9000 ;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_3 componentSpacing=9000 ;
MIXER mixer_4 componentSpacing=9000 ;
PORT port_8 portRadius=2000 componentSpacing=9000 ;
PORT port_9 portRadius=2000 componentSpacing=9000 ;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_4 componentSpacing=9000 ;
PORT port_10 portRadius=2000 componentSpacing=9000 ;
PORT port_11 portRadius=2000 componentSpacing=9000 ;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_5 componentSpacing=9000 ;
PORT port_12 componentSpacing=9000 ;
PORT port_13 componentSpacing=9000 ;
PORT port_14 componentSpacing=9000 ;
PORT port_15 componentSpacing=9000 ;
PORT port_16 componentSpacing=9000 ;



CHANNEL channel_1 from port_2 1 to nozzle_droplet_generator_1 2 channelWidth=400 connectionSpacing=1000  ;
CHANNEL channel_2 from port_3 1 to nozzle_droplet_generator_1 4 channelWidth=400 connectionSpacing=1000  ;
CHANNEL channel_3 from port_4 1 to nozzle_droplet_generator_2 2 channelWidth=400 connectionSpacing=1000  ;
CHANNEL channel_4 from port_5 1 to nozzle_droplet_generator_2 4 channelWidth=400 connectionSpacing=1000  ;
CHANNEL channel_5 from port_6 1 to nozzle_droplet_generator_3 2 channelWidth=400 connectionSpacing=1000  ;
CHANNEL channel_6 from port_7 1 to nozzle_droplet_generator_3 4 channelWidth=400 connectionSpacing=1000  ;
CHANNEL channel_7 from port_8 1 to nozzle_droplet_generator_4 2 channelWidth=400 connectionSpacing=1000  ;
CHANNEL channel_8 from port_9 1 to nozzle_droplet_generator_4 4 channelWidth=400 connectionSpacing=1000  ;
CHANNEL channel_9 from port_10 1 to nozzle_droplet_generator_5 2 channelWidth=400 connectionSpacing=1000  ;
CHANNEL channel_10 from port_11 1 to nozzle_droplet_generator_5 4 channelWidth=400 connectionSpacing=1000  ;
CHANNEL channel_11 from droplet_capacitance_sensor_1 2 to port_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_12 from nozzle_droplet_generator_1 3 to mixer_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_13 from nozzle_droplet_generator_2 3 to mixer_3 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_14 from nozzle_droplet_generator_3 3 to mixer_4 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_15 from nozzle_droplet_generator_4 3 to mixer_2 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_16 from nozzle_droplet_generator_5 3 to mixer_4 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_17 from mixer_1 2 to mixer_2 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_18 from mixer_4 2 to mixer_3 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_19 from mixer_2 2 to droplet_capacitance_sensor_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_20 from mixer_3 2 to mixer_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_21 from port_12 1 to nozzle_droplet_generator_2 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_22 from port_13 1 to nozzle_droplet_generator_4 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_23 from port_14 1 to nozzle_droplet_generator_3 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_24 from port_15 1 to nozzle_droplet_generator_5 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_25 from port_16 1 to nozzle_droplet_generator_1 1 connectionSpacing=1000 channelWidth=400  ;

 

END LAYER

LAYER CONTROL 

PORT Cport_1 componentSpacing=9000 ;

VALVE3D valve_0 on channel_11 controlPort=Cport_1 componentSpacing=1000 valveRadius=400 height=250 ;

CHANNEL Ctrlchannel_1 from Cport_1 1 to valve_0 1 connectionSpacing=1000 channelWidth=400  ;

 

END LAYER

