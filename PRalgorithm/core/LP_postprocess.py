import numpy as np
from scipy.optimize import linprog

def LP_opt(COMPON, ROW, BLOCK, LOCATION, PORT, CONNECTIONS, SPACING, CUR_MAX_X):
    # vary the x locations for better results
    n_total=0
    n_in_row=[]
    for i in range(len(LOCATION)):
        n_in_row.append(len(LOCATION[i]))
        n_total+=len(LOCATION[i])

    total_connection=0
    for i in range(len(CONNECTIONS)):
        for j in range(len(CONNECTIONS[i])):
            total_connection+=1

    # initialize
    c=np.zeros((n_total+total_connection)) # n_total for the variales, len(CONNECTIONS) for the assistant variables (for the L1 norm)
    A_ub=[]
    b_ub=[]
    # A_eq=[]
    # b_eq=[]

    # objective, minimum wirelength
    for i in range(total_connection):
        c[n_total+i]=1

    # gen the defination of assistant variables via INequality constraints
    cnt=0
    for i in range(len(CONNECTIONS)):
        for j in range(len(CONNECTIONS[i])):
            cnt+=1
            # tmp_variable=abs(x_id1-x_id2+offset)
            id1=get_idx(n_in_row, len(LOCATION)-i-1, int(CONNECTIONS[i][j][2]))
            id2=get_idx(n_in_row, len(LOCATION)-i-2, int(CONNECTIONS[i][j][3]))
            offset=0

            # the up one
            if COMPON[ROW[-i-1][int(CONNECTIONS[i][j][2])][2]][-1]:
                # mirror
                match (ROW[-i-1][int(CONNECTIONS[i][j][2])][3] % 360):
                    case 0:
                        offset+=BLOCK[-i-1][int(CONNECTIONS[i][j][2])][0]-PORT[ROW[-i-1][int(CONNECTIONS[i][j][2])][2]][CONNECTIONS[i][j][4]][0]
                    case 90:
                        offset+=BLOCK[-i-1][int(CONNECTIONS[i][j][2])][0]-PORT[ROW[-i-1][int(CONNECTIONS[i][j][2])][2]][CONNECTIONS[i][j][4]][1]                
                    case 180:
                        offset+=PORT[ROW[-i-1][int(CONNECTIONS[i][j][2])][2]][CONNECTIONS[i][j][4]][0]
                    case 270:
                        offset+=PORT[ROW[-i-1][int(CONNECTIONS[i][j][2])][2]][CONNECTIONS[i][j][4]][1]                
            else:
                # no mirror
                match (ROW[-i-1][int(CONNECTIONS[i][j][2])][3] % 360):
                    case 0:
                        offset+=+PORT[ROW[-i-1][int(CONNECTIONS[i][j][2])][2]][CONNECTIONS[i][j][4]][0]
                    case 90:
                        offset+=PORT[ROW[-i-1][int(CONNECTIONS[i][j][2])][2]][CONNECTIONS[i][j][4]][1]                
                    case 180:
                        offset+=BLOCK[-i-1][int(CONNECTIONS[i][j][2])][0]-PORT[ROW[-i-1][int(CONNECTIONS[i][j][2])][2]][CONNECTIONS[i][j][4]][0]
                    case 270:
                        offset+=BLOCK[-i-1][int(CONNECTIONS[i][j][2])][0]-PORT[ROW[-i-1][int(CONNECTIONS[i][j][2])][2]][CONNECTIONS[i][j][4]][1]                
            

            # the low one
            if COMPON[ROW[-i-2][int(CONNECTIONS[i][j][3])][2]][-1]:
                # mirror
                match (ROW[-i-2][int(CONNECTIONS[i][j][3])][3] % 360):
                    case 0:
                        offset-=BLOCK[-i-2][int(CONNECTIONS[i][j][3])][0]-PORT[ROW[-i-2][int(CONNECTIONS[i][j][3])][2]][CONNECTIONS[i][j][5]][0]
                    case 90:
                        offset-=BLOCK[-i-2][int(CONNECTIONS[i][j][3])][0]-PORT[ROW[-i-2][int(CONNECTIONS[i][j][3])][2]][CONNECTIONS[i][j][5]][1]
                    case 180:
                        offset-=PORT[ROW[-i-2][int(CONNECTIONS[i][j][3])][2]][CONNECTIONS[i][j][5]][0]
                    case 270:
                        offset-=PORT[ROW[-i-2][int(CONNECTIONS[i][j][3])][2]][CONNECTIONS[i][j][5]][1]
        
            else:
                # no mirror
                match (ROW[-i-2][int(CONNECTIONS[i][j][3])][3] % 360):
                    case 0:
                        offset-=PORT[ROW[-i-2][int(CONNECTIONS[i][j][3])][2]][CONNECTIONS[i][j][5]][0]
                    case 90:
                        offset-=PORT[ROW[-i-2][int(CONNECTIONS[i][j][3])][2]][CONNECTIONS[i][j][5]][1]
                    case 180:
                        offset-=BLOCK[-i-2][int(CONNECTIONS[i][j][3])][0]-PORT[ROW[-i-2][int(CONNECTIONS[i][j][3])][2]][CONNECTIONS[i][j][5]][0]
                    case 270:
                        offset-=BLOCK[-i-2][int(CONNECTIONS[i][j][3])][0]-PORT[ROW[-i-2][int(CONNECTIONS[i][j][3])][2]][CONNECTIONS[i][j][5]][1]

            # print(id1,id2,n_total+cnt-1,offset)

            vec1=np.zeros((n_total+total_connection))
            vec1[id1]=-1
            vec1[id2]=1
            vec1[n_total+cnt-1]=-1
            A_ub.append(vec1)
            b_ub.append(offset)

            vec2=np.zeros((n_total+total_connection))
            vec2[id1]=1
            vec2[id2]=-1
            vec2[n_total+cnt-1]=-1
            A_ub.append(vec2)
            b_ub.append(-offset)

    # gen location constraints via inequality constraints
    n_now=0
    for i in range(len(LOCATION)):
        for j in range(len(LOCATION[i])-1):
            # relative locations
            vec=np.zeros((n_total+total_connection))
            vec[n_now+j+1]=-1
            vec[n_now+j]=1

            A_ub.append(vec)
            b_ub.append(-SPACING-BLOCK[i][j][0])
            print(i,j,n_now+j,BLOCK[i][j][0])

        n_now+=n_in_row[i]

    # transform to array
    A_ub=np.array(A_ub)
    b_ub=np.array(b_ub)
    # A_eq=np.array(A_eq)
    # b_eq=np.array(b_eq)

    # boudaries

    extra_allowance=3*SPACING # user-identify, some allowance can lead to possible better solution
    bounds=(0,CUR_MAX_X+extra_allowance) # all with the same bound

    # solve        
    result = linprog(c, A_ub=A_ub, b_ub=b_ub, bounds=bounds, method='highs')
    print("Optimization status:", result.message)
    print(result.x[0:n_total],n_total)
    
    for i0 in range(n_in_row[0]):
        LOCATION[0][i0][0]=result.x[i0]

    n_so_far=n_in_row[0]
    for i1 in range(len(n_in_row)-1):
        i=1+i1
        for j in range(n_in_row[i]):
            LOCATION[i][j][0]=result.x[n_so_far+j]
        n_so_far+=n_in_row[i]

    return result



def get_idx(N_IN_ROW, ID_ROW, ID_IN_ROW):
    idx=0
    for i in range(ID_ROW):
        idx+=N_IN_ROW[i]

    idx+=ID_IN_ROW

    return idx



if __name__=="__main__":
    # 最小化问题：c^T * x
    # 约束条件：A_ub * x <= b_ub, A_eq * x = b_eq, lb <= x <= ub

    # 目标函数系数（最小化）
    c = np.array([-3, -2])  # 注意：linprog默认最小化，所以最大化问题需要取负

    # 不等式约束（A_ub * x <= b_ub）
    A_ub = np.array([[1, 1], [2, 1], [1, 0]])
    b_ub = np.array([6, 8, 4])

    # 等式约束（A_eq * x = b_eq）
    # 本例中没有等式约束

    # 变量边界
    x_bounds = (0, None)  # x >= 0
    y_bounds = (0, None)  # y >= 0

    # 求解线性规划问题
    result = linprog(c, A_ub=A_ub, b_ub=b_ub, bounds=[x_bounds, y_bounds], method='highs')

    # 输出结果
    print("优化状态:", result.message)
    print("最优解: x =", result.x[0], ", y =", result.x[1])
    print("最优目标函数值:", result.fun)  # 由于我们取了负号，这里需要再取负回来