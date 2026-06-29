# Mirrored from LFR-TestCases/Expressions/expression12.lfr
# Paired LFR (when mirrored): same relative path under LFR-TestCases. Regenerate with: fluigi compile_lfr <design>.lfr

DEVICE expression12



LAYER flow

MIXER mixer_1componentSpacing=9000;
MIXER mixer_2componentSpacing=9000;
MIXER mixer_3componentSpacing=9000;
MIXER mixer_4componentSpacing=9000;
MIXER mixer_5componentSpacing=9000;
MIXER mixer_6componentSpacing=9000;
MIXER mixer_7componentSpacing=9000;
MIXER mixer_8componentSpacing=9000;
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



CHANNEL channel_1 from port_1 1 to mixer_2 1 connectionSpacing=1000;
CHANNEL channel_2 from port_2 1 to mixer_4 1 connectionSpacing=1000;
CHANNEL channel_3 from port_3 1 to mixer_2 1 connectionSpacing=1000;
CHANNEL channel_4 from port_4 1 to mixer_3 1 connectionSpacing=1000;
CHANNEL channel_5 from port_5 1 to mixer_6 1 connectionSpacing=1000;
CHANNEL channel_6 from port_6 1 to mixer_5 1 connectionSpacing=1000;
CHANNEL channel_7 from port_7 1 to mixer_7 1 connectionSpacing=1000;
CHANNEL channel_8 from port_8 1 to mixer_4 1 connectionSpacing=1000;
CHANNEL channel_9 from port_10 1 to mixer_1 1 connectionSpacing=1000;
CHANNEL channel_10 from port_11 1 to mixer_8 1 connectionSpacing=1000;
CHANNEL channel_11 from port_12 1 to mixer_8 1 connectionSpacing=1000;
CHANNEL channel_12 from port_13 1 to mixer_3 1 connectionSpacing=1000;
CHANNEL channel_13 from port_14 1 to mixer_5 1 connectionSpacing=1000;
CHANNEL channel_14 from port_15 1 to mixer_6 1 connectionSpacing=1000;
CHANNEL channel_15 from port_16 1 to mixer_7 1 connectionSpacing=1000;
CHANNEL channel_16 from port_17 1 to mixer_1 1 connectionSpacing=1000;

 

END layer

