import numpy as np
from utils import *

# sealed on 2023.12.15, as a backup version
# def init_rowplace(MAX_DEPTH,TREE,COMPON,DIS):
#     # TREE contains a tree, each element: [current depth, order in the row from left to right, the index of the component in COMPON, rotation]
#     # index, depth and order start from 0 # very important!!!
#     # rotation can be 0, 90, 180, 270. clockwise
#     # COMPON is the list consisting all components, eahc element: [index, width, length]
#     # DIS is the extra distance reserved between two rows for the ease of routing
#     init_row=[]
#     init_loc=[] # each block's (x-min, y-min) point represents its location
#     init_block=[] # each is [width, length]
#     for _ in range(MAX_DEPTH):
#         init_row.append([])
#         init_loc.append([]) 
#         init_block.append([])

#     for i in range(len(TREE)):
#         # init_loc[ele[0]].append([0,0]) # [x,y]
#         init_row[TREE[i][0]].append(TREE[i])
#         init_loc[TREE[i][0]].append([0,0])
#         init_block[TREE[i][0]].append([0,0])
#         # if init_row[TREE[i][0]]==[]:
#         #     init_row[TREE[i][0]].append(TREE[i])
#         #     init_loc[TREE[i][0]].append([0,0])
#         #     init_block[TREE[i][0]].append([0,0])
#         # else:
#         #     init_loc[TREE[i][0]].append([0,0])
#         #     init_block[TREE[i][0]].append([0,0])
     
#             # idx = 0
#             # for j in range(len(init_row[TREE[i][0]])):
#             #     if TREE[i][0]==0:
#             #         print(init_row[0])
#             #     idx += 1
#             #     if TREE[i][1]>init_row[TREE[i][0]][j][1]:
#             #         init_row[TREE[i][0]].insert(idx,TREE[i])
#             #         break
#     for i in range(len(init_row)):
#         init_row[i].sort(key=takeSecond)

#     # print(len(init_loc),len(init_block))
#     # print(len(init_loc[0]),len(init_row[0]))
    
#     current_y = 0
#     for row_idx in range(len(init_row)):
#         max_l = 0
#         current_x = 0
#         for com in init_row[row_idx]:
#             # this starts from the behind
#             # print(init_loc[row_idx])
#             # print(com)
#             init_loc[row_idx][com[1]][0]=current_x
#             init_loc[row_idx][com[1]][1]=current_y
#             if com[3]==0 or com[3]==180:
#                 init_block[row_idx][com[1]][0]=COMPON[com[2]][1]
#                 init_block[row_idx][com[1]][1]=COMPON[com[2]][2]

#                 current_x += COMPON[com[2]][1]
#                 if COMPON[com[2]][2]>max_l:
#                     max_l = COMPON[com[2]][2]
#             else:
#                 init_block[row_idx][com[1]][0]=COMPON[com[2]][2]
#                 init_block[row_idx][com[1]][1]=COMPON[com[2]][1]
        
#                 current_x += COMPON[com[2]][2]
#                 if COMPON[com[2]][1]>max_l:
#                     max_l = COMPON[com[2]][1]

#         current_y += max_l+DIS
    
#     return init_row,init_loc,init_block
    
def init_rowplace(MAX_DEPTH,TREE,COMPON,DIS,SPACING_HOR):
    # TREE contains a tree, each element: [current depth, order in the row from left to right, the index of the component in COMPON, rotation]
    # index, depth and order start from 0 # very important!!!
    # rotation can be 0, 90, 180, 270. clockwise
    # COMPON is the list consisting all components, eahc element: [index, width, length, name]
    # DIS is the extra distance reserved between two rows for the ease of routing
    init_row=[]
    init_loc=[] # each block's (x-min, y-min) point represents its location
    init_block=[] # each is [width, length]
    for _ in range(MAX_DEPTH):
        init_row.append([])
        init_loc.append([]) 
        init_block.append([])

    for i in range(len(TREE)):
        init_row[TREE[i][0]].append(TREE[i])
        init_loc[TREE[i][0]].append([0,0])
        init_block[TREE[i][0]].append([0,0])
        
    for i in range(len(init_row)):
        init_row[i].sort(key=takeSecond)
    
    current_y = 0
    for row_idx in range(len(init_row)):
        max_l = 0
        current_x = 0
        for com in init_row[row_idx]:
            # this starts from the behind
            init_loc[row_idx][com[1]][0]=current_x
            init_loc[row_idx][com[1]][1]=current_y
            if com[3]==0 or com[3]==180:
                init_block[row_idx][com[1]][0]=COMPON[com[2]][1]
                init_block[row_idx][com[1]][1]=COMPON[com[2]][2]

                current_x += (COMPON[com[2]][1]+SPACING_HOR)
                if COMPON[com[2]][2]>max_l:
                    max_l = COMPON[com[2]][2]
            else:
                init_block[row_idx][com[1]][0]=COMPON[com[2]][2]
                init_block[row_idx][com[1]][1]=COMPON[com[2]][1]
        
                current_x += (COMPON[com[2]][2]+SPACING_HOR)
                if COMPON[com[2]][1]>max_l:
                    max_l = COMPON[com[2]][1]

        current_y += max_l+DIS
    
    return init_row,init_loc,init_block

def howmuchcanup(X,Y,WID,LOC,BLOCK):
    much=99999999999
    for i in range(len(LOC)):
        for j in range(len(LOC[i])):
            #if in the path up
            if LOC[i][j][0]<X+WID and LOC[i][j][0]+BLOCK[i][j][0]>X:
                # if below:
                if LOC[i][j][1]+BLOCK[i][j][1]<=Y:
                    if much>(Y-LOC[i][j][1]-BLOCK[i][j][1]):
                        much=Y-LOC[i][j][1]-BLOCK[i][j][1]
    return much

def compact(ROW,LOC,BLOCK):
    # only compact blocks, ignoring routes
    for I in range(len(ROW)-1):
        i=I+1
        # skip the first row
        for j in range(len(ROW[i])):
            stepwidth=howmuchcanup(LOC[i][j][0],LOC[i][j][1],BLOCK[i][j][0],LOC,BLOCK)
            # print(stepwidth)
            LOC[i][j][1]-=stepwidth

def make_symetric(LOC,BLOCK):
    width=[]
    for i in range(len(LOC)):
        # print(LOC)
        # print(BLOCK)
        # print(len(LOC[i]),len(BLOCK[i]))
        width.append(LOC[i][-1][0]+BLOCK[i][-1][0])
        
    widest=np.max(width)
    for i in range(len(LOC)):
        for j in range(len(LOC[i])):
            LOC[i][j][0]+=(widest-width[i])/2

    return widest/2, width.index(widest)

# Below are updated on 2023.12.2, but haven't been tested yet.
# expected: routes compact to the top of each row, and the row above compact to the top of the routes.
def howmuchcanup_in_routes(X,Y,WID,CONNECTION_between,ROUTES_between,loc,block):
    # print(X,Y,WID,CONNECTION_between,ROUTES_between)
    # ROUTES_between only contains the relative y location of routes in between the current row and the row below
    # similarly, CONNECTION_between only contains the x_up, x_low of routes in between
    much=99999999999
    for i in range(len(ROUTES_between)):
        #if in the path up
        if min(CONNECTION_between[i][0],CONNECTION_between[i][1])<=X+WID and max(CONNECTION_between[i][0],CONNECTION_between[i][1])>=X:
            # if below:
            if ROUTES_between[i]<=Y:
                if much>=(Y-ROUTES_between[i]):
                    much=Y-ROUTES_between[i]

    for j in range(len(loc)):
        if X<=loc[j][0]+block[j][0] and X+WID>=loc[j][0]:
            if much>=Y-(loc[j][1]+block[j][1]):
                much=Y-(loc[j][1]+block[j][1])
    
    # print(much)
    return much

# THIS VERSION HAS PROBLEMS, AND THE VERSION BELOW THIS ONE WORKS FINE. 2023.12.4
# def compact_new(ROW,LOC,BLOCK,CONNECTION,ROUTES,HEIGHTS,SPACING):
#     # compact both blocks and routes
#     Y_ROUTES=[] # the new actual y location of routes
#     for I in range(len(ROW)-1):
#         top=0
#         for t in range(len(ROW[I])):
#             if LOC[I][t][1]+BLOCK[I][t][1]>=top:
#                 top=LOC[I][t][1]+BLOCK[I][t][1]

#         Y_ROUTES.append([])
#         for k in range(len(ROUTES[I])):
#             # print(Y_ROUTES)
#             Y_ROUTES[I].append(top+SPACING+HEIGHTS[I]-ROUTES[I][k])
            

#         i=I+1
#         # skip the first row, which is at the bottom
#         for j in range(len(ROW[i])):
#             stepwidth=howmuchcanup_in_routes(LOC[i][j][0],LOC[i][j][1],BLOCK[i][j][0],CONNECTION[I],Y_ROUTES[I])
#             # print(stepwidth)
#             LOC[i][j][1]-=(stepwidth-SPACING)
    
#     return Y_ROUTES


def compact_new(ROW,LOC,BLOCK,CONNECTION,ROUTES,HEIGHTS,SPACING):
    # 2025.9.9, fixing bug of infinite y axis, done
    # compact both blocks and routes
    Y_ROUTES=[] # the new actual y location of routes
    for I in range(len(ROW)-1):
        route_idx=-1-I
        region_spacing=SPACING[route_idx] if isinstance(SPACING, list) else SPACING
        if isinstance(region_spacing, (tuple, list)):
            lower_spacing, upper_spacing=region_spacing
        else:
            lower_spacing=region_spacing
            upper_spacing=region_spacing
        top=0
        for t in range(len(ROW[I])):
            if LOC[I][t][1]+BLOCK[I][t][1]>=top:
                top=LOC[I][t][1]+BLOCK[I][t][1]

        Y_ROUTES.append([])
        for k in range(len(ROUTES[route_idx])):
            # print(Y_ROUTES)
            Y_ROUTES[I].append(top+lower_spacing+HEIGHTS[route_idx]-ROUTES[route_idx][k])
        
        # print(I,Y_ROUTES)
        i=I+1
        # skip the first row, which is at the bottom
        final_stepwidth=99999999999
        for j in range(len(ROW[i])):
            stepwidth=howmuchcanup_in_routes(LOC[i][j][0],LOC[i][j][1],BLOCK[i][j][0],CONNECTION[route_idx],Y_ROUTES[I],LOC[i-1][:][:],BLOCK[i-1][:][:])
            # print(i,j,stepwidth)
            if stepwidth<=final_stepwidth:
                final_stepwidth=stepwidth

        for j in range(len(ROW[i])):
            LOC[i][j][1]-=(final_stepwidth-upper_spacing)

    return Y_ROUTES



def decide_rotation(COMPON,TREE,PORT,CONNECTION):
    # compon [i,design["components"][i]["x-span"],design["components"][i]["y-span"],design["components"][i]["name"]
    # tree [data["items"][i]["row"],data["items"][i]["idinrow"],index,data["items"][i]["rotation"]]
    # port[i][j] is the j+1 th port of compon i, [DICT["components"]["ports"][j]["x"],DICT["components"]["ports"][j]["y"]
    # connection: id_region,x_up,x_low,id_up,id_low,port_id_up,port_id_low
    maxnum=max(TREE,key=takeFirst)[0]
    for t in TREE:
        cost=[0,0,0,0] # stands for the cost of rotating 0,90,180,270 degree
        idport_up_connection=[] # stores the info of up [[id_region][k th connection in id_region th region]]
        idport_down_connection=[] # stores the info of down [[id_region][k th connection in id_region th region]]

        # find all connections
        if t[0]<=maxnum-1:
            # upward
            for id_con_upward in range(len(CONNECTION[maxnum-t[0]-1])):
                if CONNECTION[maxnum-t[0]-1][id_con_upward][3]==t[1]:
                    idport_up_connection.append(CONNECTION[maxnum-t[0]-1][id_con_upward][5])

        if t[0]>=1:
            # downward
            for id_con_downward in range(len(CONNECTION[maxnum-t[0]])): 
                if CONNECTION[maxnum-t[0]][id_con_downward][2]==t[1]:      
                    idport_down_connection.append(CONNECTION[maxnum-t[0]][id_con_downward][4])      


        # print(PORT)
        # calculate costs
        # rotate clockwise
        # 0
        print(COMPON[t[2]],PORT[t[2]])
        hig=COMPON[t[2]][2]
        if hig!=0:
            for idu in idport_up_connection:
                cost[0]+=(hig-PORT[t[2]][idu][1])/hig
            for idd in idport_down_connection:
                cost[0]+=(PORT[t[2]][idd][1])/hig        

        # 90
        hig=COMPON[t[2]][1]
        if hig!=0:
            for idu in idport_up_connection:
                cost[1]+=(PORT[t[2]][idu][0])/hig
            for idd in idport_down_connection:
                cost[1]+=(hig-PORT[t[2]][idd][0])/hig    

        # 180
        hig=COMPON[t[2]][2]
        if hig!=0:
            for idu in idport_up_connection:
                cost[2]+=(PORT[t[2]][idu][1])/hig
            for idd in idport_down_connection:
                cost[2]+=(hig-PORT[t[2]][idd][1])/hig    
                
        # 270
        hig=COMPON[t[2]][1]
        if hig!=0:
            for idu in idport_up_connection:
                cost[3]+=(hig-PORT[t[2]][idu][0])/hig
            for idd in idport_down_connection:
                cost[3]+=(PORT[t[2]][idd][0])/hig            
        
        # decide the rotation according to the minimum cost
        rot_degree=90*cost.index(min(cost))
        t[3]=rot_degree

def get_connect_rela(ID_ROW,ROW,CONNECTION,UP_OR_DOWN):
    # for the 3rd stage, get the connection relationship accoring to the former row.
    RELA=[]
    for _ in range(len(ROW[ID_ROW])):
        RELA.append([])

    # connection[i]=[x_up,x_low,id_up,id_low,port_id_up,port_id_low]
    if UP_OR_DOWN:
        # 1 for upper former row, 0 for down former row
        for CON in CONNECTION[len(ROW)-2-ID_ROW]:
            RELA[CON[3]].append([CON[5],CON[2],CON[4]])
            # idport,idup,idupport

    else:
        # 1 for upper former row, 0 for down former row
        for CON in CONNECTION[len(ROW)-1-ID_ROW]:
            # print(CON,len(RELA),ROW[ID_ROW])
            RELA[CON[2]].append([CON[4],CON[3],CON[5]])
            # idport,iddown,iddownport
    return RELA 

def get_certain_connect_rela(ID_ROW,ID_IN_ROW,ROW,CONNECTION,UP_OR_DOWN):
    # for the 3rd stage, get the connection relationship accoring to the former row.
    RELA=[]

    # connection[i]=[x_up,x_low,id_up,id_low,port_id_up,port_id_low]
    if UP_OR_DOWN:
        # 1 for upper former row, 0 for down former row
        for CON in CONNECTION[len(ROW)-2-ID_ROW]:
            if CON[3]==ID_IN_ROW:
                RELA.append([CON[5],CON[2],CON[4]])
            # idport,idup,idupport

    else:
        # 1 for upper former row, 0 for down former row
        for CON in CONNECTION[len(ROW)-1-ID_ROW]:
            # print(CON,len(RELA),ROW[ID_ROW])
            if CON[2]==ID_IN_ROW:
                RELA.append([CON[4],CON[3],CON[5]])
            # idport,iddown,iddownport
    return RELA 


def decide_newx(CURROW,CURID,CURRELA,ROW,LOC,BLOCK,COMPON,PORT,UP_OR_LOW):
    if len(CURRELA)==0:
        return 999999999999 # means follow can2
    elif len(CURRELA)==1:
        delta_potx_loc=portx(LOC[CURROW][CURID][0],
            PORT[ROW[CURROW][CURID][2]][CURRELA[0][0]][0],PORT[ROW[CURROW][CURID][2]][CURRELA[0][0]][1],
            ROW[CURROW][CURID][3],COMPON[ROW[CURROW][CURID][2]][1],COMPON[ROW[CURROW][CURID][2]][2],COMPON[ROW[CURROW][CURID][2]][-1])-LOC[CURROW][CURID][0]
        if UP_OR_LOW==0:
            # 0 for lower former row, 1 for upper former row

            return -delta_potx_loc + portx(LOC[CURROW-1][CURRELA[0][1]][0],
                         PORT[ROW[CURROW-1][CURRELA[0][1]][2]][CURRELA[0][2]][0],PORT[ROW[CURROW-1][CURRELA[0][1]][2]][CURRELA[0][2]][1],
                         ROW[CURROW-1][CURRELA[0][1]][3],COMPON[ROW[CURROW-1][CURRELA[0][1]][2]][1],COMPON[ROW[CURROW-1][CURRELA[0][1]][2]][2],COMPON[ROW[CURROW-1][CURRELA[0][1]][2]][-1])
        else:
            return -delta_potx_loc + portx(LOC[CURROW+1][CURRELA[0][1]][0],
                         PORT[ROW[CURROW+1][CURRELA[0][1]][2]][CURRELA[0][2]][0],PORT[ROW[CURROW+1][CURRELA[0][1]][2]][CURRELA[0][2]][1],
                         ROW[CURROW+1][CURRELA[0][1]][3],COMPON[ROW[CURROW+1][CURRELA[0][1]][2]][1],COMPON[ROW[CURROW+1][CURRELA[0][1]][2]][2],COMPON[ROW[CURROW+1][CURRELA[0][1]][2]][-1])
    else:
        total=0
        if UP_OR_LOW==0:
            for k in range(len(CURRELA)):
                delta_potx_loc=portx(LOC[CURROW][CURID][0],
                    PORT[ROW[CURROW][CURID][2]][CURRELA[k][0]][0],PORT[ROW[CURROW][CURID][2]][CURRELA[k][0]][1],
                    ROW[CURROW][CURID][3],COMPON[ROW[CURROW][CURID][2]][1],COMPON[ROW[CURROW][CURID][2]][2],COMPON[ROW[CURROW][CURID][2]][-1])-LOC[CURROW][CURID][0]
                total+=(-delta_potx_loc + portx(LOC[CURROW-1][CURRELA[k][1]][0],
                         PORT[ROW[CURROW-1][CURRELA[k][1]][2]][CURRELA[k][2]][0],PORT[ROW[CURROW-1][CURRELA[k][1]][2]][CURRELA[k][2]][1],
                         ROW[CURROW-1][CURRELA[k][1]][3], COMPON[ROW[CURROW-1][CURRELA[k][1]][2]][1],COMPON[ROW[CURROW-1][CURRELA[k][1]][2]][2],COMPON[ROW[CURROW-1][CURRELA[k][1]][2]][-1]))
        else:
            for k in range(len(CURRELA)):
                delta_potx_loc=portx(LOC[CURROW][CURID][0], PORT[ROW[CURROW][CURID][2]][CURRELA[k][0]][0],PORT[ROW[CURROW][CURID][2]][CURRELA[k][0]][1], ROW[CURROW][CURID][3],COMPON[ROW[CURROW][CURID][2]][1],COMPON[ROW[CURROW][CURID][2]][2],COMPON[ROW[CURROW][CURID][2]][-1])-LOC[CURROW][CURID][0]
 
                total+=(-delta_potx_loc + portx(LOC[CURROW+1][CURRELA[k][1]][0], PORT[ROW[CURROW+1][CURRELA[k][1]][2]][CURRELA[k][2]][0],PORT[ROW[CURROW+1][CURRELA[k][1]][2]][CURRELA[k][2]][1], ROW[CURROW+1][CURRELA[k][1]][3],COMPON[ROW[CURROW+1][CURRELA[k][1]][2]][1],COMPON[ROW[CURROW+1][CURRELA[k][1]][2]][2],COMPON[ROW[CURROW+1][CURRELA[k][1]][2]][-1]))
        
        CAN=total/len(CURRELA)
        return CAN



def portx(X_DEVICE1,X_PORT,Y_PORT,ROTATION,X_SPAN,Y_SPAN,MIRROR):
    X_DEVICE=X_DEVICE1
    if MIRROR:
        # mirror
        match (ROTATION % 360):
            case 0:
                return X_DEVICE+X_SPAN-X_PORT

            case 90:
                return X_DEVICE+Y_SPAN-Y_PORT

            case 180:
                return X_DEVICE+X_PORT

            case 270:   
                return X_DEVICE+Y_PORT
       
    else:
        # no mirror
        match (ROTATION % 360):
            case 0:
                return X_DEVICE+X_PORT

            case 90:
                return X_DEVICE+Y_PORT

            case 180:
                return X_DEVICE+(X_SPAN-X_PORT)

            case 270:       
                return X_DEVICE+(Y_SPAN-Y_PORT)
