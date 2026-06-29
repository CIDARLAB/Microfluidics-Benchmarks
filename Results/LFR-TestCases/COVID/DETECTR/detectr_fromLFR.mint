DEVICE detectr



LAYER flow

DROPLET CAPACITANCE SENSOR droplet_capacitance_sensor_1componentSpacing=1000.0 rotation=0.0 height=250.0 inletWidth=1000.0 inletLength=10000.0 electrodeWidth=1500.0 electrodeLength=4000.0 electrodeDistance=2000.0 sensorWidth=1000.0 sensorLength=3000.0 channelDepth=1000.0 electrodeDepth=1000.0 mirrorByX=0.0 mirrorByY=0.0;
DROPLET CAPACITANCE SENSOR droplet_capacitance_sensor_2componentSpacing=1000.0 rotation=0.0 height=250.0 inletWidth=1000.0 inletLength=10000.0 electrodeWidth=1500.0 electrodeLength=4000.0 electrodeDistance=2000.0 sensorWidth=1000.0 sensorLength=3000.0 channelDepth=1000.0 electrodeDepth=1000.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_1componentSpacing=1000.0 portRadius=700.0 height=1100.0;
DROPLET CAPACITANCE SENSOR droplet_capacitance_sensor_3componentSpacing=1000.0 rotation=0.0 height=250.0 inletWidth=1000.0 inletLength=10000.0 electrodeWidth=1500.0 electrodeLength=4000.0 electrodeDistance=2000.0 sensorWidth=1000.0 sensorLength=3000.0 channelDepth=1000.0 electrodeDepth=1000.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_1componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_2componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_3componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_4componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_5componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_6componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_7componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_2componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_3componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_4componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_5componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_6componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_7componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_8componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_9componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_10componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_11componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from droplet_capacitance_sensor_1 2 to droplet_capacitance_sensor_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_2 from droplet_capacitance_sensor_2 2 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_3 from mixer_1 2 to mixer_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_4 from mixer_2 2 to mixer_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_5 from mixer_3 2 to mixer_4 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_6 from mixer_4 2 to mixer_5 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_7 from mixer_6 2 to droplet_capacitance_sensor_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_8 from mixer_7 2 to mixer_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_9 from mixer_5 2 to mixer_6 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_10 from port_2 1 to mixer_7 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_11 from port_3 1 to mixer_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_12 from port_4 1 to mixer_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_13 from port_5 1 to mixer_4 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_14 from port_7 1 to mixer_6 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_15 from port_8 1 to mixer_5 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_16 from port_9 1 to mixer_7 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_17 from port_11 1 to mixer_3 1 connectionSpacing=1000 channelWidth=400;

 

END layer

