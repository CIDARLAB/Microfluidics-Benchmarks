DEVICE flow_and_control_demo



LAYER FLOW 

MIXER mixer_1;
PORT port_1;
PORT port_2;
PORT port_3;
PORT port_4;



CHANNEL channel_1 from mixer_1 2 to port_1 1;
CHANNEL channel_2 from port_2 1 to mixer_1 1;
CHANNEL channel_3 from port_3 1 to mixer_1 1;
CHANNEL channel_4 from port_4 1 to port_1 1;

 

END LAYER

LAYER CONTROL 

PORT Cport_0;
PORT Cport_1;

VALVE valve_0 on channel_1 controlPort=Cport_0;
VALVE valve_1 on channel_4 controlPort=Cport_1;

CHANNEL Ctrlchannel_0 from Cport_0 1 to valve_0 1;
CHANNEL Ctrlchannel_1 from Cport_1 1 to valve_1 1;

 

END LAYER

