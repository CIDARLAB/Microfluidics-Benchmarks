DEVICE dx6



LAYER FLOW 

PORT port_1 portRadius=2000 componentSpacing=1000.0 height=1100.0;
PORT port_2 portRadius=2000 componentSpacing=1000.0 height=1100.0;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1 componentSpacing=1000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 height=250.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
DROPLET SPLITTER droplet_splitter_1 componentSpacing=1000.0 rotation=0.0 height=250.0 inletWidth=2000.0 inletLength=6000.0 outletWidth1=1000.0 outletLength1=3000.0 outletWidth2=2000.0 outletLength2=3000.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_3 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_4 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
MIXER mixer_1 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_5 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_6 componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from port_1  to nozzle_droplet_generator_1 2 channelWidth=400 connectionSpacing=1000;
CHANNEL channel_2 from port_2  to nozzle_droplet_generator_1 4 channelWidth=400 connectionSpacing=1000;
CHANNEL channel_3 from nozzle_droplet_generator_1 3 to droplet_splitter_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_4 from droplet_splitter_1 3 to port_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_5 from droplet_splitter_1 3 to port_4 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_6 from mixer_1 2 to nozzle_droplet_generator_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_7 from port_5 1 to mixer_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_8 from port_6 1 to mixer_1 1 connectionSpacing=1000 channelWidth=400;

 

END LAYER

