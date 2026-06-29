# Mirrored from LFR-TestCases/mars/pcr.lfr
# Paired LFR (when mirrored): same relative path under LFR-TestCases. Regenerate with: fluigi compile_lfr <design>.lfr

DEVICE pcr



LAYER flow

DROPLET CAPACITANCE SENSOR droplet_capacitance_sensor_1componentSpacing=9000;
PORT port_1componentSpacing=9000;
DROPLET CAPACITANCE SENSOR droplet_capacitance_sensor_2componentSpacing=9000;
PORT port_2componentSpacing=9000;



CHANNEL channel_1 from droplet_capacitance_sensor_1 2 to port_1 1 connectionSpacing=1000;
CHANNEL channel_2 from droplet_capacitance_sensor_2 2 to droplet_capacitance_sensor_1 1 connectionSpacing=1000;
CHANNEL channel_3 from port_2 1 to droplet_capacitance_sensor_2 1 connectionSpacing=1000;

 

END layer

LAYER control

PORT cport_3componentSpacing=9000;

VALVE3D valve_0 on channel_1controlPort=Cport_3 componentSpacing=9000;

CHANNEL ctrlchannel_3 from cport_3 1 to valve_0 1 connectionSpacing=1000;

 

END layer

