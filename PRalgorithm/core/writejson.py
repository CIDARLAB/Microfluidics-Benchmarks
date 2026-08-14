import json
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.axes as ax
from readjson import *


def _is_layer0_value(value):
    return str(value) == "0"


def _component_is_layer0(component):
    layers = component.get("layers")
    if isinstance(layers, list):
        return any(_is_layer0_value(v) for v in layers)
    if "layer" in component:
        return _is_layer0_value(component.get("layer"))
    return True


def _connection_is_layer0(connection):
    if "layer" in connection:
        return _is_layer0_value(connection.get("layer"))
    return True


def _build_component_index_by_name(file_data):
    idx = {}
    for i, comp in enumerate(file_data.get("components", [])):
        idx[comp.get("name")] = i
    return idx
    
def updatecomponents(FILE,DATA):
    # FILE is the json file for the design
    # DATA is a list containing the data needs to be updated, for example: DATA[i]=[index,new_x,new_y,rotation]
    name_to_index = _build_component_index_by_name(FILE)
    for data in DATA:
        target = data[0]
        if isinstance(target, str):
            if target not in name_to_index:
                continue
            comp_idx = name_to_index[target]
        else:
            comp_idx = target
            if comp_idx < 0 or comp_idx >= len(FILE["components"]):
                continue

        if not _component_is_layer0(FILE["components"][comp_idx]):
            continue

        FILE["components"][comp_idx]["params"]["position"][0]=data[1]
        FILE["components"][comp_idx]["params"]["position"][1]=data[2]
        if data[3]==90:
            FILE["components"][comp_idx]["params"]["rotation"]=270
        elif data[3]==270:
            FILE["components"][comp_idx]["params"]["rotation"]=90        
        FILE["components"][comp_idx]["params"]["mirrorByX"]=data[-1]

        # rotation is currently set to all 0
        # FILE["components"][data[0]].update({"rotation":data[3]})

def updateconnections(FILE,CONNECTION,Y_LOC,ROW,LOC,BLOCK,TREE,COMPON,PORT):
    for con in FILE["connections"]:
        if not _connection_is_layer0(con):
            continue

        if con.get("source", {}).get("component") is None:
            continue

        if "paths" not in con or not isinstance(con["paths"], list):
            con["paths"] = []
        else:
            con["paths"].clear()

        if "params" not in con or not isinstance(con["params"], dict):
            con["params"] = {}

        for i in range(len(con["sinks"])):
            if con["sinks"][i].get("component") is None:
                continue

            row_u,id_u,id_l=searchconnection(con["source"]["component"],con["sinks"][i]["component"],TREE,COMPON)
            con["paths"].append({"source":con["source"],"sink":con["sinks"][i],"wayPoints":[]})
            flag=99999999999999
            id_con=len(CONNECTION)-row_u
            for j in range(len(CONNECTION[id_con])):
                if CONNECTION[id_con][j][2]==id_u and CONNECTION[id_con][j][3]==id_l:
                    flag=j
                    break

            if flag==99999999999999:
                continue
            
            # print(id_con)
            # print(id_u,id_l,flag)
            # print(LOC[-id_con-1][int(CONNECTION[id_con][flag][2])][1])
            
            con["paths"][i]["wayPoints"].append([CONNECTION[id_con][flag][0],LOC[-id_con-1][int(CONNECTION[id_con][flag][2])][1]])
            con["paths"][i]["wayPoints"].append([CONNECTION[id_con][flag][0],Y_LOC[-1-id_con][flag]])
            con["paths"][i]["wayPoints"].append([CONNECTION[id_con][flag][1],Y_LOC[-1-id_con][flag]])
            con["paths"][i]["wayPoints"].append([CONNECTION[id_con][flag][1],LOC[-id_con-2][int(CONNECTION[id_con][flag][3])][1]+BLOCK[-id_con-2][int(CONNECTION[id_con][flag][3])][1]])
            
            match (ROW[len(ROW)-1-id_con][CONNECTION[id_con][flag][2]][3] % 360):
                case 0:
                    con["paths"][i]["wayPoints"].insert(0,[CONNECTION[id_con][flag][0],LOC[-id_con-1][int(CONNECTION[id_con][flag][2])][1]+PORT[ROW[len(ROW)-1-id_con][CONNECTION[id_con][flag][2]][2]][CONNECTION[id_con][flag][4]][1]])

                case 90:
                    con["paths"][i]["wayPoints"].insert(0,[CONNECTION[id_con][flag][0],LOC[-id_con-1][int(CONNECTION[id_con][flag][2])][1]+(COMPON[ROW[len(ROW)-1-id_con][CONNECTION[id_con][flag][2]][2]][1]-PORT[ROW[len(ROW)-1-id_con][CONNECTION[id_con][flag][2]][2]][CONNECTION[id_con][flag][4]][0])])

                case 180:
                    con["paths"][i]["wayPoints"].insert(0,[CONNECTION[id_con][flag][0],LOC[-id_con-1][int(CONNECTION[id_con][flag][2])][1]+(COMPON[ROW[len(ROW)-1-id_con][CONNECTION[id_con][flag][2]][2]][2]-PORT[ROW[len(ROW)-1-id_con][CONNECTION[id_con][flag][2]][2]][CONNECTION[id_con][flag][4]][1])])

                case 270:        
                    con["paths"][i]["wayPoints"].insert(0,[CONNECTION[id_con][flag][0],LOC[-id_con-1][int(CONNECTION[id_con][flag][2])][1]+PORT[ROW[len(ROW)-1-id_con][CONNECTION[id_con][flag][2]][2]][CONNECTION[id_con][flag][4]][0]])
            
            # the lower block
            match (ROW[len(ROW)-2-id_con][CONNECTION[id_con][flag][3]][3] % 360):
                case 0:
                    con["paths"][i]["wayPoints"].append([CONNECTION[id_con][flag][1],LOC[-id_con-2][int(CONNECTION[id_con][flag][3])][1]+PORT[ROW[len(ROW)-2-id_con][CONNECTION[id_con][flag][3]][2]][CONNECTION[id_con][flag][5]][1]])

                case 90:
                    con["paths"][i]["wayPoints"].append([CONNECTION[id_con][flag][1],LOC[-id_con-2][int(CONNECTION[id_con][flag][3])][1]+(COMPON[ROW[len(ROW)-2-id_con][CONNECTION[id_con][flag][3]][2]][1]-PORT[ROW[len(ROW)-2-id_con][CONNECTION[id_con][flag][3]][2]][CONNECTION[id_con][flag][5]][0])])

                case 180:
                    con["paths"][i]["wayPoints"].append([CONNECTION[id_con][flag][1],LOC[-id_con-2][int(CONNECTION[id_con][flag][3])][1]+(COMPON[ROW[len(ROW)-2-id_con][CONNECTION[id_con][flag][3]][2]][2]-PORT[ROW[len(ROW)-2-id_con][CONNECTION[id_con][flag][3]][2]][CONNECTION[id_con][flag][5]][1])])

                case 270:        
                    con["paths"][i]["wayPoints"].append([CONNECTION[id_con][flag][1],LOC[-id_con-2][int(CONNECTION[id_con][flag][3])][1]+PORT[ROW[len(ROW)-2-id_con][CONNECTION[id_con][flag][3]][2]][CONNECTION[id_con][flag][5]][0]])




    # json_str = json.dumps(FILE)
    # with open(ADDRESS+'/result.json', 'w') as json_file:
    #     json_file.write(json_str)
    # print("Finish writing the results to json file")
        # 2025.4.26
        if len(con["paths"])==0:
            continue

        if len(con["paths"][0]["wayPoints"])==0:
            continue

        con["params"]["wayPoints"]=con["paths"][0]["wayPoints"]
        con["params"]["start"]=[con["paths"][0]["wayPoints"][0][0],con["paths"][0]["wayPoints"][0][1]]
        con["params"]["end"]=[con["paths"][0]["wayPoints"][-1][0],con["paths"][0]["wayPoints"][-1][1]]

        con["params"]["segments"]=[]
        for p in range(len(con["params"]["wayPoints"])-1):
            con["params"]["segments"].append([con["params"]["wayPoints"][p],con["params"]["wayPoints"][p+1]])




def searchconnection(SOURCENAME,SINKNAME,TREE,COMPON):
    index1=findincompon(SOURCENAME,COMPON)
    index2=findincompon(SINKNAME,COMPON)
    # print(TREE,index1,index2)
    row1=TREE[index1][0]
    id1=TREE[index1][1]

    row2=TREE[index2][0]
    id2=TREE[index2][1]
    # row_up is the idx of the upper row in the connection, whose idx is larger

    if row1>=row2:
        row_up=row1
        id_up=id1
        id_low=id2
    else:
        row_up=row2
        id_up=id2
        id_low=id1

    return row_up,id_up,id_low

def save_to_json(DATA,ADDRESS):
    # DATA should be dict
    json_str = json.dumps(DATA, indent=4)
    with open(ADDRESS, 'w') as json_file:
        json_file.write(json_str)