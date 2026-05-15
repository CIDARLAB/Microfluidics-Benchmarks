DEVICE dx15



LAYER FLOW 

DROPLET CAPACITANCE SENSOR droplet_capacitance_sensor_1 componentSpacing=1000.0 rotation=0.0 height=250.0 inletWidth=1000.0 inletLength=10000.0 electrodeWidth=1500.0 electrodeLength=4000.0 electrodeDistance=2000.0 sensorWidth=1000.0 sensorLength=3000.0 channelDepth=1000.0 electrodeDepth=1000.0 mirrorByX=0.0 mirrorByY=0.0;
DROPLET SORTER droplet_sorter_1 componentSpacing=1000.0 rotation=0.0 height=250.0 inletWidth=800.0 inletLength=4000.0 electrodeDistance=1000.0 electrodeWidth=700.0 electrodeLength=5000.0 outletWidth=800.0 angle=45.0 wasteWidth=1200.0 outputLength=4000.0 keepWidth=2000.0 pressureWidth=400.0 pressureSpacing=1500.0 numberofDistributors=5.0 channelDepth=1000.0 electrodeDepth=1000.0 pressureDepth=1000.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_1 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_2 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_3 portRadius=2000 componentSpacing=1000.0 height=1100.0;
PORT port_4 portRadius=2000 componentSpacing=1000.0 height=1100.0;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1 componentSpacing=1000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 height=250.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_5 componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from port_3  to nozzle_droplet_generator_1 2 channelWidth=400 connectionSpacing=1000;
CHANNEL channel_2 from port_4  to nozzle_droplet_generator_1 4 channelWidth=400 connectionSpacing=1000;
CHANNEL channel_3 from droplet_capacitance_sensor_1 2 to droplet_sorter_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_4 from nozzle_droplet_generator_1 3 to droplet_capacitance_sensor_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_5 from droplet_sorter_1 3 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_6 from droplet_sorter_1 3 to port_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_7 from port_5 1 to nozzle_droplet_generator_1 1 connectionSpacing=1000 channelWidth=400;

 

END LAYER

