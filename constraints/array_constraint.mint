DEVICE array_constraint

LAYER FLOW


PORT p_in1, p_in2, p_in3, p_in4, 
    p_in5, p_in6, p_in7, p_in8 portRadius=2000;

BANK p_in1, p_in2, p_in3, p_in4, 
    p_in5, p_in6, p_in7, p_in8 of 8 spacing=2000;

PORT p_out1, p_out2, p_outp3, p_out4, 
    p_out5, p_out6, p_out7, p_out8 portRadius=2000;

BANK p_out1, p_out2, p_outp3, p_out4, 
    p_out5, p_out6, p_out7, p_out8 of 8 spacing=2000;


REACTION CHAMBER ct1_1, ct1_2, ct1_3, ct1_4, ct1_5, ct1_6, ct1_7, ct1_8,
                    ct2_1, ct2_2, ct2_3, ct2_4, ct2_5, ct2_6, ct2_7, ct2_8,
                    ct3_1, ct3_2, ct3_3, ct3_4, ct3_5, ct3_6, ct3_7, ct3_8,
                    ct4_1, ct4_2, ct4_3, ct4_4, ct4_5, ct4_6, ct4_7, ct4_8,
                    ct5_1, ct5_2, ct5_3, ct5_4, ct5_5, ct5_6, ct5_7, ct5_8,
                    ct6_1, ct6_2, ct6_3, ct6_4, ct6_5, ct6_6, ct6_7, ct6_8,
                    ct7_1, ct7_2, ct7_3, ct7_4, ct7_5, ct7_6, ct7_7, ct7_8,
                    ct8_1, ct8_2, ct8_3, ct8_4, ct8_5, ct8_6, ct8_7, ct8_8  
                        width=250 length=250 height=30 cornerRadius=20; 

GRID ct1_1, ct1_2, ct1_3, ct1_4, ct1_5, ct1_6, ct1_7, ct1_8,
    ct2_1, ct2_2, ct2_3, ct2_4, ct2_5, ct2_6, ct2_7, ct2_8,
    ct3_1, ct3_2, ct3_3, ct3_4, ct3_5, ct3_6, ct3_7, ct3_8,
    ct4_1, ct4_2, ct4_3, ct4_4, ct4_5, ct4_6, ct4_7, ct4_8,
    ct5_1, ct5_2, ct5_3, ct5_4, ct5_5, ct5_6, ct5_7, ct5_8,
    ct6_1, ct6_2, ct6_3, ct6_4, ct6_5, ct6_6, ct6_7, ct6_8,
    ct7_1, ct7_2, ct7_3, ct7_4, ct7_5, ct7_6, ct7_7, ct7_8,
    ct8_1, ct8_2, ct8_3, ct8_4, ct8_5, ct8_6, ct8_7, ct8_8  
        of 8, 8 horizontalSpacing=500 verticalSpacing=500; 


#Input Channels
CHANNEL c_in1 from p_in1 to ct1_1 channelWidth=100;
CHANNEL c_in2 from p_in2 to ct1_2 channelWidth=100;
CHANNEL c_in3 from p_in3 to ct1_3 channelWidth=100; 
CHANNEL c_in4 from p_in4 to ct1_4 channelWidth=100; 
CHANNEL c_in5 from p_in5 to ct1_5 channelWidth=100; 
CHANNEL c_in6 from p_in6 to ct1_6 channelWidth=100;
CHANNEL c_in7 from p_in7 to ct1_7 channelWidth=100;
CHANNEL c_in8 from p_in8 to ct1_8 channelWidth=100; 

#output channels
CHANNEL c_out1 from ct8_1 to p_out1 channelWidth=100;
CHANNEL c_out2 from ct8_2 to p_out2 channelWidth=100;
CHANNEL c_out3 from ct8_3 to p_out3 channelWidth=100; 
CHANNEL c_out4 from ct8_4 to p_out4 channelWidth=100; 
CHANNEL c_out5 from ct8_5 to p_out5 channelWidth=100; 
CHANNEL c_out6 from ct8_6 to p_out6 channelWidth=100;
CHANNEL c_out7 from ct8_7 to p_out7 channelWidth=100;
CHANNEL c_out8 from ct8_8 to p_out8 channelWidth=100; 

#row 1->2
CHANNEL c_g_1_2_1 from ct1_1 to ct2_1 channelWidth=100;
CHANNEL c_g_1_2_2 from ct1_2 to ct2_2 channelWidth=100;
CHANNEL c_g_1_2_3 from ct1_3 to ct2_3 channelWidth=100; 
CHANNEL c_g_1_2_4 from ct1_4 to ct2_4 channelWidth=100; 
CHANNEL c_g_1_2_5 from ct1_5 to ct2_5 channelWidth=100; 
CHANNEL c_g_1_2_6 from ct1_6 to ct2_6 channelWidth=100;
CHANNEL c_g_1_2_7 from ct1_7 to ct2_7 channelWidth=100;
CHANNEL c_g_1_2_8 from ct1_8 to ct2_8 channelWidth=100; 

#row 2->3
CHANNEL c_g_2_3_1 from ct2_1 to ct3_1 channelWidth=100;
CHANNEL c_g_2_3_2 from ct2_2 to ct3_2 channelWidth=100;
CHANNEL c_g_2_3_3 from ct2_3 to ct3_3 channelWidth=100; 
CHANNEL c_g_2_3_4 from ct2_4 to ct3_4 channelWidth=100; 
CHANNEL c_g_2_3_5 from ct2_5 to ct3_5 channelWidth=100; 
CHANNEL c_g_2_3_6 from ct2_6 to ct3_6 channelWidth=100;
CHANNEL c_g_2_3_7 from ct2_7 to ct3_7 channelWidth=100;
CHANNEL c_g_2_3_8 from ct2_8 to ct3_8 channelWidth=100; 

#row 3->4
CHANNEL c_g_3_4_1 from ct3_1 to ct4_1 channelWidth=100;
CHANNEL c_g_3_4_2 from ct3_2 to ct4_2 channelWidth=100;
CHANNEL c_g_3_4_3 from ct3_3 to ct4_3 channelWidth=100; 
CHANNEL c_g_3_4_4 from ct3_4 to ct4_4 channelWidth=100; 
CHANNEL c_g_3_4_5 from ct3_5 to ct4_5 channelWidth=100; 
CHANNEL c_g_3_4_6 from ct3_6 to ct4_6 channelWidth=100;
CHANNEL c_g_3_4_7 from ct3_7 to ct4_7 channelWidth=100;
CHANNEL c_g_3_4_8 from ct3_8 to ct4_8 channelWidth=100; 

#row 4->5
CHANNEL c_g_4_5_1 from ct4_1 to ct5_1 channelWidth=100;
CHANNEL c_g_4_5_2 from ct4_2 to ct5_2 channelWidth=100;
CHANNEL c_g_4_5_3 from ct4_3 to ct5_3 channelWidth=100; 
CHANNEL c_g_4_5_4 from ct4_4 to ct5_4 channelWidth=100; 
CHANNEL c_g_4_5_5 from ct4_5 to ct5_5 channelWidth=100; 
CHANNEL c_g_4_5_6 from ct4_6 to ct5_6 channelWidth=100;
CHANNEL c_g_4_5_7 from ct4_7 to ct5_7 channelWidth=100;
CHANNEL c_g_4_5_8 from ct4_8 to ct5_8 channelWidth=100; 

#row 5->6
CHANNEL c_g_5_6_1 from ct5_1 to ct6_1 channelWidth=100;
CHANNEL c_g_5_6_2 from ct5_2 to ct6_2 channelWidth=100;
CHANNEL c_g_5_6_3 from ct5_3 to ct6_3 channelWidth=100; 
CHANNEL c_g_5_6_4 from ct5_4 to ct6_4 channelWidth=100; 
CHANNEL c_g_5_6_5 from ct5_5 to ct6_5 channelWidth=100; 
CHANNEL c_g_5_6_6 from ct5_6 to ct6_6 channelWidth=100;
CHANNEL c_g_5_6_7 from ct5_7 to ct6_7 channelWidth=100;
CHANNEL c_g_5_6_8 from ct5_8 to ct6_8 channelWidth=100; 

#row 6->7
CHANNEL c_g_6_7_1 from ct6_1 to ct7_1 channelWidth=100;
CHANNEL c_g_6_7_2 from ct6_2 to ct7_2 channelWidth=100;
CHANNEL c_g_6_7_3 from ct6_3 to ct7_3 channelWidth=100; 
CHANNEL c_g_6_7_4 from ct6_4 to ct7_4 channelWidth=100; 
CHANNEL c_g_6_7_5 from ct6_5 to ct7_5 channelWidth=100; 
CHANNEL c_g_6_7_6 from ct6_6 to ct7_6 channelWidth=100;
CHANNEL c_g_6_7_7 from ct6_7 to ct7_7 channelWidth=100;
CHANNEL c_g_6_7_8 from ct6_8 to ct7_8 channelWidth=100; 

#row 7->8
CHANNEL c_g_7_8_1 from ct7_1 to ct8_1 channelWidth=100;
CHANNEL c_g_7_8_2 from ct7_2 to ct8_2 channelWidth=100;
CHANNEL c_g_7_8_3 from ct7_3 to ct8_3 channelWidth=100; 
CHANNEL c_g_7_8_4 from ct7_4 to ct8_4 channelWidth=100; 
CHANNEL c_g_7_8_5 from ct7_5 to ct8_5 channelWidth=100; 
CHANNEL c_g_7_8_6 from ct7_6 to ct8_6 channelWidth=100;
CHANNEL c_g_7_8_7 from ct7_7 to ct8_7 channelWidth=100;
CHANNEL c_g_7_8_8 from ct7_8 to ct8_8 channelWidth=100; 

END LAYER