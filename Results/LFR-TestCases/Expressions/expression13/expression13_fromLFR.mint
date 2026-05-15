DEVICE expression13



LAYER FLOW 

DROPLET SPLITTER droplet_splitter_1 componentSpacing=1000.0 rotation=0.0 height=250.0 inletWidth=2000.0 inletLength=6000.0 outletWidth1=1000.0 outletLength1=3000.0 outletWidth2=2000.0 outletLength2=3000.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_1 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_2 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_3 componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from droplet_splitter_1 3 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_2 from droplet_splitter_1 3 to port_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_3 from port_3 1 to droplet_splitter_1 1 connectionSpacing=1000 channelWidth=400;

 

END LAYER

