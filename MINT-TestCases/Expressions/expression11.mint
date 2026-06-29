# Mirrored from LFR-TestCases/Expressions/expression11.lfr
# Paired LFR (when mirrored): same relative path under LFR-TestCases. Regenerate with: fluigi compile_lfr <design>.lfr

DEVICE expression11



LAYER flow

MIXER mixer_1componentSpacing=9000;
PORT port_1componentSpacing=9000;
PORT port_2componentSpacing=9000;
PORT port_3componentSpacing=9000;



CHANNEL channel_1 from mixer_1 2 to port_1 1 connectionSpacing=1000;
CHANNEL channel_2 from port_2 1 to mixer_1 1 connectionSpacing=1000;
CHANNEL channel_3 from port_3 1 to mixer_1 1 connectionSpacing=1000;

 

END layer

