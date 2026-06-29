DEVICE expression1



LAYER flow

PORT port_1portRadius=2000 componentSpacing=1000.0 height=1100.0;
PORT port_2portRadius=2000 componentSpacing=1000.0 height=1100.0;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1componentSpacing=1000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 height=250.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_3portRadius=2000 componentSpacing=1000.0 height=1100.0;
PORT port_4portRadius=2000 componentSpacing=1000.0 height=1100.0;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_2componentSpacing=1000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 height=250.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_5componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_6componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_7componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from port_1  to nozzle_droplet_generator_1 2channelWidth=400 connectionSpacing=1000;
CHANNEL channel_2 from port_2  to nozzle_droplet_generator_1 4channelWidth=400 connectionSpacing=1000;
CHANNEL channel_3 from port_3  to nozzle_droplet_generator_2 2channelWidth=400 connectionSpacing=1000;
CHANNEL channel_4 from port_4  to nozzle_droplet_generator_2 4channelWidth=400 connectionSpacing=1000;
CHANNEL channel_5 from port_5 1 to nozzle_droplet_generator_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_6 from port_6 1 to nozzle_droplet_generator_2 1 connectionSpacing=1000 channelWidth=400;

 

END layer

