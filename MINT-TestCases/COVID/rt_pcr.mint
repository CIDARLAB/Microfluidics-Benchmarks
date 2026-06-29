# Mirrored from LFR-TestCases/COVID/rt_pcr.lfr
# Paired LFR (when mirrored): same relative path under LFR-TestCases. Regenerate with: fluigi compile_lfr <design>.lfr

# TODO: set reaction chamber default length/width in library when available.
DEVICE pcr



LAYER flow

REACTION CHAMBER reaction_chamber_1componentSpacing=9000;
PORT port_1componentSpacing=9000;
REACTION CHAMBER reaction_chamber_2componentSpacing=9000;
PORT port_2componentSpacing=9000;



CHANNEL channel_1 from reaction_chamber_1 4 to port_1 1 connectionSpacing=1000;
CHANNEL channel_2 from reaction_chamber_2 4 to reaction_chamber_1 2 connectionSpacing=1000;
CHANNEL channel_3 from port_2 1 to reaction_chamber_2 2 connectionSpacing=1000;

 

END layer

