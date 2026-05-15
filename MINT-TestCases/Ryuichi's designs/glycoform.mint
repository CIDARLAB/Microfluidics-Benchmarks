# Mirrored from LFR-TestCases/Ryuichi's designs/glycoform.lfr
# Paired LFR (when mirrored): same relative path under LFR-TestCases. Regenerate with: fluigi compile_lfr <design>.lfr

DEVICE glycoform



LAYER FLOW 

PORT port_1 componentSpacing=9000;
PORT port_2 componentSpacing=9000;
PORT port_3 componentSpacing=9000;
PORT port_4 componentSpacing=9000;
PORT port_5 componentSpacing=9000;
PORT port_6 componentSpacing=9000;
PORT port_7 componentSpacing=9000;



CHANNEL channel_1 from port_1 1 to port_2 1 connectionSpacing=1000;
CHANNEL channel_2 from port_3 1 to port_1 1 connectionSpacing=1000;
CHANNEL channel_3 from port_3 1 to port_4 1 connectionSpacing=1000;
CHANNEL channel_4 from port_3 1 to port_2 1 connectionSpacing=1000;
CHANNEL channel_5 from port_7 1 to port_1 1 connectionSpacing=1000;
CHANNEL channel_6 from port_7 1 to port_4 1 connectionSpacing=1000;
CHANNEL channel_7 from port_7 1 to port_2 1 connectionSpacing=1000;

 

END LAYER

