DEVICE logic04



LAYER flow

SQUARE CELL TRAP square_cell_trap_1componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0;
SQUARE CELL TRAP square_cell_trap_2componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0;
SQUARE CELL TRAP square_cell_trap_3componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_1componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_2componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_3componentSpacing=1000.0 portRadius=700.0 height=1100.0;
SQUARE CELL TRAP square_cell_trap_4componentSpacing=1000.0 rotation=0.0 height=250.0 channelWidth=1000.0 channelLength=4000.0 chamberWidth=2500.0 chamberLength=2500.0 chamberHeight=250.0 mirrorByX=0.0 mirrorByY=0.0;
PORT port_4componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_5componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_6componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_7componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_8componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_9componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_10componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_11componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT port_12componentSpacing=1000.0 portRadius=700.0 height=1100.0;



CHANNEL channel_1 from square_cell_trap_1 2 to square_cell_trap_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_2 from square_cell_trap_1 2 to square_cell_trap_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_3 from square_cell_trap_1 2 to port_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_4 from square_cell_trap_2 2 to square_cell_trap_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_5 from square_cell_trap_2 2 to port_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_6 from square_cell_trap_3 2 to port_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_7 from square_cell_trap_4 2 to square_cell_trap_1 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_8 from square_cell_trap_4 2 to square_cell_trap_2 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_9 from square_cell_trap_4 2 to square_cell_trap_3 1 connectionSpacing=1000 channelWidth=400;
CHANNEL channel_10 from square_cell_trap_4 2 to port_4 1 connectionSpacing=1000 channelWidth=400;

 

END layer

LAYER control

PORT cport_12componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT cport_13componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT cport_14componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT cport_15componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT cport_16componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT cport_17componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT cport_18componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT cport_19componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT cport_20componentSpacing=1000.0 portRadius=700.0 height=1100.0;
PORT cport_21componentSpacing=1000.0 portRadius=700.0 height=1100.0;

VALVE3D valve_4 on channel_7componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_5 on channel_8componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_6 on channel_9componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_7 on channel_1componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_8 on channel_2componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_9 on channel_4componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_10 on channel_10componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_11 on channel_3componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_12 on channel_5componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;
VALVE3D valve_13 on channel_6componentSpacing=1000 valveRadius=400 height=250 rotation=0.0 gap=600.0 width=2400.0 length=2400.0;

CHANNEL ctrlchannel_12 from cport_12 1 to valve_4 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_13 from cport_13 1 to valve_5 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_14 from cport_14 1 to valve_6 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_15 from cport_15 1 to valve_7 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_16 from cport_16 1 to valve_8 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_17 from cport_17 1 to valve_9 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_18 from cport_18 1 to valve_10 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_19 from cport_19 1 to valve_11 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_20 from cport_20 1 to valve_12 1 connectionSpacing=1000 channelWidth=400;
CHANNEL ctrlchannel_21 from cport_21 1 to valve_13 1 connectionSpacing=1000 channelWidth=400;

 

END layer

