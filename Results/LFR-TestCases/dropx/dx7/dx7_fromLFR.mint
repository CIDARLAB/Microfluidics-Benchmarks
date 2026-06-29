DEVICE dx7



LAYER flow

PORT port_1portRadius=2000 componentSpacing=1000.0 height=1100.0;
PORT port_2portRadius=2000 componentSpacing=1000.0 height=1100.0;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1componentSpacing=1000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 height=250.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_1componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_2componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
DROPLET SPLITTER droplet_splitter_1componentSpacing=1000.0 rotation=0.0 height=250.0 inletWidth=2000.0 inletLength=6000.0 outletWidth1=1000.0 outletLength1=3000.0 outletWidth2=2000.0 outletLength2=3000.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_3componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_4componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_5portRadius=2000 componentSpacing=1000.0 height=1100.0;
PORT port_6portRadius=2000 componentSpacing=1000.0 height=1100.0;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_2componentSpacing=1000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 height=250.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_3componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_7componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_8componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_9componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_10componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from port_1  to nozzle_droplet_generator_1 2channelWidth=400 connectionSpacing=1000;
CHANNEL channel_2 from port_2  to nozzle_droplet_generator_1 4channelWidth=400 connectionSpacing=1000;
CHANNEL channel_3 from port_5  to nozzle_droplet_generator_2 2channelWidth=400 connectionSpacing=1000;
CHANNEL channel_4 from port_6  to nozzle_droplet_generator_2 4channelWidth=400 connectionSpacing=1000;
CHANNEL channel_5 from nozzle_droplet_generator_1 3 to mixer_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_6 from nozzle_droplet_generator_2 3 to mixer_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_7 from droplet_splitter_1 3 to port_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_8 from droplet_splitter_1 3 to port_4 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_9 from mixer_2 2 to droplet_splitter_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_10 from mixer_3 2 to mixer_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_11 from mixer_1 2 to mixer_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_12 from port_7 1 to nozzle_droplet_generator_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_13 from port_8 1 to mixer_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_14 from port_9 1 to nozzle_droplet_generator_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_15 from port_10 1 to mixer_3 1 connectionSpacing=1000 channelWidth=400;

 

END layer

