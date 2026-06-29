# Mirrored from LFR-TestCases/COVID/part2_lfr.lfr
# Paired LFR (when mirrored): same relative path under LFR-TestCases. Regenerate with: fluigi compile_lfr <design>.lfr

DEVICE part2_rt



LAYER flow

MIXER mixer_1componentSpacing=9000;
MIXER mixer_2componentSpacing=9000;
MIXER mixer_3componentSpacing=9000;
PORT port_1componentSpacing=9000;
PORT port_2componentSpacing=9000;
PORT port_3componentSpacing=9000;
PORT port_4componentSpacing=9000;
PORT port_5componentSpacing=9000;



CHANNEL channel_1 from mixer_1 2 to mixer_2 1 connectionSpacing=1000;
CHANNEL channel_2 from mixer_3 2 to mixer_2 1 connectionSpacing=1000;
CHANNEL channel_3 from port_1 1 to mixer_1 1 connectionSpacing=1000;
CHANNEL channel_4 from port_3 1 to mixer_3 1 connectionSpacing=1000;
CHANNEL channel_5 from port_4 1 to mixer_1 1 connectionSpacing=1000;
CHANNEL channel_6 from port_5 1 to mixer_3 1 connectionSpacing=1000;

 

END layer

