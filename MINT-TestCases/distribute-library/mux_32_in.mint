# Mirrored from LFR-TestCases/distribute-library/mux_32_in.lfr
# Paired LFR (when mirrored): same relative path under LFR-TestCases. Regenerate with: fluigi compile_lfr <design>.lfr

DEVICE mux_32_in



LAYER flow

PORT port_1componentSpacing=9000;
PORT port_2componentSpacing=9000;
PORT port_3componentSpacing=9000;
PORT port_4componentSpacing=9000;
PORT port_5componentSpacing=9000;
PORT port_6componentSpacing=9000;
PORT port_7componentSpacing=9000;
PORT port_8componentSpacing=9000;
PORT port_9componentSpacing=9000;
PORT port_10componentSpacing=9000;
PORT port_11componentSpacing=9000;
PORT port_12componentSpacing=9000;
PORT port_13componentSpacing=9000;
PORT port_14componentSpacing=9000;
PORT port_15componentSpacing=9000;
PORT port_16componentSpacing=9000;
PORT port_17componentSpacing=9000;
PORT port_18componentSpacing=9000;
PORT port_19componentSpacing=9000;
PORT port_20componentSpacing=9000;
PORT port_21componentSpacing=9000;
PORT port_22componentSpacing=9000;
PORT port_23componentSpacing=9000;
PORT port_24componentSpacing=9000;
PORT port_25componentSpacing=9000;
PORT port_26componentSpacing=9000;
PORT port_27componentSpacing=9000;
PORT port_28componentSpacing=9000;
PORT port_29componentSpacing=9000;
PORT port_30componentSpacing=9000;
PORT port_31componentSpacing=9000;
PORT port_32componentSpacing=9000;
PORT port_33componentSpacing=9000;



CHANNEL channel_1 from port_14 1 to port_1 1 connectionSpacing=1000;
CHANNEL channel_2 from port_14 1 to port_2 1 connectionSpacing=1000;
CHANNEL channel_3 from port_14 1 to port_3 1 connectionSpacing=1000;
CHANNEL channel_4 from port_14 1 to port_4 1 connectionSpacing=1000;
CHANNEL channel_5 from port_14 1 to port_5 1 connectionSpacing=1000;
CHANNEL channel_6 from port_14 1 to port_6 1 connectionSpacing=1000;
CHANNEL channel_7 from port_14 1 to port_7 1 connectionSpacing=1000;
CHANNEL channel_8 from port_14 1 to port_8 1 connectionSpacing=1000;
CHANNEL channel_9 from port_14 1 to port_9 1 connectionSpacing=1000;
CHANNEL channel_10 from port_14 1 to port_10 1 connectionSpacing=1000;
CHANNEL channel_11 from port_14 1 to port_11 1 connectionSpacing=1000;
CHANNEL channel_12 from port_14 1 to port_12 1 connectionSpacing=1000;
CHANNEL channel_13 from port_14 1 to port_13 1 connectionSpacing=1000;
CHANNEL channel_14 from port_14 1 to port_15 1 connectionSpacing=1000;
CHANNEL channel_15 from port_14 1 to port_16 1 connectionSpacing=1000;
CHANNEL channel_16 from port_14 1 to port_17 1 connectionSpacing=1000;
CHANNEL channel_17 from port_14 1 to port_18 1 connectionSpacing=1000;
CHANNEL channel_18 from port_14 1 to port_19 1 connectionSpacing=1000;
CHANNEL channel_19 from port_14 1 to port_20 1 connectionSpacing=1000;
CHANNEL channel_20 from port_14 1 to port_21 1 connectionSpacing=1000;
CHANNEL channel_21 from port_14 1 to port_22 1 connectionSpacing=1000;
CHANNEL channel_22 from port_14 1 to port_23 1 connectionSpacing=1000;
CHANNEL channel_23 from port_14 1 to port_24 1 connectionSpacing=1000;
CHANNEL channel_24 from port_14 1 to port_25 1 connectionSpacing=1000;
CHANNEL channel_25 from port_14 1 to port_26 1 connectionSpacing=1000;
CHANNEL channel_26 from port_14 1 to port_27 1 connectionSpacing=1000;
CHANNEL channel_27 from port_14 1 to port_28 1 connectionSpacing=1000;
CHANNEL channel_28 from port_14 1 to port_29 1 connectionSpacing=1000;
CHANNEL channel_29 from port_14 1 to port_30 1 connectionSpacing=1000;
CHANNEL channel_30 from port_14 1 to port_31 1 connectionSpacing=1000;
CHANNEL channel_31 from port_14 1 to port_32 1 connectionSpacing=1000;
CHANNEL channel_32 from port_14 1 to port_33 1 connectionSpacing=1000;

 

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
PORT cport_9componentSpacing=9000;
PORT cport_10componentSpacing=9000;
PORT cport_11componentSpacing=9000;
PORT cport_12componentSpacing=9000;
PORT cport_13componentSpacing=9000;
PORT cport_14componentSpacing=9000;
PORT cport_15componentSpacing=9000;
PORT cport_16componentSpacing=9000;
PORT cport_17componentSpacing=9000;
PORT cport_18componentSpacing=9000;
PORT cport_19componentSpacing=9000;
PORT cport_20componentSpacing=9000;
PORT cport_21componentSpacing=9000;
PORT cport_22componentSpacing=9000;
PORT cport_23componentSpacing=9000;
PORT cport_24componentSpacing=9000;
PORT cport_25componentSpacing=9000;
PORT cport_26componentSpacing=9000;
PORT cport_27componentSpacing=9000;
PORT cport_28componentSpacing=9000;
PORT cport_29componentSpacing=9000;
PORT cport_30componentSpacing=9000;
PORT cport_31componentSpacing=9000;

VALVE3D valve_0 on channel_14controlPort=Cport_0 componentSpacing=9000;
VALVE3D valve_1 on channel_13controlPort=Cport_1 componentSpacing=9000;
VALVE3D valve_2 on channel_10controlPort=Cport_2 componentSpacing=9000;
VALVE3D valve_3 on channel_5controlPort=Cport_3 componentSpacing=9000;
VALVE3D valve_4 on channel_28controlPort=Cport_4 componentSpacing=9000;
VALVE3D valve_5 on channel_20controlPort=Cport_5 componentSpacing=9000;
VALVE3D valve_6 on channel_25controlPort=Cport_6 componentSpacing=9000;
VALVE3D valve_7 on channel_29controlPort=Cport_7 componentSpacing=9000;
VALVE3D valve_8 on channel_1controlPort=Cport_8 componentSpacing=9000;
VALVE3D valve_9 on channel_15controlPort=Cport_9 componentSpacing=9000;
VALVE3D valve_10 on channel_9controlPort=Cport_10 componentSpacing=9000;
VALVE3D valve_11 on channel_19controlPort=Cport_11 componentSpacing=9000;
VALVE3D valve_12 on channel_17controlPort=Cport_12 componentSpacing=9000;
VALVE3D valve_13 on channel_8controlPort=Cport_13 componentSpacing=9000;
VALVE3D valve_14 on channel_16controlPort=Cport_14 componentSpacing=9000;
VALVE3D valve_15 on channel_3controlPort=Cport_15 componentSpacing=9000;
VALVE3D valve_16 on channel_6controlPort=Cport_16 componentSpacing=9000;
VALVE3D valve_17 on channel_12controlPort=Cport_17 componentSpacing=9000;
VALVE3D valve_18 on channel_21controlPort=Cport_18 componentSpacing=9000;
VALVE3D valve_19 on channel_23controlPort=Cport_19 componentSpacing=9000;
VALVE3D valve_20 on channel_18controlPort=Cport_20 componentSpacing=9000;
VALVE3D valve_21 on channel_11controlPort=Cport_21 componentSpacing=9000;
VALVE3D valve_22 on channel_7controlPort=Cport_22 componentSpacing=9000;
VALVE3D valve_23 on channel_32controlPort=Cport_23 componentSpacing=9000;
VALVE3D valve_24 on channel_4controlPort=Cport_24 componentSpacing=9000;
VALVE3D valve_25 on channel_31controlPort=Cport_25 componentSpacing=9000;
VALVE3D valve_26 on channel_30controlPort=Cport_26 componentSpacing=9000;
VALVE3D valve_27 on channel_26controlPort=Cport_27 componentSpacing=9000;
VALVE3D valve_28 on channel_2controlPort=Cport_28 componentSpacing=9000;
VALVE3D valve_29 on channel_27controlPort=Cport_29 componentSpacing=9000;
VALVE3D valve_30 on channel_22controlPort=Cport_30 componentSpacing=9000;
VALVE3D valve_31 on channel_24controlPort=Cport_31 componentSpacing=9000;

CHANNEL ctrlchannel_0 from cport_0 1 to valve_0 1 connectionSpacing=1000;
CHANNEL ctrlchannel_1 from cport_1 1 to valve_1 1 connectionSpacing=1000;
CHANNEL ctrlchannel_2 from cport_2 1 to valve_2 1 connectionSpacing=1000;
CHANNEL ctrlchannel_3 from cport_3 1 to valve_3 1 connectionSpacing=1000;
CHANNEL ctrlchannel_4 from cport_4 1 to valve_4 1 connectionSpacing=1000;
CHANNEL ctrlchannel_5 from cport_5 1 to valve_5 1 connectionSpacing=1000;
CHANNEL ctrlchannel_6 from cport_6 1 to valve_6 1 connectionSpacing=1000;
CHANNEL ctrlchannel_7 from cport_7 1 to valve_7 1 connectionSpacing=1000;
CHANNEL ctrlchannel_8 from cport_8 1 to valve_8 1 connectionSpacing=1000;
CHANNEL ctrlchannel_9 from cport_9 1 to valve_9 1 connectionSpacing=1000;
CHANNEL ctrlchannel_10 from cport_10 1 to valve_10 1 connectionSpacing=1000;
CHANNEL ctrlchannel_11 from cport_11 1 to valve_11 1 connectionSpacing=1000;
CHANNEL ctrlchannel_12 from cport_12 1 to valve_12 1 connectionSpacing=1000;
CHANNEL ctrlchannel_13 from cport_13 1 to valve_13 1 connectionSpacing=1000;
CHANNEL ctrlchannel_14 from cport_14 1 to valve_14 1 connectionSpacing=1000;
CHANNEL ctrlchannel_15 from cport_15 1 to valve_15 1 connectionSpacing=1000;
CHANNEL ctrlchannel_16 from cport_16 1 to valve_16 1 connectionSpacing=1000;
CHANNEL ctrlchannel_17 from cport_17 1 to valve_17 1 connectionSpacing=1000;
CHANNEL ctrlchannel_18 from cport_18 1 to valve_18 1 connectionSpacing=1000;
CHANNEL ctrlchannel_19 from cport_19 1 to valve_19 1 connectionSpacing=1000;
CHANNEL ctrlchannel_20 from cport_20 1 to valve_20 1 connectionSpacing=1000;
CHANNEL ctrlchannel_21 from cport_21 1 to valve_21 1 connectionSpacing=1000;
CHANNEL ctrlchannel_22 from cport_22 1 to valve_22 1 connectionSpacing=1000;
CHANNEL ctrlchannel_23 from cport_23 1 to valve_23 1 connectionSpacing=1000;
CHANNEL ctrlchannel_24 from cport_24 1 to valve_24 1 connectionSpacing=1000;
CHANNEL ctrlchannel_25 from cport_25 1 to valve_25 1 connectionSpacing=1000;
CHANNEL ctrlchannel_26 from cport_26 1 to valve_26 1 connectionSpacing=1000;
CHANNEL ctrlchannel_27 from cport_27 1 to valve_27 1 connectionSpacing=1000;
CHANNEL ctrlchannel_28 from cport_28 1 to valve_28 1 connectionSpacing=1000;
CHANNEL ctrlchannel_29 from cport_29 1 to valve_29 1 connectionSpacing=1000;
CHANNEL ctrlchannel_30 from cport_30 1 to valve_30 1 connectionSpacing=1000;
CHANNEL ctrlchannel_31 from cport_31 1 to valve_31 1 connectionSpacing=1000;

 

END layer

