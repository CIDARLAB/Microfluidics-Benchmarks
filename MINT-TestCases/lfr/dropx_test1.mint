DEVICE dropx_test1

LAYER FLOW 

PORT in1 portRadius=2000 ;
PORT out1 portRadius=2000 ;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1 orificeSize=175 orificeLength=252 oilInputWidth=690 waterInputWidth=350 outputWidth=706 outputLength=5000 height=70 ;
PORT port_1 portRadius=2000 ;
PORT port_2 portRadius=2000 ;

CHANNEL channel_1 from port_1  to nozzle_droplet_generator_1 2 channelWidth=400  ;
CHANNEL channel_2 from port_2  to nozzle_droplet_generator_1 4 channelWidth=400  ;
CHANNEL channel_1 from in1  to nozzle_droplet_generator_1 1 channelWidth=400 height=400  ;
CHANNEL channel_2 from nozzle_droplet_generator_1 3 to out1  channelWidth=400 height=400  ; 

END LAYER

