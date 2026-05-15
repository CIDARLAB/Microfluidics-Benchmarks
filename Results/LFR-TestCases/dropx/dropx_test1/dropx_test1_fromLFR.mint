DEVICE dropx_test1



LAYER FLOW 

PORT port_1 portRadius=2000 componentSpacing=1000.0 height=1100.0;
PORT port_2 portRadius=2000 componentSpacing=1000.0 height=1100.0;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1 componentSpacing=1000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 height=250.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_3 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_4 componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from port_1  to nozzle_droplet_generator_1 2 channelWidth=400 connectionSpacing=1000;
CHANNEL channel_2 from port_2  to nozzle_droplet_generator_1 4 channelWidth=400 connectionSpacing=1000;
CHANNEL channel_3 from nozzle_droplet_generator_1 3 to port_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_4 from port_4 1 to nozzle_droplet_generator_1 1 connectionSpacing=1000 channelWidth=400;

 

END LAYER

