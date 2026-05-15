# Mirrored from LFR-TestCases/COVID/part3_gel.lfr
# Paired LFR (when mirrored): same relative path under LFR-TestCases. Regenerate with: fluigi compile_lfr <design>.lfr

DEVICE part3_gel



LAYER FLOW 

MIXER mixer_1 componentSpacing=9000;
PORT port_1 componentSpacing=9000;
PORT port_2 componentSpacing=9000;
PORT port_3 componentSpacing=9000;
PORT port_4 componentSpacing=9000;
PORT port_5 componentSpacing=9000;
PORT port_6 componentSpacing=9000;
PORT port_7 componentSpacing=9000;



CHANNEL channel_1 from mixer_1 2 to port_1 1 connectionSpacing=1000;
CHANNEL channel_2 from port_5 1 to mixer_1 1 connectionSpacing=1000;
CHANNEL channel_3 from port_6 1 to mixer_1 1 connectionSpacing=1000;

 

END LAYER

