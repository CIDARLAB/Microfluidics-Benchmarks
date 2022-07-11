DEVICE orthogonal_constraint_large

LAYER FLOW

PORT p_6, p_7, p_8, p_9, p_10, p_11, p_15, p_19, p_20, p_21, p_22 portRadius=2000;

NODE n_1, n_2, n_3, n_4, n_5, n_14, n_16, n_18;

MIXER m12, m13, m17;

CHANNEL c_1 from n_1 to n_2 channelWidth=400;
CHANNEL c_2 from n_1 to n_3 channelWidth=400;
CHANNEL c_3 from n_1 to n_4 channelWidth=400;
CHANNEL c_4 from n_1 to n_5 channelWidth=400;

CHANNEL c_5 from n_2 to p_8 channelWidth=400;

CHANNEL c_6 from n_3 to p_9  channelWidth=400;
CHANNEL c_7 from n_3 to p_10  channelWidth=400;
CHANNEL c_8 from n_3 to p_11  channelWidth=400;

CHANNEL c_9 from n_4 to n_14  channelWidth=400;
CHANNEL c_10 from n_4 to m12  channelWidth=400;

CHANNEL c_11 from n_5 to p_6  channelWidth=400;
CHANNEL c_12 from n_5 to p_7  channelWidth=400;

CHANNEL c_13 from m12 to m13  channelWidth=400;

CHANNEL c_14 from n_14 to p_15  channelWidth=400;

CHANNEL c_15 from n_16 to p_19  channelWidth=400;
CHANNEL c_16 from n_16 to m13  channelWidth=400;
CHANNEL c_17 from n_16 to m17  channelWidth=400;

CHANNEL c_18 from n_18 to m17  channelWidth=400;
CHANNEL c_19 from n_18 to p_20  channelWidth=400;
CHANNEL c_20 from n_18 to p_21  channelWidth=400;
CHANNEL c_21 from n_18 to p_22  channelWidth=400;

END LAYER