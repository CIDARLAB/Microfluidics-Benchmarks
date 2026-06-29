# Mirrored from LFR-TestCases/distribute-library/transposer_04.lfr
# Paired LFR (when mirrored): same relative path under LFR-TestCases. Regenerate with: fluigi compile_lfr <design>.lfr

DEVICE transposer_04



LAYER flow

PORT port_1componentSpacing=9000;
PORT port_2componentSpacing=9000;
PORT port_3componentSpacing=9000;
PORT port_4componentSpacing=9000;
PORT port_5componentSpacing=9000;
PORT port_6componentSpacing=9000;
PORT port_7componentSpacing=9000;
PORT port_8componentSpacing=9000;



CHANNEL channel_1 from port_3 1 to port_1 1 connectionSpacing=1000;
CHANNEL channel_2 from port_3 1 to port_2 1 connectionSpacing=1000;
CHANNEL channel_3 from port_3 1 to port_4 1 connectionSpacing=1000;
CHANNEL channel_4 from port_5 1 to port_6 1 connectionSpacing=1000;
CHANNEL channel_5 from port_7 1 to port_1 1 connectionSpacing=1000;
CHANNEL channel_6 from port_7 1 to port_4 1 connectionSpacing=1000;
CHANNEL channel_7 from port_8 1 to port_1 1 connectionSpacing=1000;
CHANNEL channel_8 from port_8 1 to port_2 1 connectionSpacing=1000;
CHANNEL channel_9 from port_8 1 to port_4 1 connectionSpacing=1000;

 

END layer

LAYER control

PORT cport_0componentSpacing=9000;
PORT cport_1componentSpacing=9000;
PORT cport_2componentSpacing=9000;
PORT cport_3componentSpacing=9000;
PORT cport_4componentSpacing=9000;
PORT cport_5componentSpacing=9000;
PORT cport_6componentSpacing=9000;
PORT cport_7componentSpacing=9000;
PORT cport_8componentSpacing=9000;

VALVE3D valve_0 on channel_5controlPort=Cport_0 componentSpacing=9000;
VALVE3D valve_1 on channel_6controlPort=Cport_1 componentSpacing=9000;
VALVE3D valve_2 on channel_9controlPort=Cport_2 componentSpacing=9000;
VALVE3D valve_3 on channel_7controlPort=Cport_3 componentSpacing=9000;
VALVE3D valve_4 on channel_8controlPort=Cport_4 componentSpacing=9000;
VALVE3D valve_5 on channel_2controlPort=Cport_5 componentSpacing=9000;
VALVE3D valve_6 on channel_3controlPort=Cport_6 componentSpacing=9000;
VALVE3D valve_7 on channel_1controlPort=Cport_7 componentSpacing=9000;
VALVE3D valve_8 on channel_4controlPort=Cport_8 componentSpacing=9000;

CHANNEL ctrlchannel_0 from cport_0 1 to valve_0 1 connectionSpacing=1000;
CHANNEL ctrlchannel_1 from cport_1 1 to valve_1 1 connectionSpacing=1000;
CHANNEL ctrlchannel_2 from cport_2 1 to valve_2 1 connectionSpacing=1000;
CHANNEL ctrlchannel_3 from cport_3 1 to valve_3 1 connectionSpacing=1000;
CHANNEL ctrlchannel_4 from cport_4 1 to valve_4 1 connectionSpacing=1000;
CHANNEL ctrlchannel_5 from cport_5 1 to valve_5 1 connectionSpacing=1000;
CHANNEL ctrlchannel_6 from cport_6 1 to valve_6 1 connectionSpacing=1000;
CHANNEL ctrlchannel_7 from cport_7 1 to valve_7 1 connectionSpacing=1000;
CHANNEL ctrlchannel_8 from cport_8 1 to valve_8 1 connectionSpacing=1000;

 

END layer

