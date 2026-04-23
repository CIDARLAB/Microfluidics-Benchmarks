DEVICE import_parallel_premix



LAYER FLOW 

MIXER mixer_1 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0;
PORT port_1 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
MIXER mixer_2 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0;
MIXER mixer_3 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0;
MIXER mixer_4 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0;
MIXER mixer_5 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0;
MIXER mixer_6 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0;
MIXER mixer_7 componentSpacing=1000.0 channelWidth=800.0 bendSpacing=1230.0 numberOfBends=1.0 rotation=0.0 bendLength=2460.0 height=250.0;
PORT port_2 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_3 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_4 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_5 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_6 componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from mixer_1 2 to port_1 1 connectionSpacing=1000;
CHANNEL channel_2 from mixer_2 2 to mixer_3 1 connectionSpacing=1000;
CHANNEL channel_3 from mixer_5 2 to mixer_3 1 connectionSpacing=1000;
CHANNEL channel_4 from mixer_3 2 to mixer_4 1 connectionSpacing=1000;
CHANNEL channel_5 from mixer_4 2 to mixer_1 1 connectionSpacing=1000;
CHANNEL channel_6 from mixer_6 2 to mixer_5 1 connectionSpacing=1000;
CHANNEL channel_7 from mixer_7 2 to mixer_2 1 connectionSpacing=1000;
CHANNEL channel_8 from port_2 1 to mixer_7 1 connectionSpacing=1000;
CHANNEL channel_9 from port_3 1 to mixer_6 1 connectionSpacing=1000;
CHANNEL channel_10 from port_4 1 to mixer_7 1 connectionSpacing=1000;
CHANNEL channel_11 from port_5 1 to mixer_4 1 connectionSpacing=1000;
CHANNEL channel_12 from port_6 1 to mixer_6 1 connectionSpacing=1000;

 

END LAYER

