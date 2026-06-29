DEVICE ligation



LAYER flow

DROPLET CAPACITANCE SENSOR droplet_capacitance_sensor_1componentSpacing=1000.0 rotation=0.0 height=250.0 inletWidth=1000.0 inletLength=10000.0 electrodeWidth=1500.0 electrodeLength=4000.0 electrodeDistance=2000.0 sensorWidth=1000.0 sensorLength=3000.0 channelDepth=1000.0 electrodeDepth=1000.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_1componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_2portRadius=2000 componentSpacing=1000.0 height=1100.0;
PORT port_3portRadius=2000 componentSpacing=1000.0 height=1100.0;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1componentSpacing=1000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 height=250.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_1componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_2componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_3componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_4componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_4portRadius=2000 componentSpacing=1000.0 height=1100.0;
PORT port_5portRadius=2000 componentSpacing=1000.0 height=1100.0;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_2componentSpacing=1000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 height=250.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_6portRadius=2000 componentSpacing=1000.0 height=1100.0;
PORT port_7portRadius=2000 componentSpacing=1000.0 height=1100.0;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_3componentSpacing=1000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 height=250.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_8portRadius=2000 componentSpacing=1000.0 height=1100.0;
PORT port_9portRadius=2000 componentSpacing=1000.0 height=1100.0;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_4componentSpacing=1000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 height=250.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_10portRadius=2000 componentSpacing=1000.0 height=1100.0;
PORT port_11portRadius=2000 componentSpacing=1000.0 height=1100.0;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_5componentSpacing=1000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 height=250.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_12componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_13componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_14componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_15componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_16componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from port_2  to nozzle_droplet_generator_1 2channelWidth=400 connectionSpacing=1000;
CHANNEL channel_2 from port_3  to nozzle_droplet_generator_1 4channelWidth=400 connectionSpacing=1000;
CHANNEL channel_3 from port_4  to nozzle_droplet_generator_2 2channelWidth=400 connectionSpacing=1000;
CHANNEL channel_4 from port_5  to nozzle_droplet_generator_2 4channelWidth=400 connectionSpacing=1000;
CHANNEL channel_5 from port_6  to nozzle_droplet_generator_3 2channelWidth=400 connectionSpacing=1000;
CHANNEL channel_6 from port_7  to nozzle_droplet_generator_3 4channelWidth=400 connectionSpacing=1000;
CHANNEL channel_7 from port_8  to nozzle_droplet_generator_4 2channelWidth=400 connectionSpacing=1000;
CHANNEL channel_8 from port_9  to nozzle_droplet_generator_4 4channelWidth=400 connectionSpacing=1000;
CHANNEL channel_9 from port_10  to nozzle_droplet_generator_5 2channelWidth=400 connectionSpacing=1000;
CHANNEL channel_10 from port_11  to nozzle_droplet_generator_5 4channelWidth=400 connectionSpacing=1000;
CHANNEL channel_11 from droplet_capacitance_sensor_1 2 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_12 from nozzle_droplet_generator_1 3 to mixer_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_13 from nozzle_droplet_generator_2 3 to mixer_4 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_14 from nozzle_droplet_generator_3 3 to mixer_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_15 from nozzle_droplet_generator_4 3 to mixer_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_16 from nozzle_droplet_generator_5 3 to mixer_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_17 from mixer_3 2 to mixer_4 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_18 from mixer_1 2 to mixer_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_19 from mixer_2 2 to mixer_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_20 from mixer_4 2 to droplet_capacitance_sensor_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_21 from port_12 1 to nozzle_droplet_generator_4 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_22 from port_13 1 to nozzle_droplet_generator_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_23 from port_14 1 to nozzle_droplet_generator_5 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_24 from port_15 1 to nozzle_droplet_generator_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_25 from port_16 1 to nozzle_droplet_generator_3 1 connectionSpacing=1000 channelWidth=400;

 

END layer

LAYER control

PORT cport_1componentSpacing=1000.0 portRadius=700.0 height=1100.0;

VALVE3D valve_0 on channel_11componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;

CHANNEL ctrlchannel_1 from cport_1 1 to valve_0 1 connectionSpacing=1000 channelWidth=400;

 

END layer

