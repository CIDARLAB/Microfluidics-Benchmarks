DEVICE part3_gel



LAYER flow

MIXER mixer_1componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_1componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_2componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_3componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_4componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_5componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_6componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_7componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from mixer_1 2 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_2 from port_2 1 to mixer_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_3 from port_6 1 to mixer_1 1 connectionSpacing=1000 channelWidth=400;

 

END layer

