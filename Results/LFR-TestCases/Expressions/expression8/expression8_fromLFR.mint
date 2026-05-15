DEVICE expression8



LAYER FLOW 

MIXER mixer_1 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_2 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
MIXER mixer_3 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_1 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_2 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_3 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_4 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_5 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_6 componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from port_1 1 to mixer_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_2 from port_2 1 to mixer_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_3 from port_3 1 to mixer_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_4 from port_5 1 to mixer_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_5 from port_5 1 to mixer_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_6 from port_5 1 to mixer_3 1 connectionSpacing=1000 channelWidth=400;

 

END LAYER

