# Mirrored from LFR-TestCases/distribute-library/mux_02_out.lfr
# Paired LFR (when mirrored): same relative path under LFR-TestCases. Regenerate with: fluigi compile_lfr <design>.lfr

DEVICE mux_02_out



LAYER flow

PORT port_1componentSpacing=9000;
PORT port_2componentSpacing=9000;
PORT port_3componentSpacing=9000;



CHANNEL channel_1 from port_3 1 to port_1 1 connectionSpacing=1000;
CHANNEL channel_2 from port_3 1 to port_2 1 connectionSpacing=1000;

 

END layer

LAYER control

PORT cport_0componentSpacing=9000;
PORT cport_1componentSpacing=9000;

VALVE3D valve_0 on channel_2controlPort=Cport_0 componentSpacing=9000;
VALVE3D valve_1 on channel_1controlPort=Cport_1 componentSpacing=9000;

CHANNEL ctrlchannel_0 from cport_0 1 to valve_0 1 connectionSpacing=1000;
CHANNEL ctrlchannel_1 from cport_1 1 to valve_1 1 connectionSpacing=1000;

 

END layer

