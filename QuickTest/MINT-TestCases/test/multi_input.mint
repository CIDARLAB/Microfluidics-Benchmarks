DEVICE multi_input



LAYER flow

SQUARE CELL TRAP square_cell_trap_1componentSpacing=9000;
PORT port_1componentSpacing=9000;
MIXER mixer_1componentSpacing=9000;
MIXER mixer_2componentSpacing=9000;
PORT port_2componentSpacing=9000;
PORT port_3componentSpacing=9000;
PORT port_4componentSpacing=9000;
PORT port_5componentSpacing=9000;
PORT port_6componentSpacing=9000;
PORT port_7componentSpacing=9000;



CHANNEL channel_1 from square_cell_trap_1 2 to port_1 1 connectionSpacing=1000;
CHANNEL channel_2 from mixer_1 2 to square_cell_trap_1 1 connectionSpacing=1000;
CHANNEL channel_3 from mixer_2 2 to square_cell_trap_1 1 connectionSpacing=1000;
CHANNEL channel_4 from port_2 1 to mixer_2 1 connectionSpacing=1000;
CHANNEL channel_5 from port_3 1 to mixer_2 1 connectionSpacing=1000;
CHANNEL channel_6 from port_4 1 to mixer_1 1 connectionSpacing=1000;
CHANNEL channel_7 from port_5 1 to square_cell_trap_1 1 connectionSpacing=1000;
CHANNEL channel_8 from port_6 1 to square_cell_trap_1 1 connectionSpacing=1000;
CHANNEL channel_9 from port_7 1 to mixer_1 1 connectionSpacing=1000;

 

END layer

LAYER control

PORT cport_0componentSpacing=9000;
PORT cport_1componentSpacing=9000;

VALVE valve_0 on channel_7 controlPort=cport_0 componentSpacing=9000;
VALVE valve_1 on channel_8 controlPort=cport_1 componentSpacing=9000;

CHANNEL ctrlchannel_0 from cport_0 1 to valve_0 1 connectionSpacing=1000;
CHANNEL ctrlchannel_1 from cport_1 1 to valve_1 1 connectionSpacing=1000;

 

END layer

