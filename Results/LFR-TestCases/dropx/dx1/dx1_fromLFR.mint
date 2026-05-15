DEVICE dx1



LAYER FLOW 

MIXER mixer_1 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
DROPLET SORTER droplet_sorter_1 componentSpacing=1000.0 rotation=0.0 height=250.0 inletWidth=800.0 inletLength=4000.0 electrodeDistance=1000.0 electrodeWidth=700.0 electrodeLength=5000.0 outletWidth=800.0 angle=45.0 wasteWidth=1200.0 outputLength=4000.0 keepWidth=2000.0 pressureWidth=400.0 pressureSpacing=1500.0 numberofDistributors=5.0 channelDepth=1000.0 electrodeDepth=1000.0 pressureDepth=1000.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_1 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_2 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_3 portRadius=2000 componentSpacing=1000.0 height=1100.0;
PORT port_4 portRadius=2000 componentSpacing=1000.0 height=1100.0;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1 componentSpacing=1000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 height=250.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_2 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_5 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_6 componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from port_3  to nozzle_droplet_generator_1 2 channelWidth=400 connectionSpacing=1000;
CHANNEL channel_2 from port_4  to nozzle_droplet_generator_1 4 channelWidth=400 connectionSpacing=1000;
CHANNEL channel_3 from mixer_1 2 to droplet_sorter_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_4 from nozzle_droplet_generator_1 3 to mixer_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_5 from droplet_sorter_1 3 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_6 from droplet_sorter_1 3 to port_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_7 from mixer_2 2 to mixer_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_8 from port_5 1 to mixer_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_9 from port_6 1 to nozzle_droplet_generator_1 1 connectionSpacing=1000 channelWidth=400;

 

END LAYER

