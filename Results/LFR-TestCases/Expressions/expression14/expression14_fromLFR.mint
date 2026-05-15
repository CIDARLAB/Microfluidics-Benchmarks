DEVICE expression14



LAYER FLOW 

PORT port_1 portRadius=2000 componentSpacing=1000.0 height=1100.0;
PORT port_2 portRadius=2000 componentSpacing=1000.0 height=1100.0;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_1 componentSpacing=1000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 height=250.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_3 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_4 portRadius=2000 componentSpacing=1000.0 height=1100.0;
PORT port_5 portRadius=2000 componentSpacing=1000.0 height=1100.0;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_2 componentSpacing=1000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 height=250.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_6 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_7 portRadius=2000 componentSpacing=1000.0 height=1100.0;
PORT port_8 portRadius=2000 componentSpacing=1000.0 height=1100.0;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_3 componentSpacing=1000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 height=250.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_9 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_10 portRadius=2000 componentSpacing=1000.0 height=1100.0;
PORT port_11 portRadius=2000 componentSpacing=1000.0 height=1100.0;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_4 componentSpacing=1000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 height=250.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_12 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_13 portRadius=2000 componentSpacing=1000.0 height=1100.0;
PORT port_14 portRadius=2000 componentSpacing=1000.0 height=1100.0;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_5 componentSpacing=1000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 height=250.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_15 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_16 portRadius=2000 componentSpacing=1000.0 height=1100.0;
PORT port_17 portRadius=2000 componentSpacing=1000.0 height=1100.0;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_6 componentSpacing=1000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 height=250.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_18 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_19 portRadius=2000 componentSpacing=1000.0 height=1100.0;
PORT port_20 portRadius=2000 componentSpacing=1000.0 height=1100.0;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_7 componentSpacing=1000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 height=250.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_21 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_22 portRadius=2000 componentSpacing=1000.0 height=1100.0;
PORT port_23 portRadius=2000 componentSpacing=1000.0 height=1100.0;
NOZZLE DROPLET GENERATOR nozzle_droplet_generator_8 componentSpacing=1000.0 orificeSize=200.0 orificeLength=400.0 oilInputWidth=800.0 waterInputWidth=600.0 outputWidth=600.0 outputLength=600.0 height=250.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_24 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_25 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_26 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_27 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_28 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_29 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_30 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_31 componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_32 componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from port_1  to nozzle_droplet_generator_1 2 channelWidth=400 connectionSpacing=1000;
CHANNEL channel_2 from port_2  to nozzle_droplet_generator_1 4 channelWidth=400 connectionSpacing=1000;
CHANNEL channel_3 from port_4  to nozzle_droplet_generator_2 2 channelWidth=400 connectionSpacing=1000;
CHANNEL channel_4 from port_5  to nozzle_droplet_generator_2 4 channelWidth=400 connectionSpacing=1000;
CHANNEL channel_5 from port_7  to nozzle_droplet_generator_3 2 channelWidth=400 connectionSpacing=1000;
CHANNEL channel_6 from port_8  to nozzle_droplet_generator_3 4 channelWidth=400 connectionSpacing=1000;
CHANNEL channel_7 from port_10  to nozzle_droplet_generator_4 2 channelWidth=400 connectionSpacing=1000;
CHANNEL channel_8 from port_11  to nozzle_droplet_generator_4 4 channelWidth=400 connectionSpacing=1000;
CHANNEL channel_9 from port_13  to nozzle_droplet_generator_5 2 channelWidth=400 connectionSpacing=1000;
CHANNEL channel_10 from port_14  to nozzle_droplet_generator_5 4 channelWidth=400 connectionSpacing=1000;
CHANNEL channel_11 from port_16  to nozzle_droplet_generator_6 2 channelWidth=400 connectionSpacing=1000;
CHANNEL channel_12 from port_17  to nozzle_droplet_generator_6 4 channelWidth=400 connectionSpacing=1000;
CHANNEL channel_13 from port_19  to nozzle_droplet_generator_7 2 channelWidth=400 connectionSpacing=1000;
CHANNEL channel_14 from port_20  to nozzle_droplet_generator_7 4 channelWidth=400 connectionSpacing=1000;
CHANNEL channel_15 from port_22  to nozzle_droplet_generator_8 2 channelWidth=400 connectionSpacing=1000;
CHANNEL channel_16 from port_23  to nozzle_droplet_generator_8 4 channelWidth=400 connectionSpacing=1000;
CHANNEL channel_17 from nozzle_droplet_generator_1 3 to port_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_18 from nozzle_droplet_generator_2 3 to port_6 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_19 from nozzle_droplet_generator_3 3 to port_9 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_20 from nozzle_droplet_generator_4 3 to port_12 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_21 from nozzle_droplet_generator_5 3 to port_15 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_22 from nozzle_droplet_generator_6 3 to port_18 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_23 from nozzle_droplet_generator_7 3 to port_21 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_24 from nozzle_droplet_generator_8 3 to port_24 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_25 from port_25 1 to nozzle_droplet_generator_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_26 from port_26 1 to nozzle_droplet_generator_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_27 from port_27 1 to nozzle_droplet_generator_4 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_28 from port_28 1 to nozzle_droplet_generator_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_29 from port_29 1 to nozzle_droplet_generator_6 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_30 from port_30 1 to nozzle_droplet_generator_8 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_31 from port_31 1 to nozzle_droplet_generator_5 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_32 from port_32 1 to nozzle_droplet_generator_7 1 connectionSpacing=1000 channelWidth=400;

 

END LAYER

