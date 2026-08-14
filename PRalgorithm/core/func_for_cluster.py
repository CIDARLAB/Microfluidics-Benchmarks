from readjson import *
from rowplace import *
from rowroute import *
from writejson import *
from order_and_mirror import *
from Bstar import *
from mapping_for_3duf import *
from graph import *
from utils import *
# from withinrowroute import *
import random
import matplotlib.pyplot as plt
import time 
import math as m
import os
import shutil  



def gen_files_each_cluster(NUMBER,CLUST,WHOLEJSON,WHOLETREE):
    # NUMBER starts with 0
    JSON={"components":[],"connections":[]}
    TREE={"maxrow":0,"items":[]}

    for i in range(len(WHOLEJSON["components"])):
        if WHOLEJSON["components"][i]["name"] in CLUST:
            JSON["components"].append(WHOLEJSON["components"][i])
            if len(JSON["components"])==len(CLUST):
                break # early stop
    
    for i in range(len(WHOLEJSON["connections"])):
        if (WHOLEJSON["connections"][i]["source"]["componnet"] in CLUST) or (WHOLEJSON["connections"][i]["sinks"][0]["componnet"] in CLUST):
            JSON["connections"].append(WHOLEJSON["connections"])
    
    minrow=9999999
    maxrow=0
    for i in range(len(WHOLETREE["items"])):
        if WHOLETREE["items"][i]["name"] in CLUST:
            TREE["components"].append(WHOLETREE["items"][i])
            maxrow=max(maxrow,WHOLETREE["items"][i]["row"])
            minrow=min(minrow,WHOLETREE["items"][i]["row"])
            if len(TREE["components"])==len(CLUST):
                break # early stop

    if minrow!=0:
        for i in range(len(TREE)):
            TREE[i]["row"]=TREE[i]["row"]-maxrow+minrow # let the minrow be 0
        TREE["maxrow"]=maxrow-minrow
    else:
        TREE["maxrow"]=maxrow

    save_to_json(JSON,'./tmp/'+str(NUMBER)+'.json')
    save_to_json(TREE,'./tmp/'+str(NUMBER)+'_tree.json')
            


    

    



def gen_PR_each_cluster(FILENAME):
    linwid=0.5
    # the test case should be saved at './baseline/FILENAME', consisting two files: tree.json, and connection.csv
    # generate blocks and relative positions
    # connectionadd='./baseline/'+FILENAME+'/connection.csv'
    componadd='./tmp/'+FILENAME+'.json'
    treeadd='./tmp/'+FILENAME+'_tree.json'
    jsonfile=readjson(componadd)
    cluster=gen_graph(jsonfile,treeadd) # create the tree.json file, which contains the original row information

    compon,port=readcompon(componadd)


    tree,max_row=readtree(treeadd,compon)
    tree.sort(key=takeThird) # sort using the index element, which is tree[2]
    connection=[] # connection[i]=[x_up,x_low,id_up,id_low,port_id_up,port_id_low]
    connection=readconnection_with_rotation(componadd,compon,tree)
    print("Finish loading test case:",FILENAME)

    ## initial placement
    start=time.time()
    ver_dis=5000 # reserve this between adjacent rows to ease routing
    hor_dis=2000 # reserve this between blocks horizontally
    R,L,B=init_rowplace(max_row,tree,compon,ver_dis,hor_dis)
    end=time.time()
    t1=end-start

    # plt.cla()
    # for i in range(len(L)):
    #     for j in range(len(L[i])):
    #         draw(L[i][j][0],L[i][j][1],B[i][j][0],B[i][j][1])
    #         for k in range(len(port[R[i][j][2]])):
    #             plotport(L[i][j][0],L[i][j][1],port[R[i][j][2]][k][0],port[R[i][j][2]][k][1],R[i][j][3],compon[R[i][j][2]][1],compon[R[i][j][2]][2],compon[R[i][j][2]][-1])

    # plt.savefig('./baseline/'+FILENAME+'/result/1_ori_result_ini.png')
    # plt.show()

    print("1/8, Finish initial placement, time spent:",t1,"s")

    ## initial placement with rotation
    start=time.time()
    decide_rotation(compon,tree,port,connection)
    ver_dis=5000 # reserve this between adjacent rows to ease routing
    hor_dis=2000 # reserve this between blocks horizontally
    R,L,B=init_rowplace(max_row,tree,compon,ver_dis,hor_dis)
    end=time.time()
    t2=end-start

    # plt.cla()
    # for i in range(len(L)):
    #     for j in range(len(L[i])):
    #         draw(L[i][j][0],L[i][j][1],B[i][j][0],B[i][j][1])
    #         for k in range(len(port[R[i][j][2]])):
    #             plotport(L[i][j][0],L[i][j][1],port[R[i][j][2]][k][0],port[R[i][j][2]][k][1],R[i][j][3],compon[R[i][j][2]][1],compon[R[i][j][2]][2],compon[R[i][j][2]][-1])
            
    # plt.savefig('./baseline/'+FILENAME+'/result/2_ori_result_ini_with_rotation.png')
    # plt.show()

    print("2/8, Finish initial placement with rotation, time spent:",t2,"s")

    # make symetrical
    # plt.cla()
    start=time.time()
    mid_x,max_rowid=make_symetric(L,B)
    end=time.time()
    t3=end-start

    # for i in range(len(L)):
    #     for j in range(len(L[i])):
    #         draw(L[i][j][0],L[i][j][1],B[i][j][0],B[i][j][1])
    #         for k in range(len(port[R[i][j][2]])):
    #             plotport(L[i][j][0],L[i][j][1],port[R[i][j][2]][k][0],port[R[i][j][2]][k][1],R[i][j][3],compon[R[i][j][2]][1],compon[R[i][j][2]][2],compon[R[i][j][2]][-1])
            
    # plt.savefig('./baseline/'+FILENAME+'/result/3_ori_result_sym.png')
    # plt.show()
    print("3/8, Finish symmetricalization, time spent:",t3,"s")


    # generate connections between blocks (still for test case) # starts backwards
    # for i in range(len(connection)):
    #     for j in range(len(connection[i])):
    #         connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+0.5*B[-i-1][int(connection[i][j][2])][0]
    #         connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+0.5*B[-i-2][int(connection[i][j][3])][0]

    # print(connection)
    for i in range(len(connection)):
        for j in range(len(connection[i])):
            # the up one
            if compon[R[-i-1][int(connection[i][j][2])][2]][-1]:
                # mirror
                match (R[-i-1][int(connection[i][j][2])][3] % 360):
                    case 0:
                        connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+B[-i-1][int(connection[i][j][2])][0]-port[R[-i-1][int(connection[i][j][2])][2]][connection[i][j][4]][0]
                    case 90:
                        connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+B[-i-1][int(connection[i][j][2])][0]-port[R[-i-1][int(connection[i][j][2])][2]][connection[i][j][4]][1]                
                    case 180:
                        connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+port[R[-i-1][int(connection[i][j][2])][2]][connection[i][j][4]][0]
                    case 270:
                        connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+port[R[-i-1][int(connection[i][j][2])][2]][connection[i][j][4]][1]                
            else:
                # no mirror
                match (R[-i-1][int(connection[i][j][2])][3] % 360):
                    case 0:
                        connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+port[R[-i-1][int(connection[i][j][2])][2]][connection[i][j][4]][0]
                    case 90:
                        connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+port[R[-i-1][int(connection[i][j][2])][2]][connection[i][j][4]][1]                
                    case 180:
                        connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+B[-i-1][int(connection[i][j][2])][0]-port[R[-i-1][int(connection[i][j][2])][2]][connection[i][j][4]][0]
                    case 270:
                        connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+B[-i-1][int(connection[i][j][2])][0]-port[R[-i-1][int(connection[i][j][2])][2]][connection[i][j][4]][1]                
            

            # the low one
            if compon[R[-i-2][int(connection[i][j][3])][2]][-1]:
                # mirror
                match (R[-i-2][int(connection[i][j][3])][3] % 360):
                    case 0:
                        connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+B[-i-2][int(connection[i][j][3])][0]-port[R[-i-2][int(connection[i][j][3])][2]][connection[i][j][5]][0]
                    case 90:
                        connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+B[-i-2][int(connection[i][j][3])][0]-port[R[-i-2][int(connection[i][j][3])][2]][connection[i][j][5]][1]
                    case 180:
                        connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+port[R[-i-2][int(connection[i][j][3])][2]][connection[i][j][5]][0]
                    case 270:
                        connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+port[R[-i-2][int(connection[i][j][3])][2]][connection[i][j][5]][1]
        
            else:
                # no mirror
                match (R[-i-2][int(connection[i][j][3])][3] % 360):
                    case 0:
                        connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+port[R[-i-2][int(connection[i][j][3])][2]][connection[i][j][5]][0]
                    case 90:
                        connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+port[R[-i-2][int(connection[i][j][3])][2]][connection[i][j][5]][1]
                    case 180:
                        connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+B[-i-2][int(connection[i][j][3])][0]-port[R[-i-2][int(connection[i][j][3])][2]][connection[i][j][5]][0]
                    case 270:
                        connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+B[-i-2][int(connection[i][j][3])][0]-port[R[-i-2][int(connection[i][j][3])][2]][connection[i][j][5]][1]

    ## initial routing and draw
    start=time.time()
    channel_spacing=500
    routes=[]
    heights=[]
    for i in range(len(connection)):
        y_loc, height=row_route(connection[i],channel_spacing)
        # y_loc records the relative y-axis positions of routes
        routes.append(y_loc)
        heights.append(height)
    end=time.time()
    t4=end-start

    # plt.cla()
    # for i in range(len(connection)):
    #     for j in range(len(routes[i])):
    #         plt.plot([connection[i][j][0],connection[i][j][1]],[L[-i-1][0][1]-routes[i][j],L[-i-1][0][1]-routes[i][j]],'r',linewidth=linwid)
    #         plt.plot([connection[i][j][1],connection[i][j][1]],[L[-i-2][int(connection[i][j][3])][1]+B[-i-2][int(connection[i][j][3])][1],L[-i-1][0][1]-routes[i][j]],'r',linewidth=linwid)
    #         plt.plot([connection[i][j][0],connection[i][j][0]],[L[-i-1][int(connection[i][j][2])][1],L[-i-1][0][1]-routes[i][j]],'r',linewidth=linwid)
        

    # # redraw the symetric placement
    # for i in range(len(L)):
    #     for j in range(len(L[i])):
    #         draw(L[i][j][0],L[i][j][1],B[i][j][0],B[i][j][1])
    #         for k in range(len(port[R[i][j][2]])):
    #             plotport(L[i][j][0],L[i][j][1],port[R[i][j][2]][k][0],port[R[i][j][2]][k][1],R[i][j][3],compon[R[i][j][2]][1],compon[R[i][j][2]][2],compon[R[i][j][2]][-1])

    #         # plt.savefig('result_sym_&_route.png')
    #         # time.sleep(0.1)
    # plt.savefig('./baseline/'+FILENAME+'/result/4_ori_result_sym_&_route.png')
    # plt.show()
    print("4/8, Finish routing, time spent:",t4,"s")


    ###################### reordering ####################################
    start=time.time()
    relation=gen_port_relation(tree,B,port)

    inrow_rela=gen_inrow_relation(R,connection,relation)

    print('****************************************************')
    new_order=reorder(R,connection,inrow_rela)
    if new_order!=[]:
        print("New valid order that can lead to planar graph found:")
        print(new_order)
    else:
        print("Fail to find valid order, please check the design")
    print('****************************************************')

    apply_new_order(tree,new_order)
    tree.sort(key=takeThird)
    R,L,B=init_rowplace(max_row,tree,compon,ver_dis,hor_dis)
    connection=[] # connection[i]=[x_up,x_low,id_up,id_low,port_id_up,port_id_low]
    connection=readconnection_with_rotation(componadd,compon,tree) # update connection
    print("--Finish applying new order")

    gen_mirror(compon,R,connection,relation)
    print("--Finish mirroring related components")
    end=time.time()

    # plt.cla()
    # for i in range(len(L)):
    #     for j in range(len(L[i])):
    #         draw(L[i][j][0],L[i][j][1],B[i][j][0],B[i][j][1])
    #         for k in range(len(port[R[i][j][2]])):
    #             plotport(L[i][j][0],L[i][j][1],port[R[i][j][2]][k][0],port[R[i][j][2]][k][1],R[i][j][3],compon[R[i][j][2]][1],compon[R[i][j][2]][2],compon[R[i][j][2]][-1])
            
    # plt.savefig('./baseline/'+FILENAME+'/result/5_result_ini.png')
    t5=end-start
    print("5/8, Finish initialization of new orders, time spent:",t5,"s")

    ####################################################################


    ## make symetrical
    # plt.cla()
    # start=time.time()
    # make_symetric(L,B)
    # end=time.time()
    # t6=end-start

    # for i in range(len(L)):
    #     for j in range(len(L[i])):
    #         draw(L[i][j][0],L[i][j][1],B[i][j][0],B[i][j][1])
    #         for k in range(len(port[R[i][j][2]])):
    #             plotport(L[i][j][0],L[i][j][1],port[R[i][j][2]][k][0],port[R[i][j][2]][k][1],R[i][j][3],compon[R[i][j][2]][1],compon[R[i][j][2]][2],compon[R[i][j][2]][-1])
            
    # plt.savefig('./baseline/'+FILENAME+'/result/6_result_sym.png')
    # # plt.show()
    # print("6/8, Finish symmetricalization, time spent:",t6,"s")


    # 2024.6.16 new stage 6, adjust placement to shorten wirelength
    plt.cla()
    start=time.time()
    ######################################################################## 2024.6.16 add new codes here
    mid_x,max_rowid=make_symetric(L,B) ####################### 6.18 this needs to be revised to pick the row whose ports are the widest

    # print(max_rowid)
    # go down
    for i in range(max_rowid):
        idupdated_l=[]
        idupdated_r=[]
        flag_l_r=0 # 0 for left, 1 for right
        midid=m.floor((len(R[max_rowid-1-i])-1)/2)
        currowid=max_rowid-1-i
        formerrela=get_connect_rela(currowid,R,connection,1)
        for j in range(len(R[max_rowid-1-i])):
            if flag_l_r==0:
            # go left
                id=midid-len(idupdated_l)
                # two choices, if can1 fails, go to can2
                can1=decide_newx(currowid,id,formerrela[id],R,L,B,compon,port,1) # can1 for port alignment
                
                if idupdated_l==[]:
                    can2=L[currowid][id][0] # can2 for legalization
                else:
                    can2=L[currowid][idupdated_l[-1]][0]-hor_dis-B[currowid][id][0]

                if idupdated_l==[]:
                    if can1!=999999999999:
                        L[currowid][id][0]=can1
                    else:
                        L[currowid][id][0]=can2
                else:
                    if can1+hor_dis+B[currowid][id][0]>=L[currowid][idupdated_l[-1]][0]:
                        L[currowid][id][0]=can2
                    else:
                        L[currowid][id][0]=can1                
                    
                idupdated_l.append(id)



            else:
            # go right
                id=midid+len(idupdated_r)+1
                # two choices, if can1 fails, go to can2

                can1=decide_newx(currowid,id,formerrela[id],R,L,B,compon,port,1) # can1 for port alignment
                # if can1==999999999999: # this means this device is constraint free from the former row in the current direction
                #     formerrela[id]=formerrela=get_connect_rela(currowid,R,connection,0) # find new relation in the reverse direction
                #     can1=decide_newx(currowid,id,formerrela[id],R,L,B,compon,port,0)

                if idupdated_r==[]:
                    can2=L[currowid][idupdated_l[0]][0]+B[currowid][idupdated_l[0]][0]+hor_dis # can2 for legalization
                else:
                    can2=L[currowid][idupdated_r[-1]][0]+B[currowid][idupdated_r[-1]][0]+hor_dis

                if idupdated_r==[]:
                    if can1<=L[currowid][idupdated_l[0]][0]+B[currowid][idupdated_l[0]][0]+hor_dis or can1==999999999999:
                        L[currowid][id][0]=can2
                    else:
                        L[currowid][id][0]=can1
                else:
                    if can1<=L[currowid][idupdated_r[-1]][0]+B[currowid][idupdated_r[-1]][0]+hor_dis:
                        L[currowid][id][0]=can2
                    else:
                        L[currowid][id][0]=can1                
                    
                idupdated_r.append(id)



            flag_l_r=1-flag_l_r # turn to the other side



    # go up    
    for i in range(len(R)-1-max_rowid):
        # go left
        # go right
        idupdated_l=[]
        idupdated_r=[]
        flag_l_r=0 # 0 for left, 1 for right
        currowid=max_rowid+1+i
        midid=m.floor((len(R[max_rowid+1+i])-1)/2)
        formerrela=get_connect_rela(currowid,R,connection,0)
        for j in range(len(R[max_rowid+1+i])):
            if flag_l_r==0:
            # go left
                id=midid-len(idupdated_l)
                # two choices, if can1 fails, go to can2
                can1=decide_newx(currowid,id,formerrela[id],R,L,B,compon,port,0) # can1 for port alignment
                
                if idupdated_l==[]:
                    can2=L[currowid][id][0] # can2 for legalization
                else:
                    can2=L[currowid][idupdated_l[-1]][0]-hor_dis-B[currowid][id][0]

                if idupdated_l==[]:
                    if can1!=999999999999:
                        L[currowid][id][0]=can1
                    else:
                        L[currowid][id][0]=can2
                else:
                    if can1+hor_dis+B[currowid][id][0]>=L[currowid][idupdated_l[-1]][0]:
                        L[currowid][id][0]=can2
                    else:
                        L[currowid][id][0]=can1                
                    
                idupdated_l.append(id)

            else:
            # go right
                id=midid+len(idupdated_r)+1
                # two choices, if can1 fails, go to can2
                can1=decide_newx(currowid,id,formerrela[id],R,L,B,compon,port,0) # can1 for port alignment
                
                if idupdated_r==[]:
                    can2=L[currowid][idupdated_l[0]][0]+B[currowid][idupdated_l[0]][0]+hor_dis # can2 for legalization
                else:
                    can2=L[currowid][idupdated_r[0]][0]+B[currowid][idupdated_r[0]][0]+hor_dis

                if idupdated_r==[]:
                    if can1<=L[currowid][idupdated_l[0]][0]+B[currowid][idupdated_l[0]][0]+hor_dis or can1==999999999999:
                        L[currowid][id][0]=can2
                    else:
                        L[currowid][id][0]=can1
                else:
                    if can1<=L[currowid][idupdated_r[-1]][0]+B[currowid][idupdated_r[-1]][0]+hor_dis:
                        L[currowid][id][0]=can2
                    else:
                        L[currowid][id][0]=can1                
                    
                idupdated_r.append(id)


            flag_l_r=1-flag_l_r # turn to the other side

    ######################################################################## 
    end=time.time()
    t6=end-start

    # for i in range(len(L)):
    #     for j in range(len(L[i])):
    #         draw(L[i][j][0],L[i][j][1],B[i][j][0],B[i][j][1])
    #         for k in range(len(port[R[i][j][2]])):
    #             plotport(L[i][j][0],L[i][j][1],port[R[i][j][2]][k][0],port[R[i][j][2]][k][1],R[i][j][3],compon[R[i][j][2]][1],compon[R[i][j][2]][2],compon[R[i][j][2]][-1])
            
    # plt.savefig('./baseline/'+FILENAME+'/result/6_result_shorten.png')
    # plt.show()
    print("6/8, Finish shortening wirelength, time spent:",t6,"s")


    # generate connections between blocks (still for test case) # starts backwards
    # for i in range(len(connection)):
    #     for j in range(len(connection[i])):
    #         connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+0.5*B[-i-1][int(connection[i][j][2])][0]
    #         connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+0.5*B[-i-2][int(connection[i][j][3])][0]

    # print(connection)
    for i in range(len(connection)):
        for j in range(len(connection[i])):
            # the up one
            if compon[R[-i-1][int(connection[i][j][2])][2]][-1]:
                # mirror
                match (R[-i-1][int(connection[i][j][2])][3] % 360):
                    case 0:
                        connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+B[-i-1][int(connection[i][j][2])][0]-port[R[-i-1][int(connection[i][j][2])][2]][connection[i][j][4]][0]
                    case 90:
                        connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+B[-i-1][int(connection[i][j][2])][0]-port[R[-i-1][int(connection[i][j][2])][2]][connection[i][j][4]][1]                
                    case 180:
                        connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+port[R[-i-1][int(connection[i][j][2])][2]][connection[i][j][4]][0]
                    case 270:
                        connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+port[R[-i-1][int(connection[i][j][2])][2]][connection[i][j][4]][1]                
            else:
                # no mirror
                match (R[-i-1][int(connection[i][j][2])][3] % 360):
                    case 0:
                        connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+port[R[-i-1][int(connection[i][j][2])][2]][connection[i][j][4]][0]
                    case 90:
                        connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+port[R[-i-1][int(connection[i][j][2])][2]][connection[i][j][4]][1]                
                    case 180:
                        connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+B[-i-1][int(connection[i][j][2])][0]-port[R[-i-1][int(connection[i][j][2])][2]][connection[i][j][4]][0]
                    case 270:
                        connection[i][j][0]=L[-i-1][int(connection[i][j][2])][0]+B[-i-1][int(connection[i][j][2])][0]-port[R[-i-1][int(connection[i][j][2])][2]][connection[i][j][4]][1]                
            

            # the low one
            if compon[R[-i-2][int(connection[i][j][3])][2]][-1]:
                # mirror
                match (R[-i-2][int(connection[i][j][3])][3] % 360):
                    case 0:
                        connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+B[-i-2][int(connection[i][j][3])][0]-port[R[-i-2][int(connection[i][j][3])][2]][connection[i][j][5]][0]
                    case 90:
                        connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+B[-i-2][int(connection[i][j][3])][0]-port[R[-i-2][int(connection[i][j][3])][2]][connection[i][j][5]][1]
                    case 180:
                        connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+port[R[-i-2][int(connection[i][j][3])][2]][connection[i][j][5]][0]
                    case 270:
                        connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+port[R[-i-2][int(connection[i][j][3])][2]][connection[i][j][5]][1]
        
            else:
                # no mirror
                match (R[-i-2][int(connection[i][j][3])][3] % 360):
                    case 0:
                        connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+port[R[-i-2][int(connection[i][j][3])][2]][connection[i][j][5]][0]
                    case 90:
                        connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+port[R[-i-2][int(connection[i][j][3])][2]][connection[i][j][5]][1]
                    case 180:
                        connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+B[-i-2][int(connection[i][j][3])][0]-port[R[-i-2][int(connection[i][j][3])][2]][connection[i][j][5]][0]
                    case 270:
                        connection[i][j][1]=L[-i-2][int(connection[i][j][3])][0]+B[-i-2][int(connection[i][j][3])][0]-port[R[-i-2][int(connection[i][j][3])][2]][connection[i][j][5]][1]

    ## initial routing and draw
    start=time.time()
    channel_spacing=500
    routes=[]
    heights=[]
    for i in range(len(connection)):
        y_loc, height=row_route(connection[i],channel_spacing)
        # y_loc records the relative y-axis positions of routes
        routes.append(y_loc)
        heights.append(height)
    end=time.time()
    t7=end-start

    # plt.cla()
    # for i in range(len(connection)):
    #     for j in range(len(routes[i])):
    #         plt.plot([connection[i][j][0],connection[i][j][1]],[L[-i-1][0][1]-routes[i][j],L[-i-1][0][1]-routes[i][j]],'r',linewidth=linwid)
    #         plt.plot([connection[i][j][1],connection[i][j][1]],[L[-i-2][int(connection[i][j][3])][1]+B[-i-2][int(connection[i][j][3])][1],L[-i-1][0][1]-routes[i][j]],'r',linewidth=linwid)
    #         plt.plot([connection[i][j][0],connection[i][j][0]],[L[-i-1][int(connection[i][j][2])][1],L[-i-1][0][1]-routes[i][j]],'r',linewidth=linwid)
        

    # # redraw the symetric placement
    # for i in range(len(L)):
    #     for j in range(len(L[i])):
    #         draw(L[i][j][0],L[i][j][1],B[i][j][0],B[i][j][1])
    #         for k in range(len(port[R[i][j][2]])):
    #             plotport(L[i][j][0],L[i][j][1],port[R[i][j][2]][k][0],port[R[i][j][2]][k][1],R[i][j][3],compon[R[i][j][2]][1],compon[R[i][j][2]][2],compon[R[i][j][2]][-1])

    #         # plt.savefig('result_sym_&_route.png')
    #         # time.sleep(0.1)
    # plt.savefig('./baseline/'+FILENAME+'/result/7_result_sym_&_route.png')
    # plt.show()
    print("7/8, Finish routing, time spent:",t7,"s")


    ## make compact
    # regard the routes between different rows as one piece
    # need to add a channel_spacing to all the blocks below routes 2023.10.16
    # compact(R,L,B) # is actially compact down
    start=time.time()
    y_new=compact_new(R,L,B,connection,routes,heights,channel_spacing)
    # plt.cla()
    # for i in range(len(L)):
    #     for j in range(len(L[i])):
    #         draw(L[i][j][0],L[i][j][1],B[i][j][0],B[i][j][1]) # draw the blocks
    #         for k in range(len(port[R[i][j][2]])):
    #             plotport(L[i][j][0],L[i][j][1],port[R[i][j][2]][k][0],port[R[i][j][2]][k][1],R[i][j][3],compon[R[i][j][2]][1],compon[R[i][j][2]][2],compon[R[i][j][2]][-1])

    # # NOTICE: routes,heights,connection have reversed orders than R, and y_new is reversed from routes, so the drawing here is different from in the previous step.
            
    # for i in range(len(connection)):
    #     for j in range(len(y_new[-1-i])):
    #         plt.plot([connection[i][j][0],connection[i][j][1]],[y_new[-1-i][j],y_new[-1-i][j]],'r',linewidth=linwid)
    #         plt.plot([connection[i][j][1],connection[i][j][1]],[L[-i-2][int(connection[i][j][3])][1]+B[-i-2][int(connection[i][j][3])][1],y_new[-1-i][j]],'r',linewidth=linwid)
    #         plt.plot([connection[i][j][0],connection[i][j][0]],[L[-i-1][int(connection[i][j][2])][1],y_new[-1-i][j]],'r',linewidth=linwid)

    # ## connect the ports to the boundaries
    # for i in range(len(connection)):
    #     for j in range(len(y_new[-1-i])):
    #         # the upper block
    #         # [x_up,x_low,id_up,id_low,port_id_up,port_id_low]
    #         match (R[len(R)-1-i][connection[i][j][2]][3] % 360):
    #             case 0:
    #                 plt.plot([connection[i][j][0],connection[i][j][0]],[L[-i-1][int(connection[i][j][2])][1],L[-i-1][int(connection[i][j][2])][1]+port[R[len(R)-1-i][connection[i][j][2]][2]][connection[i][j][4]][1]],'r',linewidth=linwid)

    #             case 90:
    #                 plt.plot([connection[i][j][0],connection[i][j][0]],[L[-i-1][int(connection[i][j][2])][1],L[-i-1][int(connection[i][j][2])][1]+(compon[R[len(R)-1-i][connection[i][j][2]][2]][1]-port[R[len(R)-1-i][connection[i][j][2]][2]][connection[i][j][4]][0])],'r',linewidth=linwid)

    #             case 180:
    #                 plt.plot([connection[i][j][0],connection[i][j][0]],[L[-i-1][int(connection[i][j][2])][1],L[-i-1][int(connection[i][j][2])][1]+(compon[R[len(R)-1-i][connection[i][j][2]][2]][2]-port[R[len(R)-1-i][connection[i][j][2]][2]][connection[i][j][4]][1])],'r',linewidth=linwid)

    #             case 270:        
    #                 plt.plot([connection[i][j][0],connection[i][j][0]],[L[-i-1][int(connection[i][j][2])][1],L[-i-1][int(connection[i][j][2])][1]+port[R[len(R)-1-i][connection[i][j][2]][2]][connection[i][j][4]][0]],'r',linewidth=linwid)
            
    #         # the lower block
    #         match (R[len(R)-2-i][connection[i][j][3]][3] % 360):
    #             case 0:
    #                 plt.plot([connection[i][j][1],connection[i][j][1]],[L[-i-2][int(connection[i][j][3])][1]+B[-i-2][int(connection[i][j][3])][1],L[-i-2][int(connection[i][j][3])][1]+port[R[len(R)-2-i][connection[i][j][3]][2]][connection[i][j][5]][1]],'r',linewidth=linwid)

    #             case 90:
    #                 plt.plot([connection[i][j][1],connection[i][j][1]],[L[-i-2][int(connection[i][j][3])][1]+B[-i-2][int(connection[i][j][3])][1],L[-i-2][int(connection[i][j][3])][1]+(compon[R[len(R)-2-i][connection[i][j][3]][2]][1]-port[R[len(R)-2-i][connection[i][j][3]][2]][connection[i][j][5]][0])],'r',linewidth=linwid)

    #             case 180:
    #                 plt.plot([connection[i][j][1],connection[i][j][1]],[L[-i-2][int(connection[i][j][3])][1]+B[-i-2][int(connection[i][j][3])][1],L[-i-2][int(connection[i][j][3])][1]+(compon[R[len(R)-2-i][connection[i][j][3]][2]][2]-port[R[len(R)-2-i][connection[i][j][3]][2]][connection[i][j][5]][1])],'r',linewidth=linwid)

    #             case 270:        
    #                 plt.plot([connection[i][j][1],connection[i][j][1]],[L[-i-2][int(connection[i][j][3])][1]+B[-i-2][int(connection[i][j][3])][1],L[-i-2][int(connection[i][j][3])][1]+port[R[len(R)-2-i][connection[i][j][3]][2]][connection[i][j][5]][0]],'r',linewidth=linwid)
    
    end=time.time()
    t8=end-start
            
    # plt.savefig('./baseline/'+FILENAME+'/result/8_result_sym_compact_final.png')

    print("8/8, Finish compaction and connecting ports, time spent:",t8,"s")
    print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< All P&R Done >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
    print("Total Timeusage:",t1+t2+t3+t4+t5+t6+t7+t8,"s")
    print("Reordering Timeusage:",t5,"s")
    print("P&R for the new orders:",t5+t6+t7+t8,"s")

    # write to json
    orifile=readjson_raw(componadd)
    # generate the DATA for updatecomponents
    # name=R data[1-2]=L data[3]=R

    ### compon_new contains different information than compon, just for the convinence of output ###
    compon_new=[]
    for i in range(len(tree)):
        compon_new.append([compon[tree[i][2]][3],L[tree[i][0]][tree[i][1]][0],L[tree[i][0]][tree[i][1]][1],R[tree[i][0]][tree[i][1]][3],compon[tree[i][2]][-1]])
    updatecomponents(orifile,compon_new)
    updateconnections(orifile,connection,y_new,R,L,B,tree,compon,port)
    save_to_json(orifile,'./tmp/'+FILENAME+'_result.json')

