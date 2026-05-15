DEVICE one_to_one_mapping



LAYER FLOW 

MIXER mixer_1 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_1 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_2 componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from mixer_1 2 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_2 from port_2 1 to mixer_1 1 connectionSpacing=1000 channelWidth=400;

 

END LAYER

