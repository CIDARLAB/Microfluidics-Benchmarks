DEVICE device5

# Transcribed from device5.jpg (blue = FLOW, pink = CONTROL).
# Two inlets (left) converge into a central chamber. The chamber exits right to
# port_out1 and from its bottom to a T-node that splits to port_out2 (right)
# and port_out3 (down).
# Control: Cport_0 is one shared line that drives both inlet valves AND the
# right-outlet valve. Cport_1 drives the bottom-outlet valve.

LAYER FLOW

REACTION CHAMBER chamber_1 componentSpacing=1000.0 width=5000.0 length=10000.0 height=250.0 cornerRadius=200.0 rotation=0.0 mirrorByX=0.0 mirrorByY=0.0 ;
PORT port_in1 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT port_in2 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT port_out1 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT port_out2 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT port_out3 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
NODE node_1 componentSpacing=0.0 height=100.0 radius=0.0 ;

CHANNEL channel_1 from port_in1 1 to chamber_1 4 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_2 from port_in2 1 to chamber_1 4 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_3 from chamber_1 2 to port_out1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_4 from chamber_1 3 to node_1 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_5 from node_1 1 to port_out2 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;
CHANNEL channel_6 from node_1 1 to port_out3 1 RoundedChannel=1 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 channelWidth=600 width=600  ;

END LAYER

LAYER CONTROL

PORT Cport_0 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;
PORT Cport_1 componentSpacing=2000.0 portRadius=1000.0 height=1100.0 ;

VALVE3D valve_0 on channel_1 componentSpacing=1000.0 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_1 on channel_2 componentSpacing=1000.0 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_2 on channel_3 componentSpacing=1000.0 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;
VALVE3D valve_3 on channel_4 componentSpacing=1000.0 valveRadius=1200 gap=600 width=2400 length=2400 height=250 rotation=0.0 ;

# Cport_0 fans out to three valves (shared control line in the drawing).
CHANNEL Ctrlchannel_0 from Cport_0 1 to valve_0 1 RoundedChannel=1 channelWidth=600 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 width=600  ;
CHANNEL Ctrlchannel_1 from Cport_0 1 to valve_1 1 RoundedChannel=1 channelWidth=600 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 width=600  ;
CHANNEL Ctrlchannel_2 from Cport_0 1 to valve_2 1 RoundedChannel=1 channelWidth=600 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 width=600  ;
CHANNEL Ctrlchannel_3 from Cport_1 1 to valve_3 1 RoundedChannel=1 channelWidth=600 length=1000.0 minChannelLength=1000.0 connectionSpacing=1000 width=600  ;

END LAYER
