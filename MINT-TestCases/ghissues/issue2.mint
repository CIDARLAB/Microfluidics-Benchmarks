# Mirrored from LFR-TestCases/ghissues/issue2.lfr
# Paired LFR (when mirrored): same relative path under LFR-TestCases. Regenerate with: fluigi compile_lfr <design>.lfr

DEVICE issue2



LAYER FLOW 

PORT port_1 componentSpacing=9000;
PORT port_2 componentSpacing=9000;



CHANNEL channel_1 from port_1 1 to port_2 1 connectionSpacing=1000;

 

END LAYER

