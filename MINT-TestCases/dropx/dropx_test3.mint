DEVICE dropx_test3



LAYER FLOW 

PORT port_1 portRadius=2000 generation_rate=400.0 generation_rateUnit=hz componentSpacing=9000 ;
PORT port_2 portRadius=2000 generation_rate=400.0 generation_rateUnit=hz componentSpacing=9000 ;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1 generation_rate=400.0 generation_rateUnit=hz componentSpacing=9000 ;
SQUARE CELL TRAP square_cell_trap_1 componentSpacing=9000 ;
MIXER mixer_1 componentSpacing=9000 ;
PORT port_3 componentSpacing=9000 ;
PORT port_4 portRadius=2000 generation_rate=400.0 generation_rateUnit=hz componentSpacing=9000 ;
PORT port_5 portRadius=2000 generation_rate=400.0 generation_rateUnit=hz componentSpacing=9000 ;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_2 generation_rate=400.0 generation_rateUnit=hz componentSpacing=9000 ;
SQUARE CELL TRAP square_cell_trap_2 componentSpacing=9000 ;
PORT port_6 componentSpacing=9000 ;
PORT port_7 componentSpacing=9000 ;



CHANNEL channel_1 from port_1 1 to nozzle_droplet_generator_1 2 channelWidth=400 connectionSpacing=1000  ;
CHANNEL channel_2 from port_2 1 to nozzle_droplet_generator_1 4 channelWidth=400 connectionSpacing=1000  ;
CHANNEL channel_3 from port_4 1 to nozzle_droplet_generator_2 2 channelWidth=400 connectionSpacing=1000  ;
CHANNEL channel_4 from port_5 1 to nozzle_droplet_generator_2 4 channelWidth=400 connectionSpacing=1000  ;
CHANNEL channel_5 from nozzle_droplet_generator_1 3 to square_cell_trap_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_6 from nozzle_droplet_generator_2 3 to square_cell_trap_2 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_7 from square_cell_trap_1 2 to mixer_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_8 from square_cell_trap_2 2 to mixer_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_9 from mixer_1 2 to port_3 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_10 from port_6 1 to nozzle_droplet_generator_1 1 connectionSpacing=1000 channelWidth=400  ;
CHANNEL channel_11 from port_7 1 to nozzle_droplet_generator_2 1 connectionSpacing=1000 channelWidth=400  ;

 

END LAYER

