DEVICE orthogonal_constraint_large

LAYER flow

PORT p_6, p_7, p_8, p_9, p_10, p_11, p_15, p_19, p_20, p_21, p_22portRadius=2000;

NODE n_1, n_2, n_3, n_4, n_5, n_14, n_16, n_18;

MIXER m12, m13, m17;

CHANNEL c_1 from n_1 to n_2channelWidth=400;
CHANNEL c_2 from n_1 to n_3channelWidth=400;
CHANNEL c_3 from n_1 to n_4channelWidth=400;
CHANNEL c_4 from n_1 to n_5channelWidth=400;

CHANNEL c_5 from n_2 to p_8channelWidth=400;

CHANNEL c_6 from n_3 to p_9channelWidth=400;
CHANNEL c_7 from n_3 to p_10channelWidth=400;
CHANNEL c_8 from n_3 to p_11channelWidth=400;

CHANNEL c_9 from n_4 to n_14channelWidth=400;
CHANNEL c_10 from n_4 to m12channelWidth=400;

CHANNEL c_11 from n_5 to p_6channelWidth=400;
CHANNEL c_12 from n_5 to p_7channelWidth=400;

CHANNEL c_13 from m12 to m13channelWidth=400;

CHANNEL c_14 from n_14 to p_15channelWidth=400;

CHANNEL c_15 from n_16 to p_19channelWidth=400;
CHANNEL c_16 from n_16 to m13channelWidth=400;
CHANNEL c_17 from n_16 to m17channelWidth=400;

CHANNEL c_18 from n_18 to m17channelWidth=400;
CHANNEL c_19 from n_18 to p_20channelWidth=400;
CHANNEL c_20 from n_18 to p_21channelWidth=400;
CHANNEL c_21 from n_18 to p_22channelWidth=400;

END layer