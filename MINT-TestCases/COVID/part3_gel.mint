# Mirrored from LFR-TestCases/COVID/part3_gel.lfr
# Paired LFR (when mirrored): same relative path under LFR-TestCases. Regenerate with: fluigi compile_lfr <design>.lfr

DEVICE part3_gel



LAYER flow

MIXER mixer_1componentSpacing=9000;
PORT port_1componentSpacing=9000;
PORT port_2componentSpacing=9000;
PORT port_3componentSpacing=9000;
PORT port_4componentSpacing=9000;
PORT port_5componentSpacing=9000;
PORT port_6componentSpacing=9000;
PORT port_7componentSpacing=9000;



CHANNEL channel_1 from mixer_1 2 to port_1 1 connectionSpacing=1000;
CHANNEL channel_2 from port_5 1 to mixer_1 1 connectionSpacing=1000;
CHANNEL channel_3 from port_6 1 to mixer_1 1 connectionSpacing=1000;

 

END layer

