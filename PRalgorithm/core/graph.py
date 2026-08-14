import numpy as np
import matplotlib.pyplot as plt
from readjson import *
from writejson import *
from disjoint_set import *

def gen_graph(JSON,TREEADDESS):
    # DFS based
    # inputs the orgin JSON file of the design
    # outputs the tree.json required by the main flow
    # the original JSON file might be updated if there exists more than 2-hop connections
    
    G={"node":[], "edge":[]} # node stores name of components, edge stores connection ([1,2] means a connection from node 1 to node 2).
    up=[]
    below=[] # records the below nodes of each node

    for comp in JSON["components"]:
        G["node"].append(comp["id"])
        up.append([])
        below.append([])

    for con in JSON["connections"]:
        idx1=G["node"].index(con["source"]["component"])
        idx2=G["node"].index(con["sinks"][0]["component"])
        # G["edge"].append([idx1,idx2]) # not necessary, if need to show G, then uncomment this
        up[idx2].append(idx1)
        below[idx1].append(idx2)

    # determine whether there are independent sub circuits
    CLUST=detect_cluster(G["node"],up,below)
    # print(CLUST,len(CLUST))

    total_len=len(G["node"])
    layout_G=(-999)*np.ones((total_len))
    
    # print(CLUST)

    for k in range(len(CLUST)):
        reached=[]
        # determine the starting point
        # for j in range(len(up)):
        #     if up[j]==[]:
        #         layout_G[j]=0
        #         reached.append(j)
        #         current=j
        #         break
        for j in range(len(CLUST[k])):
            if up[CLUST[k][j]]==[]:
                layout_G[CLUST[k][j]]=0
                reached.append(CLUST[k][j])
                current=CLUST[k][j]
                break


        # DFS determining the depth of each node
        # print(G["node"][current])
        finished=DFS(G["node"],current,up,below,layout_G,reached,len(CLUST[k]))
        # return G["node"],layout_G # testing output

        cur_layout=[]
        for n in CLUST[k]:
            cur_layout.append(layout_G[n])

        max1=max(cur_layout)
        min1=min(cur_layout)
        for m in range(len(CLUST[k])):
            layout_G[CLUST[k][m]]=(max1-min1-layout_G[CLUST[k][m]]) # in each cluster, to let the lowest row be 0

    # max1=max(layout_G)
    # min1=min(layout_G)
    # for i in range(total_len):
    #     layout_G[i]=(max1-min1-layout_G[i]) # to let the lowest row be 0


    maxr=int(max(layout_G)+1)
    output={"maxrow":maxr-int(min(layout_G)),
            "items":[]}

    # print(min(layout_G),max(layout_G))
    idinrow=np.zeros((int(max(layout_G)+1)))
    for i in range(total_len):
        # output["items"].append({"name":G["node"][i],
        #                         "row":maxr-1-int(layout_G[i]),
        #                         "idinrow":int(idinrow[int(layout_G[i])]),
        #                         "rotation":0})

        #### 25.8.20 forcing all ports in middle part of the design to be beneath the block it is connected to
        # 25.8.21 not good, should change this according to the relative postion regarding the widest row. Also, some errors may occur 
        # if G["node"][i][0:4]=="port":
        #     if int(layout_G[i])!=maxr-1 and int(layout_G[i])!=0:
        #         layout_G[i]-=2
        ######################################################

        output["items"].append({"name":G["node"][i],
                        "row":int(layout_G[i]-min(layout_G)),
                        "idinrow":int(idinrow[int(layout_G[i])]),
                        "rotation":0})

        idinrow[int(layout_G[i])]+=1
    
    save_to_json(output,TREEADDESS) # save the tree.json file

    node_cluster=[]
    for i in range(len(CLUST)):
        node_cluster.append([])
        for j in CLUST[i]:
            node_cluster[i].append(G["node"][j])
    
    return node_cluster

    

def DFS(NODE,CURRENT,UP,BELOW,LAYOUT,REACHED,TOTAL_LEN):
    # print(CURRENT,NODE[CURRENT],NODE,REACHED,LAYOUT,'\n')

    if len(REACHED)==TOTAL_LEN:
        # print(len(REACHED),TOTAL_LEN)
        return 1 # this means finished
    
    for b in BELOW[CURRENT]:
        if b not in REACHED:
            LAYOUT[b]=LAYOUT[CURRENT]+1
            REACHED.append(b)
            if DFS(NODE,b,UP,BELOW,LAYOUT,REACHED,TOTAL_LEN)==1:
                return 1 # this means finished
    
    for u in UP[CURRENT]:
        if u not in REACHED:
            LAYOUT[u]=LAYOUT[CURRENT]-1
            REACHED.append(u)
            if DFS(NODE,u,UP,BELOW,LAYOUT,REACHED,TOTAL_LEN)==1:
                return 1 # this means finished    

    return 0 # this means the nodes below the current node are all explored



if __name__=="__main__":
    case='dx7_ref'
    path='./dx/'+case+'/result/result.json'
    jsonfile=readjson(path)
    ## old function
    # G,layout=gen_graph(jsonfile)
    # print(G)
    # print(layout)
    cluster=gen_graph(jsonfile,'./demotree.json')

 
