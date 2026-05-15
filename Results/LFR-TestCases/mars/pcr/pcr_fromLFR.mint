DEVICE pcr



LAYER FLOW 

DROPLET CAPACITANCE SENSOR droplet_capacitance_sensor_1 componentSpacing=1000.0 rotation=0.0 height=250.0 inletWidth=1000.0 inletLength=10000.0 electrodeWidth=1500.0 electrodeLength=4000.0 electrodeDistance=2000.0 sensorWidth=1000.0 sensorLength=3000.0 channelDepth=1000.0 electrodeDepth=1000.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_1 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
DROPLET CAPACITANCE SENSOR droplet_capacitance_sensor_2 componentSpacing=1000.0 rotation=0.0 height=250.0 inletWidth=1000.0 inletLength=10000.0 electrodeWidth=1500.0 electrodeLength=4000.0 electrodeDistance=2000.0 sensorWidth=1000.0 sensorLength=3000.0 channelDepth=1000.0 electrodeDepth=1000.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_2 componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from droplet_capacitance_sensor_1 2 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_2 from droplet_capacitance_sensor_2 2 to droplet_capacitance_sensor_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_3 from port_2 1 to droplet_capacitance_sensor_2 1 connectionSpacing=1000 channelWidth=400;

 

END LAYER

LAYER CONTROL 

PORT Cport_3 componentSpacing=1000.0 portRadius=700.0 height=1100.0;

VALVE3D valve_0 on channel_1 componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;

CHANNEL Ctrlchannel_3 from Cport_3 1 to valve_0 1 connectionSpacing=1000 channelWidth=400;

 

END LAYER

