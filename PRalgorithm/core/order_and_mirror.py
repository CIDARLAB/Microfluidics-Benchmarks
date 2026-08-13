import json
import numpy as np
import math as m
import copy
import matplotlib.pyplot as plt
import matplotlib.axes as ax
from utils import *

################ 3.3
def gen_port_relation(TREE,BLOCK,PORT):
    RELATION=[]
    for _ in range(len(TREE)):
        RELATION.append([])
    
    for t in TREE:
        ORDER_PORT=[]
        for i in range(len(PORT[t[2]])):
            # each element is [id,x] 
            match (t[3] % 360):
                case 0:
                    X=PORT[t[2]][i][0]
                case 90:
                    X=PORT[t[2]][i][1]      
                case 180:
                    X=BLOCK[t[0]][t[1]][0]-PORT[t[2]][i][0]
                case 270:
                    X=BLOCK[t[0]][t[1]][0]-PORT[t[2]][i][1]                
            ORDER_PORT.append([i,X])
        ORDER_PORT.sort(key=takeSecond)
        for o in ORDER_PORT:
            RELATION[t[2]].append(o[0])
    
    return RELATION

def gen_inrow_relation(ROW,CONNECTION,PORT_RELATION):
    # generate the relationship in each row, that according to its neighboring rows, what blocks should be placed next to each other
    # here CONNECTION don't need exact x values
    # connection: [x_up,x_low,id_up,id_low,port_id_up,port_id_low]
    # row: [data["items"][i]["row"],data["items"][i]["idinrow"],index,data["items"][i]["rotation"]
    
    # first, derive a raw set like: [[3],[2,4,1],[1,0]], term [2,4,1] means these three blocks are connected to the same block, and must be in this order if no mirror. 
    # another set contains the corresponding id_port
    ########### !!!3.4 here we negalect the situation that the elements of raw set have more than 2 overlapping blocks #################
    # term that has the same first/last element should be placed next to each other.
    
    CONNECTION_UP=copy.deepcopy(CONNECTION) # sort according to the connection situation to the upper row
    CONNECTION_DOW=copy.deepcopy(CONNECTION) # sort according to the lower row
    for i in range(len(CONNECTION)):
        CONNECTION_UP[i].sort(key=takeThird)
        CONNECTION_DOW[i].sort(key=takeFourth)
    
    # print(CONNECTION_DOW)
    
    raw=[] # raw has the same order of ROW
   
    for _ in range(len(ROW)):
        raw.append([])    
        
    for i in range(len(ROW)):
        # check upwards, if any blocks are connected to the same block in the upper row
        raw_up=[]
        raw_idport_up=[]
        if i!=len(ROW)-1: # except the top row
            flag=0
            raw_up.append([])
            raw_idport_up.append([])
            for c in CONNECTION_UP[-1-i]:
                if c[2]==flag:
                    raw_up[flag].append(c[3])
                    raw_idport_up[flag].append(c[4])
                else:
                    raw_up[-1]=order_acord_port(raw_up[-1],raw_idport_up[-1],PORT_RELATION[ROW[i+1][flag][2]])
                    flag+=1
                    raw_up.append([])
                    raw_idport_up.append([])
                    raw_up[flag].append(c[3])
                    raw_idport_up[flag].append(c[4])
            raw_up[-1]=order_acord_port(raw_up[-1],raw_idport_up[-1],PORT_RELATION[ROW[i+1][flag][2]])

        # check downwards
        raw_dow=[]
        raw_idport_dow=[]
        if i!=0: # except the bottom row
            flag=0
            raw_dow.append([])
            raw_idport_dow.append([])
            for c in CONNECTION_DOW[-i]:
                if c[3]==flag:
                    raw_dow[flag].append(c[2])
                    raw_idport_dow[flag].append(c[5])
                else:
                    raw_dow[-1]=order_acord_port(raw_dow[-1],raw_idport_dow[-1],PORT_RELATION[ROW[i-1][flag][2]])
                    flag+=1
                    raw_dow.append([])
                    raw_idport_dow.append([])
                    raw_dow[flag].append(c[2])
                    raw_idport_dow[flag].append(c[5])
            raw_dow[-1]=order_acord_port(raw_dow[-1],raw_idport_dow[-1],PORT_RELATION[ROW[i-1][flag][2]])  
            
        # print(i,raw_up,raw_idport_up,raw_dow,raw_idport_dow,merge(raw_up,raw_dow))
        # print(i,raw_up,raw_dow,merge(raw_up,raw_dow))
        raw[i]=merge(raw_up,raw_dow)

        # Fan-in to different ports of the same block in the lower row also
        # constrains the current row.  The previous logic could drop this
        # relation when it merged singletons with other constraints, which lets
        # top-row ports route to a lower multi-port component out of x order.
        if i != 0:
            by_lower = {}
            for c in CONNECTION_DOW[-i]:
                by_lower.setdefault(c[3], []).append(c)
            for group in by_lower.values():
                ordered = []
                seen = set()
                for c in sorted(group, key=takeSecond):
                    if c[2] not in seen:
                        ordered.append(c[2])
                        seen.add(c[2])
                if len(ordered) <= 1:
                    continue
                rev = copy.deepcopy(ordered)
                rev.reverse()
                if ordered not in raw[i] and rev not in raw[i]:
                    raw[i].append(ordered)

        for r in raw[i]:
            if [] in raw[i]:
                raw[i].pop(raw[i].index([]))
            else:
                break
        
    return raw

def order_acord_port(SET,ID_SET,PORT_RELATION):
    # reorder the elements in SET according to the order in PORT_RELATION
    tmp=[]
    for p in PORT_RELATION:
        if p in ID_SET:
            tmp.append(SET[ID_SET.index(p)])
    # SET=tmp
    return tmp
        
def merge(RAW1,RAW2):
    ### 3.4 may have problems with complex cases
    # merge the two raws
    if RAW1==[]:
        return RAW2
    elif RAW2==[]:
        return RAW1
    else:
        ### 3.4 version, just used to solve the single elements
        NEW=[]
        for r1 in RAW1:
            if len(r1)==1:
                flag=1
                for r2 in RAW2:
                    if (r1[0] in r2) and len(r2)!=1:
                        flag=0
                        tmp=copy.deepcopy(r2)
                        tmp.reverse()
                        if (r2 not in NEW) and (tmp not in NEW):
                            NEW.append(r2)
                if flag:
                    if r1 not in NEW:
                        NEW.append(r1)
            elif r1!=[]:
                tmp=copy.deepcopy(r1)
                tmp.reverse()
                if (r1 not in NEW) and (tmp not in NEW):
                    NEW.append(r1)       
            
        
        for r2 in RAW2:
            if len(r2)==1:
                flag=1
                for r1 in RAW1:
                    if (r2[0] in r1) and len(r1)!=1:
                        flag=0
                        tmp=copy.deepcopy(r1)
                        tmp.reverse()
                        if (r1 not in NEW) and (tmp not in NEW):
                            NEW.append(r1)
                if flag:
                    if r2 not in NEW:
                        NEW.append(r2)
            elif r2!=[]:
                tmp=copy.deepcopy(r2)
                tmp.reverse()
                if (r2 not in NEW) and (tmp not in NEW):
                    NEW.append(r2)       
    
        for nn in NEW:
            if len(nn)==1:
                for nn1 in NEW:
                    if len(nn1)!=1 and (nn[0] in nn1):
                        NEW.pop(NEW.index(nn))
                        break
    
        return NEW
        
# def gen_mirror(COMPON,ROW,CONNECTION,PORT_RELATION):
#     ########### 3.11 has bug #########################
#     CONNECTION_UP=copy.deepcopy(CONNECTION) # sort according to the connection situation to the upper row
#     CONNECTION_DOW=copy.deepcopy(CONNECTION) # sort according to the lower row
#     for i in range(len(CONNECTION)):
#         CONNECTION_UP[i].sort(key=takeThird)
#         CONNECTION_DOW[i].sort(key=takeFourth)
    
    
#     for i in range(len(ROW)):
#         # check upwards, if any blocks are connected to the same block in the upper row
#         raw_idport_up=[]
#         if i!=len(ROW)-1: # except the top row
#             flag=0
#             raw_idport_up.append([])
#             for c in CONNECTION_UP[-1-i]:
#                 if c[2]==flag:
#                     raw_idport_up[flag].append(c[4])
#                 else:
#                     mirror_or_not(COMPON[ROW[i+1][flag][2]],raw_idport_up[-1],PORT_RELATION[ROW[i+1][flag][2]])
#                     flag+=1
#                     raw_idport_up.append([])
#                     raw_idport_up[flag].append(c[4])
#             mirror_or_not(COMPON[ROW[i+1][flag][2]],raw_idport_up[-1],PORT_RELATION[ROW[i+1][flag][2]])

#         # check downwards
#         raw_idport_dow=[]
#         if i!=0: # except the bottom row
#             if i==2:
#                 print('!!!!!')
#                 print(CONNECTION_DOW[-i])
#             flag=0
#             raw_idport_dow.append([])
#             for c in CONNECTION_DOW[-i]:
#                 if c[3]==flag:
#                     raw_idport_dow[flag].append(c[5])
#                 else:
#                     mirror_or_not(COMPON[ROW[i-1][flag][2]],raw_idport_dow[-1],PORT_RELATION[ROW[i-1][flag][2]])
#                     flag+=1
#                     raw_idport_dow.append([])
#                     raw_idport_dow[flag].append(c[5])
#             mirror_or_not(COMPON[ROW[i-1][flag][2]],raw_idport_dow[-1],PORT_RELATION[ROW[i-1][flag][2]])  

def gen_mirror(COMPON,ROW,CONNECTION,PORT_RELATION):
    ########### 3.11 version, is tested on dx3_ref to be correct #########################
    # connection[i]=[x_up,x_low,id_up,id_low,port_id_up,port_id_low]
    CONNECTION_UP=copy.deepcopy(CONNECTION) # sort according to the connection situation to the upper row
    CONNECTION_DOW=copy.deepcopy(CONNECTION) # sort according to the lower row
    for i in range(len(CONNECTION)):
        CONNECTION_UP[i].sort(key=takeThird)
        CONNECTION_DOW[i].sort(key=takeFourth)
    
    for i in range(len(ROW)):
        # check upwards, if any blocks are connected to the same block in the upper row
        raw_idport_up=[]
        raw_idport_dow=[]
        for k in range(len(ROW[i])):
            raw_idport_up.append([])
            raw_idport_dow.append([])

        if i!=len(ROW)-1: # except the top row
            for c in CONNECTION_UP[-1-i]:
                raw_idport_up[c[3]].append(c[5])

        if i!=0: # except the bottom row
            for c in CONNECTION_DOW[-i]:
                raw_idport_dow[c[2]].append(c[4])

        for j in range(len(ROW[i])):
            if len(raw_idport_up[j])>1:
                mirror_or_not(COMPON[ROW[i][j][2]],raw_idport_up[j],PORT_RELATION[ROW[i][j][2]])
            if len(raw_idport_dow[j])>1:
                mirror_or_not(COMPON[ROW[i][j][2]],raw_idport_dow[j],PORT_RELATION[ROW[i][j][2]])




           


def mirror_or_not(COMPON,ID_SET,RELATION):
    # reorder the elements in SET according to the order in PORT_RELATION
    # print(COMPON,ID_SET,RELATION)
    tmp=[]
    for p in RELATION:
        if p in ID_SET:
            tmp.append(ID_SET[ID_SET.index(p)])
            
    if tmp!=ID_SET:
        COMPON[-1]=1

    

















###### 3.8 try to fix the reorder problem using DFS
        
# def dfs_in_row():
    # 3.8 this is relatively hard, think about this if the simple and brutle brutal traverse fails.
    # conduct dfs in each row to find feasible solutions according to the constraints
    # constraints include those from gen_inrow_relation, and the relative position of the upper row

def gen_sol_space(ROW,CONNECTION,ORDER_ABOVE,ID_ROW):
    # not applicable for the most top row, i.e. the ID_ROW=len(ROW)-1 row
    # ORDER_ABOVE is a list consisting the current order projection of the upper row
    # connection: [x_up,x_low,id_up,id_low,port_id_up,port_id_low]
    
    # each element in SPACE is [id1, id2, id3], meaning they are connected to the same block above, thus can have different order within
    # if idx is in more than one element of SPACE, then extract the idx out of these elements, and add a single-component element in between these elements
    # for ids not included in the SPACE, meaning they are not affacted by the above row, so can be anywhere.

    FREE_BLOCK=[] # contains the id of free blocks

    CONSTRAINED_BLOCK=[] # contains the id of constrained blocks according to the above row
    # block_in_which=[] # the i element records the index of SPACE, in which the block i is included

    for i in range(len(ROW[ID_ROW])):
        FREE_BLOCK.append(i)
        # block_in_which.append([])

    SPACE=[]

    # reorder connection
    connection_tmp=[]
    for oa in ORDER_ABOVE:
        for con in CONNECTION[len(ROW)-ID_ROW-2]:
            if con[2]==oa:
                connection_tmp.append(con)

    cnt=0
    SPACE.append([])
    for i in range(len(connection_tmp)):
        if connection_tmp[i][2]==ORDER_ABOVE[cnt]:
            SPACE[cnt].append(connection_tmp[i][3])
            
            if connection_tmp[i][3] not in CONSTRAINED_BLOCK:
                CONSTRAINED_BLOCK.append(connection_tmp[i][3])
                FREE_BLOCK.pop(FREE_BLOCK.index(connection_tmp[i][3])) # pop all the constrained ids out, and left free ids in FREE_BLOCK
            
            # block_in_which[connection_tmp[i][3]].append(cnt)
            
        else:
            cnt+=1
            SPACE.append([])
            SPACE[cnt].append(connection_tmp[i][3])
            
            if connection_tmp[i][3] not in CONSTRAINED_BLOCK:
                CONSTRAINED_BLOCK.append(connection_tmp[i][3])
                FREE_BLOCK.pop(FREE_BLOCK.index(connection_tmp[i][3])) # pop all the constrained ids out, and left free ids in FREE_BLOCK

            # block_in_which[connection_tmp[i][3]].append(cnt)
    
    # check if different elemnts in order have the same component
     # since we have inrow_relation, and the order of the above row has been checked accordingly, idx won't exist in non-adjacent elements
    
    # delete repeated blocks in each element of SPACE, and inster a single-component element in the middle of these original elements
    for cb in CONSTRAINED_BLOCK:
        IN_WHICH=[]
        
        for i in range(len(SPACE)):
            if cb in SPACE[i]:
                IN_WHICH.append(i)
                # here we assume each element in SPACE only contains one of each kind of id. meaning: [1,1,2] is not allowed, but [1,2] is valid

        if len(IN_WHICH)>1: # multiple elements in SPACE have the same block cb
            # since ORDER_ABOVE is constrained by the current row that only adjacent blocks above can conneted to the same block, elements in IN_WHICH are continous
            for j in IN_WHICH:
                SPACE[j].pop(SPACE[j].index(cb))
            
            position=int((IN_WHICH[0]+IN_WHICH[-1])/2)
            SPACE.insert(position,[cb])
            
    # delete all [] in SPACE
    for k in range(len(SPACE)):
        if [] in SPACE:
            SPACE.remove([])
        else:
            break
    
    # 3.9 this func might be finished, needs checking
    return SPACE, FREE_BLOCK

def cal_max_num_sol(SPACE, FREE_BLOCK):
    MAX_NUM_SOL=1
    BIT_OF_SOL=[]

    # print(SPACE)
    for sp in SPACE:
        MAX_NUM_SOL*=full_permutation(len(sp))
        BIT_OF_SOL.append(len(sp))

    for i in range(len(FREE_BLOCK)):
        MAX_NUM_SOL*=(len(SPACE)+1+i)

    return MAX_NUM_SOL, BIT_OF_SOL
        
def gen_subspace_order(SUB_SPACE, POINTER):
    # transform the POINTER to a binary list, each digit indicate the change of the original element
    binary_str = bin(POINTER)[2:]
    binary_str = binary_str.zfill(len(SUB_SPACE))
    PROJECTION = [int(digit) for digit in binary_str]
    # print(PROJECTION)

    # move the elements in SUB_SPACE accordingly
    loc=[]
    new=[]
    for j in range(len(SUB_SPACE)):
        loc.append(j)
        new.append(0)

    # !!! this is the important part to describe in the paper
    # from elements in latter part of loc, if PROJECTION is 1, update its position with +1
    # if the updated position doesn't exceed the upper bound, let the element whose old position==the updated postion, up date is with -1
    # else, reset the updated position as 0, and let all other positions +1
    for q in range(len(PROJECTION)):
        i=len(PROJECTION)-q-1
        if PROJECTION[i]:
            loc[i]+=1
            if loc[i]==len(loc):
                loc[i]-=len(loc)
                for k in range(len(loc)):
                    if k!=i:
                        loc[k]+=1
            else:
                for k in range(len(loc)):
                    if k!=i and loc[k]==loc[i]:
                            loc[k]-=1

    # print(loc)
    for i in range(len(loc)):
        new[loc[i]]=SUB_SPACE[i]
    
    return new

def gen_pointers(BIT_OF_SOL,FREE_BLOCK,POINTER_ROW):
    # generate pointers of different bits and free blocks
    # free block at latter place will have more solution space. e.g. [[...],[...],[...],1,2,3], 1 has 4 choices (how much forward from the default place), 2 has 5 choices, 3 has 6 choices
    free_block_solspace=[]
    for i in range(len(FREE_BLOCK)):
        free_block_solspace.append(i+len(BIT_OF_SOL)+1)

    tmp=free_block_solspace+BIT_OF_SOL
    aux=np.zeros((len(tmp))) # calculate how many numbers needed to get 1 up in each bit
    pointers=np.zeros((len(tmp)))
    for j in range(len(tmp)):
        i=len(tmp)-1-j
        if i!=len(tmp)-1:
            aux[i]=aux[i+1]*tmp[i]
        else:
            aux[i]=tmp[i]

    # print(tmp,aux)
    # calculate pointers
    cur=copy.deepcopy(POINTER_ROW)
    for k in range(len(aux)-1):
        pointers[k]=m.floor(cur/aux[k+1])
        cur-=m.floor(cur/aux[k+1])*aux[k+1]
        
    pointers[-1]=cur
    
    return pointers

def gen_order(SPACE,FREE_BLOCK,BIT_OF_SOL,MAX_NUM_SOL,POINTER_ROW):
    # BIT_OF_SOL contains the lenth of each element in SPACE, e.g. [2,1,1,3] for SPACE [[0,1],[2],[3],[4,5,6]]  
    if POINTER_ROW>=MAX_NUM_SOL:
        # means has reached the end of searching and fails to find further orders
        return []
    else:
        tmp_order=[]
        pointers=gen_pointers(BIT_OF_SOL,FREE_BLOCK,POINTER_ROW) # the first len(FREE_BLOCK) elements are for free blocks, others for constrained blocks
        # len(pointers)=len(FREE_BLOCK)+len(SPACE)
        # adjust the constrained blocks
        for i in range(len(SPACE)):
            # print(SPACE[i],pointers[len(FREE_BLOCK)+i])
            tmp_order.append(gen_subspace_order(SPACE[i], int(pointers[len(FREE_BLOCK)+i])))
        
        # then the free blocks
        for j in range(len(FREE_BLOCK)):
            tmp_order.insert(int(len(SPACE)+j-pointers[j]),[FREE_BLOCK[j]])
        
        # cancel all the "[" and "]" to get real order
        order=[]
        for ele in tmp_order:
            order=order+ele
        # print(pointers)
        return order

# print(gen_order([[11,12,13],[21,22,23,24],[31,32,33,34,35]],[4,5],[3,4,5],1200,3))


# def check_if_order_valid(ORDER,INROW_RELATION):
#     #### 25.9.9 this version succeeds in many cases, but not for all, for example dx13, needs a new one 
#     # checking if overlap
    
#     for rela in INROW_RELATION:
#         flag=1
#         for i in range(len(ORDER)):
#             if ORDER[i]==rela[0] and len(ORDER)-i>=len(rela):
#                 for j in range(len(rela)-1):
#                     if ORDER[i+j+1]!=rela[j+1]:
#                         flag=0
#                         break
#                 break
#             elif len(ORDER)-i<len(rela):
#                 flag=0
#                 break
    
#         # print(rela,flag)

#         if flag==0:
#             tmp_rela=copy.deepcopy(rela)
#             tmp_rela.reverse()
#             for i in range(len(ORDER)):
#                 if ORDER[i]==tmp_rela[0] and len(ORDER)-i>=len(tmp_rela):
#                     for j in range(len(tmp_rela)-1):
#                         if ORDER[i+j+1]!=tmp_rela[j+1]:
#                             return 0
#                     flag=1
#                     break
#                 elif len(ORDER)-i<len(tmp_rela):
#                     return 0
        
#     return 1

def check_if_order_valid(ID_CUR_CONNECTION_LAYER,ORDER,UP_ORDER,CONNECTION,INROW_RELATION):
    # 25.9.9 the new version of this function starts to build
    # print(ID_CUR_CONNECTION_LAYER)
    if UP_ORDER==[]:
        # the top most row
        # only needs to consider the INROW_RELATION
        for rela in INROW_RELATION:
            flag=1
            for i in range(len(ORDER)):
                if ORDER[i]==rela[0] and len(ORDER)-i>=len(rela):
                    for j in range(len(rela)-1):
                        if ORDER[i+j+1]!=rela[j+1]:
                            flag=0
                            break
                    break
                elif len(ORDER)-i<len(rela):
                    flag=0
                    break
        
            # print(rela,flag)

            if flag==0:
                tmp_rela=copy.deepcopy(rela)
                tmp_rela.reverse()
                for i in range(len(ORDER)):
                    if ORDER[i]==tmp_rela[0] and len(ORDER)-i>=len(tmp_rela):
                        for j in range(len(tmp_rela)-1):
                            if ORDER[i+j+1]!=tmp_rela[j+1]:
                                return 0
                        flag=1
                        break
                    elif len(ORDER)-i<len(tmp_rela):
                        return 0
        return 1
    
    # other rows
    # not only obey INROW_RELATION, but also needs to consider if overlaps with the previous row
    # stage 1, if overlap with the upper row
    # ID_CUR_CONNECTION_LAYER starts from 0, from the top row
    # connection[i]=[x_up,x_low,id_up,id_low,port_id_up,port_id_low]
    for id1 in range(len(CONNECTION[ID_CUR_CONNECTION_LAYER])):
        for delta_id in range(len(CONNECTION[ID_CUR_CONNECTION_LAYER])-id1-1):
            id2=id1+1+delta_id

            if CONNECTION[ID_CUR_CONNECTION_LAYER][id1][2]!=CONNECTION[ID_CUR_CONNECTION_LAYER][id2][2] and CONNECTION[ID_CUR_CONNECTION_LAYER][id1][3]!=CONNECTION[ID_CUR_CONNECTION_LAYER][id2][3]:
                # only check the connections between different blocks, not those connected to the same block
                # print(ID_CUR_CONNECTION_LAYER,UP_ORDER,ORDER)
                # print(CONNECTION[ID_CUR_CONNECTION_LAYER][id1][3],CONNECTION[ID_CUR_CONNECTION_LAYER][id2][3],CONNECTION[ID_CUR_CONNECTION_LAYER][id1][2],CONNECTION[ID_CUR_CONNECTION_LAYER][id2][2])
                if if_overlap(UP_ORDER.index(CONNECTION[ID_CUR_CONNECTION_LAYER][id1][2]),UP_ORDER.index(CONNECTION[ID_CUR_CONNECTION_LAYER][id2][2]),ORDER.index(CONNECTION[ID_CUR_CONNECTION_LAYER][id1][3]),ORDER.index(CONNECTION[ID_CUR_CONNECTION_LAYER][id2][3])):
                    return 0
                

    # stage 2,if obey INROW_RELATION
    for rela in INROW_RELATION:
        flag=1
        for i in range(len(ORDER)):
            if ORDER[i]==rela[0] and len(ORDER)-i>=len(rela):
                for j in range(len(rela)-1):
                    if ORDER[i+j+1]!=rela[j+1]:
                        flag=0
                        break
                break
            elif len(ORDER)-i<len(rela):
                flag=0
                break
    
        # print(rela,flag)

        if flag==0:
            tmp_rela=copy.deepcopy(rela)
            tmp_rela.reverse()
            for i in range(len(ORDER)):
                if ORDER[i]==tmp_rela[0] and len(ORDER)-i>=len(tmp_rela):
                    for j in range(len(tmp_rela)-1):
                        if ORDER[i+j+1]!=tmp_rela[j+1]:
                            return 0
                    flag=1
                    break
                elif len(ORDER)-i<len(tmp_rela):
                    return 0
                
    return 1










def if_overlap(low1, low2, up1, up2):
    # 1 for overlap, 0 for not overlap
    if (low1<low2 and up1>up2) or (low1>low2 and up1<up2):
        return 1
    else:
        return 0



def dfs_order_generation(ROW,ID_R,CONNECTION,INROW_RELATION,ORDER_ABOVE,ORDER):
    # starts from top, so ROW[ID_ROW], then ID_ROW-=1
    space,free_block=gen_sol_space(ROW,CONNECTION,ORDER_ABOVE,ID_R)
    max_num_sol,bit_of_sol=cal_max_num_sol(space,free_block)

    # if ID_R==1:
    #     print(space,free_block,bit_of_sol,max_num_sol)

    if ID_R-1>=0:
        for i in range(max_num_sol):
            ORDER_CUR=gen_order(space,free_block,bit_of_sol,max_num_sol,i)
            # ID_CUR_CONNECTION_LAYER,ORDER,UP_ORDER,CONNECTION,INROW_RELATION

            if check_if_order_valid(len(ROW)-ID_R-2,ORDER_CUR,ORDER_ABOVE,CONNECTION,INROW_RELATION[ID_R]):
                
                flag=dfs_order_generation(ROW,ID_R-1,CONNECTION,INROW_RELATION,ORDER_CUR,ORDER)
                if flag:
                    ORDER[ID_R]=ORDER_CUR
                    return 1
        return 0
    else:        
        # the 0 row
        for i in range(max_num_sol):
            ORDER_CUR=gen_order(space,free_block,bit_of_sol,max_num_sol,i)
            flag=check_if_order_valid(len(ROW)-ID_R-2,ORDER_CUR,ORDER_ABOVE,CONNECTION,INROW_RELATION[ID_R])
            if flag:
                ORDER[ID_R]=ORDER_CUR
                return 1
        return 0

def reorder(ROW,CONNECTION,INROW_RELATION):
    ####################### MAIN #######################
    # gen_sol_space(ROW,CONNECTION,ORDER_ABOVE,ID_ROW)
    # the order of these lists are from top to down, different from ROW
    # order=[]
    # space=[]
    # free_block=[]

    new_order=[]
    for i in range(len(ROW)):
        new_order.append([])

    # the topmost row
    space_0=[] # relates to constrained blocks
    free_block_0=[] # relates to non-constrained blocks
    for i in range(len(ROW[-1])):
        free_block_0.append(i)

    max_num_sol_0,bit_of_sol_0=cal_max_num_sol(space_0,free_block_0)

    #### dfs based order generation
    for i in range(max_num_sol_0):
        ORDER_CUR=gen_order(space_0,free_block_0,bit_of_sol_0,max_num_sol_0,i)
        # ID_CUR_CONNECTION_LAYER,ORDER,UP_ORDER,CONNECTION,INROW_RELATION
        if check_if_order_valid([],ORDER_CUR,[],CONNECTION,INROW_RELATION[len(ROW)-1]):
            flag=dfs_order_generation(ROW,len(ROW)-2,CONNECTION,INROW_RELATION,ORDER_CUR,new_order)
            # print(i,ORDER_CUR,flag)
            if flag:
                new_order[len(ROW)-1]=ORDER_CUR
                return new_order
        
        # print(max_num_sol_0,new_order)
    return []

def apply_new_order(TREE,NEW_ORDER):
    for t in TREE:
        new_idinrow=NEW_ORDER[t[0]].index(t[1])
        t[1]=new_idinrow
    
