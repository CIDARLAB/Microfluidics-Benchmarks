import numpy as np
import copy
from utils import *
from rowplace import *
import math as m

def row_route(CONNECTION,SPACING_MIN):
    # this routes between two adjacent rows, using vertical-horizontal-vertical pattern routing
    # it may need to push the locations of blocks in lower rows to ease the routing 
    # CONNECTION records each connection from the upper row to the lower row, each element: [x_up,x_low,id_up,id_low]
    # since the planarity is guaranteed, if x1_up>=x2_up,then x1_low>=x2_low
    THRESHOLD=100 # the threshold of rip-up & reroute iterations in each row
    y_location=np.zeros((len(CONNECTION))) # is the actual y distance from the upper row
    height=np.zeros((len(CONNECTION))) # is the height of the routing area, the lower should refer to it. 
    # height=abs(cnt_pos+1)*SPACING_MIN or height=abs(cnt_neg+1)*SPACING_MIN
    direction=np.zeros((len(CONNECTION)))
    if max(CONNECTION,key=lambda item: item[3])[1]<max(CONNECTION,key=lambda item: item[2])[1]:
        CONNECTION.sort(key=takeSecond) # if len_up>len_low, element with smaller x_low will be put in former place. otherwise, turnover
        for i in range(int(max(CONNECTION,key=lambda item: item[3])[1]-1)):
            id_st=99999
            id_ed=0
            for j in range(len(CONNECTION)):
                if CONNECTION[j][3]==i:
                    if j<=id_st:
                        id_st=j
                    if j>=id_ed:
                        id_ed=j
            if id_ed>=id_st:
                temp=copy.deepcopy(CONNECTION[id_st:id_ed+1])
                temp.sort(key=takeFirst)
                CONNECTION[id_st:id_ed+1]=copy.deepcopy(temp)

    else:
        CONNECTION.sort(key=takeFirst) 
        for i in range(int(max(CONNECTION,key=lambda item: item[2])[1]-1)):
            id_st=99999
            id_ed=0
            for j in range(len(CONNECTION)):
                if CONNECTION[j][2]==i:
                    if j<=id_st:
                        id_st=j
                    if j>=id_ed:
                        id_ed=j
            if id_ed>=id_st:
                temp=copy.deepcopy(CONNECTION[id_st:id_ed+1])
                # print(temp)
                temp.sort(key=takeSecond)
                # print(temp)
                CONNECTION[id_st:id_ed+1]=copy.deepcopy(temp)
        # print(CONNECTION)

    # independent routing
    cnt_pos=0
    cnt_neg=0
    for i in range(len(CONNECTION)):
        if CONNECTION[i][0]>CONNECTION[i][1]:
            cnt_pos+=1
            cnt_neg=0
            direction[i]=cnt_pos
        elif CONNECTION[i][0]==CONNECTION[i][1]:
            cnt_pos=0
            cnt_neg=0
            direction[i]=0
        else:
            cnt_pos=0
            cnt_neg+=1
            direction[i]=(-1)*cnt_neg
            
    real_l=max(abs(np.max(direction)),abs(np.min(direction)))
    
    routes=[]

    # compacting
    for i in range(len(direction)):
        if direction[i]<0:
            y_location[i]=((direction[i]+real_l+1))*SPACING_MIN
            height[i]=(abs(direction[i]+1))*SPACING_MIN
            routes.append([(direction[i]+real_l+1),CONNECTION[i][0],CONNECTION[i][1],i])
            # routes.append([(direction[i]+real_l+1),min(CONNECTION[i][0],CONNECTION[i][1]),max(CONNECTION[i][0],CONNECTION[i][1]),i])
        elif direction[i]>=0:
            y_location[i]=(direction[i])*SPACING_MIN
            height[i]=(abs(direction[i])+1)*SPACING_MIN
            routes.append([(direction[i]),CONNECTION[i][0],CONNECTION[i][1],i])
            # routes.append([(direction[i]),min(CONNECTION[i][0],CONNECTION[i][1]),max(CONNECTION[i][0],CONNECTION[i][1]),i])
    
    # print(real_l,routes)

    routes.sort(key=takeFirst, reverse=True)
    new_y_location=np.zeros((len(CONNECTION)))

    for i in range(len(routes)):
        target=real_l
        for j in range(len(routes)):
            if j!=i:
                if min(routes[j][1],routes[j][2])<=max(routes[i][1],routes[i][2]) and min(routes[i][1],routes[i][2])<=max(routes[j][1],routes[j][2]):
                    if routes[j][1]!=routes[i][1] and routes[j][2]!=routes[i][2]:
                        if routes[j][0]>routes[i][0]:
                            if routes[j][0]<=target:
                                target=routes[j][0]-1
                                
                    # if same terminal and same direstions
                    elif (routes[i][2]>routes[i][1] and routes[j][2]>routes[j][1]) or (routes[i][2]<routes[i][1] and routes[j][2]<routes[j][1]):
                        if routes[j][0]>routes[i][0] and routes[j][0]<=target:
                            target=routes[j][0] 
        routes[i][0]=target

    merged=[] 

    for i in range(len(routes)):
        merged.append([routes[i][0],min(routes[i][1],routes[i][2]),max(routes[i][1],routes[i][2]),[routes[i][3]]])

    # assign y_locations
    maxh=0
    minh=999
    
    for i in range(len(merged)):
        for j in range(len(merged[i][3])):
            new_y_location[int(merged[i][3][j])]=(merged[i][0]+1)*SPACING_MIN
            if (merged[i][0]+1)*SPACING_MIN>=maxh:
                maxh=(merged[i][0]+1)*SPACING_MIN
            if (merged[i][0]+1)*SPACING_MIN<=minh:
                minh=(merged[i][0]+1)*SPACING_MIN    
                
    # height=maxh-minh+1
    height=maxh
    
    # print(new_y_location,height)

    return new_y_location, height

# def fixoverlap(ROW, LOC, BLOCK, CONNECTION):
#     # connection: [x_up,x_low,id_up,id_low,port_id_up,port_id_low]
#     THRESHOLD=100 # maximum iterations to adjust for non-overlapping
#     for _ in range(THRESHOLD):
#         flag_all=1 # no overlapping for 1, overlapping for 0
#         for i in range(len(CONNECTION)):
#             # for the toppest row, only adjust the upper row
#             # for other rows, only adjust the bottom row
#             # if tthe overlapping hapens to the connection to the same device, then mirror the lower device will be done if all switching operations fail # 2.5 this is to be done later
#             for _ in range(THRESHOLD):
#                 flag_region=1
#                 for j in range(len(CONNECTION[i])):
#                     for k in range(len(CONNECTION[i]-j-1)):
#                         if ((CONNECTION[i][j][0]>CONNECTION[i][j+k+1][0]) and (CONNECTION[i][j][1]<CONNECTION[i][j+k+1][1])) or ((CONNECTION[i][j][0]<CONNECTION[i][j+k+1][0]) and (CONNECTION[i][j][1]>CONNECTION[i][j+k+1][1])):
#                             flag_region=0 # overlapping, this region needs to adjust
#                             flag_all=0 # this region is going to get adjusted, recheck everything is needed
#                             # switch the id_within_row to adjust, then break

#                             # if CONNECTION[i][j][2]==CONNECTION[i][j+k+1][2]:

#                             # elif CONNECTION[i][j][3]==CONNECTION[i][j+k+1][3]:


#                             if i==0:
#                                 switch(ROW,LOC,BLOCK,CONNECTION,0,i,CONNECTION[i][j][2],CONNECTION[i][j+k+1][2])
#                             else:
#                                 switch(ROW,LOC,BLOCK,CONNECTION,1,i,CONNECTION[i][j][3],CONNECTION[i][j+k+1][3])
#                         break             
                    
#                 if flag_region==1:
#                     break
                
#             if flag_all==0:
#                 break # one region has been adjusted, recheck from the start
            
#         if flag_all==1:
#             break                

            
# def switch(ROW1,LOC1,BLOCK1,CONNECTION1,TOP_OR_BOT, ID_OF_CONNECTION, id1, id2):
   # TOP_OR_BOT: 0 for top, 1 for bot
        

# # created on 2.25, a possible one-go solution of the order
# def decide_order_below(ORDER_UP, BIAS, RANGE, ROW, LOC, BLOCK, CONNECTION, ID_REGION):
#     # connection: [x_up,x_low,id_up,id_low,port_id_up,port_id_low]
#     # decide the order of the lower row according to the current order and bias of the upper row
#     # ORDER_UP shows the order of the upper row
#     # BIAS denotes the current number of attempts
#     # RANGE contains the number of possible combinations of the blocks connected to the same upper block, e.g. [1,2,1,1,1], means the second upper block has two lower blocks
#     tmp_connection=copy.deepcopy(CONNECTION[ID_REGION])

#     # tmporarily change the order of the upper row
#     for i in range(len(tmp_connection)):
#         tmp_connection[i][2]=ORDER_UP[int(tmp_connection[i][2])]
#     tmp_connection.sort(key=takeThird)


# def reorderrow(ROW, LOC, BLOCK, CONNECTION, ID_REGION, SPACING_MIN):
#     # connection: [x_up,x_low,id_up,id_low,port_id_up,port_id_low]

#     if ID_REGION==0:
#         # for the toppest row, change the order according to the second top row
#         mirror=np.zeros((len(ROW(-ID_REGION-1))))
#         neworder=[]

#         tmp_connection=copy.deepcopy(CONNECTION[ID_REGION])
#         tmp_connection.sort(key=takeFourth) 

#         current_id_u=-1
#         current_id_l=-1
#         for i in range(len(tmp_connection)):
#             if tmp_connection[i][2] not in neworder:
#                 neworder.append(tmp_connection[i][2])

                
#             current_id_l=tmp_connection[i][3]
#             current_id_u=tmp_connection[i][2]


        
#     else:
#         # for other rows, change according to their upper rows
#         mirror=np.zeros((len(ROW(-ID_REGION-2))))      
