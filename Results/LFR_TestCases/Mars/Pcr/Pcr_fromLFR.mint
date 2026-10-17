DEVICE Pcr



LAYER FLOW 

DROPLET CAPACITANCE SENSOR droplet_capacitance_sensor_1 componentSpacing=2000.0 rotation=0.0 inletWidth=1000.0 inletLength=10000.0 electrodeWidth=1500.0 electrodeLength=4000.0 electrodeDistance=2000.0 sensorWidth=1000.0 sensorLength=3000.0 channelDepth=1000.0 electrodeDepth=1000.0 mirrorByX=0.0 mirrorByY=0.0 ;
DROPLET CAPACITANCE SENSOR droplet_capacitance_sensor_2 componentSpacing=2000.0 rotation=0.0 inletWidth=1000.0 inletLength=10000.0 electrodeWidth=1500.0 electrodeLength=4000.0 electrodeDistance=2000.0 sensorWidth=1000.0 sensorLength=3000.0 channelDepth=1000.0 electrodeDepth=1000.0 mirrorByX=0.0 mirrorByY=0.0 ;
PORT port_1 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
PORT port_2 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;



CHANNEL channel_1 from droplet_capacitance_sensor_1 2 to droplet_capacitance_sensor_2 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_2 from port_2 1 to droplet_capacitance_sensor_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_3 from droplet_capacitance_sensor_2 2 to port_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;

 

END LAYER

LAYER CONTROL 

PORT Cport_0 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;
PORT Cport_1 componentSpacing=2000.0 portRadius=1000.0 depth=1100.0 ;

VALVE3D valve_0 on channel_3 componentSpacing=1000.0 valveRadius=1200 gap=600 depth=250 rotation=90.0 ;
VALVE3D valve_1 on channel_3 componentSpacing=1000.0 valveRadius=1200 gap=600 depth=250 rotation=90.0 ;

CHANNEL Ctrlchannel_0 from Cport_0 1 to valve_0 1 RoundedChannel=1 channelWidth=600 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 width=600  ;
CHANNEL Ctrlchannel_1 from Cport_1 1 to valve_1 1 RoundedChannel=1 channelWidth=600 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 width=600  ;

 

END LAYER

