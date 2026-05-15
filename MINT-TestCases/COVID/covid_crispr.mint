# Mirrored from LFR-TestCases/COVID/covid_crispr.lfr
# Paired LFR (when mirrored): same relative path under LFR-TestCases. Regenerate with: fluigi compile_lfr <design>.lfr

DEVICE expression1



LAYER FLOW 

MIXER mixer_1 componentSpacing=9000;
PORT port_1 componentSpacing=9000;
PORT port_2 componentSpacing=9000;
PORT port_3 componentSpacing=9000;



CHANNEL channel_1 from mixer_1 2 to port_1 1 connectionSpacing=1000;
CHANNEL channel_2 from port_2 1 to mixer_1 1 connectionSpacing=1000;
CHANNEL channel_3 from port_3 1 to mixer_1 1 connectionSpacing=1000;

 

END LAYER

