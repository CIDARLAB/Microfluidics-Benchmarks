DEVICE device7

# Transcribed from device7.png (blue = FLOW, pink = CONTROL).
# port_top -> mixer_A (top serpentine) -> mixer_B (right, vertical serpentine)
#   -> long loop back to node_J0 (top centre).
# node_J0 also connects to port_bot by two perimeter channels (left and right).
# A vertical trunk runs down from node_J0:
#   valve_0 -> mixer_C -> node_1 -> node_2 -> node_3 -> node_4 -> node_5
# Branches off the trunk:
#   node_1 -> valve_1 -> port_out1
#   node_2 -> valve_2 -> mixer_E -> port_out2
#   node_3 <- valve_4 <- node_J2 <- {mixer_D <- port_in_d,  valve_3 <- port_in_v}
#   node_4 -> valve_5 -> mixer_F -> port_out3
#   node_5 <- mixer_G <- port_in_g
#   node_5 -> valve_6 -> port_out4
# Each valve has its own control port (7 total).

LAYER FLOW

PORT port_top componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT port_bot componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT port_in_d componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT port_in_v componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT port_in_g componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT port_out1 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT port_out2 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT port_out3 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT port_out4 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;

MIXER mixer_A componentSpacing=1000.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=8.0 rotation=0.0 bendLength=2000.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_B componentSpacing=1000.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=2.0 rotation=90.0 bendLength=2000.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_C componentSpacing=1000.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=9.0 rotation=0.0 bendLength=2000.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_D componentSpacing=1000.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=4.0 rotation=0.0 bendLength=2000.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_E componentSpacing=1000.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=4.0 rotation=0.0 bendLength=2000.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_F componentSpacing=1000.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=4.0 rotation=0.0 bendLength=2000.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;
MIXER mixer_G componentSpacing=1000.0 channelWidth=600.0 bendSpacing=1400.0 numberOfBends=4.0 rotation=0.0 bendLength=2000.0 height=250.0 mirrorByX=0.0 mirrorByY=0.0 edgeBend1=300.0 edgeBend2=300.0 ;

NODE node_J0 componentSpacing=0.0 height=100.0 radius=0.0 ;
NODE node_1 componentSpacing=0.0 height=100.0 radius=0.0 ;
NODE node_2 componentSpacing=0.0 height=100.0 radius=0.0 ;
NODE node_3 componentSpacing=0.0 height=100.0 radius=0.0 ;
NODE node_4 componentSpacing=0.0 height=100.0 radius=0.0 ;
NODE node_5 componentSpacing=0.0 height=100.0 radius=0.0 ;
NODE node_J2 componentSpacing=0.0 height=100.0 radius=0.0 ;

# Top path and loop back to the centre junction
CHANNEL channel_1 from port_top 1 to mixer_A 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_2 from mixer_A 2 to mixer_B 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_3 from mixer_B 2 to node_J0 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
# Perimeter rectangle: node_J0 -> port_bot along both left and right sides
CHANNEL channel_4 from node_J0 1 to port_bot 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_5 from node_J0 1 to port_bot 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;

# Trunk
CHANNEL channel_6 from node_J0 1 to mixer_C 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_7 from mixer_C 2 to node_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_9 from node_1 1 to node_2 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_12 from node_2 1 to node_3 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_17 from node_3 1 to node_4 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_20 from node_4 1 to node_5 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;

# Right-side branches
CHANNEL channel_8 from node_1 1 to port_out1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_10 from node_2 1 to mixer_E 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_11 from mixer_E 2 to port_out2 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_18 from node_4 1 to mixer_F 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_19 from mixer_F 2 to port_out3 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_23 from node_5 1 to port_out4 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;

# Left-side inlets
CHANNEL channel_13 from port_in_d 1 to mixer_D 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_14 from mixer_D 2 to node_J2 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_15 from port_in_v 1 to node_J2 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_16 from node_J2 1 to node_3 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_21 from port_in_g 1 to mixer_G 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_22 from mixer_G 2 to node_5 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;

END LAYER

LAYER CONTROL

PORT Cport_0 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_1 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_2 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_3 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_4 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_5 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_6 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;

VALVE3D valve_0 on channel_6 componentSpacing=1000.0 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_1 on channel_8 componentSpacing=1000.0 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_2 on channel_10 componentSpacing=1000.0 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_3 on channel_15 componentSpacing=1000.0 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_4 on channel_16 componentSpacing=1000.0 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_5 on channel_18 componentSpacing=1000.0 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_6 on channel_23 componentSpacing=1000.0 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;

CHANNEL Ctrlchannel_0 from Cport_0 1 to valve_0 1 RoundedChannel=1 channelWidth=600 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 width=600  ;
CHANNEL Ctrlchannel_1 from Cport_1 1 to valve_1 1 RoundedChannel=1 channelWidth=600 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 width=600  ;
CHANNEL Ctrlchannel_2 from Cport_2 1 to valve_2 1 RoundedChannel=1 channelWidth=600 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 width=600  ;
CHANNEL Ctrlchannel_3 from Cport_3 1 to valve_3 1 RoundedChannel=1 channelWidth=600 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 width=600  ;
CHANNEL Ctrlchannel_4 from Cport_4 1 to valve_4 1 RoundedChannel=1 channelWidth=600 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 width=600  ;
CHANNEL Ctrlchannel_5 from Cport_5 1 to valve_5 1 RoundedChannel=1 channelWidth=600 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 width=600  ;
CHANNEL Ctrlchannel_6 from Cport_6 1 to valve_6 1 RoundedChannel=1 channelWidth=600 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 width=600  ;

END LAYER
