DEVICE sorting



LAYER FLOW 

DROPLET SORTER droplet_sorter_1 componentSpacing=1000.0 rotation=0.0 height=250.0 inletWidth=800.0 inletLength=4000.0 electrodeDistance=1000.0 electrodeWidth=700.0 electrodeLength=5000.0 outletWidth=800.0 angle=45.0 wasteWidth=1200.0 outputLength=4000.0 keepWidth=2000.0 pressureWidth=400.0 pressureSpacing=1500.0 numberofDistributors=5.0 channelDepth=1000.0 electrodeDepth=1000.0 pressureDepth=1000.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_1 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_2 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_3 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_4 componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from droplet_sorter_1 3 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_2 from port_4 1 to droplet_sorter_1 1 connectionSpacing=1000 channelWidth=400;

 

END LAYER

