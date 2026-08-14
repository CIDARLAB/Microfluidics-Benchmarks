import json
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.axes as ax
from utils import *


def _is_layer0_value(value):
    return str(value) == "0"


def _is_component_in_layer0(component):
    layers = component.get("layers")
    if isinstance(layers, list):
        if len(layers) == 0:
            return False
        return any(_is_layer0_value(v) for v in layers)

    if "layer" in component:
        return _is_layer0_value(component.get("layer"))

    # Backward compatibility for files without explicit layer metadata.
    return True


def _is_connection_in_layer0(connection):
    if "layer" in connection:
        return _is_layer0_value(connection.get("layer"))

    # Backward compatibility for files without explicit layer metadata.
    return True


def _filter_design_layer0(data):
    filtered = dict(data)

    components = data.get("components", [])
    filtered_components = [c for c in components if _is_component_in_layer0(c)]
    filtered["components"] = filtered_components

    keep_names = {c.get("name") for c in filtered_components}
    connections = data.get("connections", [])

    filtered_connections = []
    for con in connections:
        if not _is_connection_in_layer0(con):
            continue

        source_name = con.get("source", {}).get("component")
        if source_name not in keep_names:
            continue

        sinks = con.get("sinks", [])
        if len(sinks) == 0:
            continue

        if not all(sink.get("component") in keep_names for sink in sinks):
            continue

        filtered_connections.append(con)

    filtered["connections"] = filtered_connections
    return filtered


def readjson_raw(address):
    with open(address) as f:
        data = json.load(f)
    return data

def readjson(address):
    data = readjson_raw(address)
    data = _filter_design_layer0(data)
    return data

def readcompon(address):
    # load
    with open(address) as f:
        design=json.load(f)
    design = _filter_design_layer0(design)
        
    compon=[]
    for i in range(len(design["components"])):    
        # 2.25 the last element in compon stands for "mirror", 0 for false, 1 for true
        compon.append([i,design["components"][i]["x-span"],design["components"][i]["y-span"],design["components"][i]["name"],0])

    port=readport(design)

    return compon,port

def readport(DICT):
    # DICT is the json file loaded to memory
    PORT=[]
    for i in range(len(DICT["components"])):   
        ports=[] 
        # it is notable, in ports, the index of ports starts from 0 instead of 1
        for j in range(len(DICT["components"][i]["ports"])):
            ports.append([DICT["components"][i]["ports"][j]["x"],DICT["components"][i]["ports"][j]["y"]])
        PORT.append(ports)
        # print(DICT["components"][i]["name"],ports)
    return PORT

def findincompon(NAME,COMPON):
    for i in range(len(COMPON)):
        if COMPON[i][3]==NAME:
            # return COMPON[i][1], COMPON[i][2]
            return i
    print(NAME," NAME NOT FOUND IN COMPON")

# # this is a csv version, but fails to handle the string type name
# def readtree(treeaddress,compon):
#     tmptree=read(treeaddress)
#     # each row of tmptree is: component name, row, order in the row, index in compon rotation;
#     # the first row is: num of rows, num of rows, num of rows, num of rows;
    
#     tree=[]
#     for i in range(tmptree.shape[0]-1):
#         w,h=findincompon(tmptree[i+1][0],compon)
#         tree.append([tmptree[i+1][1],tmptree[i+1][2],w,h,tmptree[i+1][3]])
        
#     return tree

# the json version
def readtree(treeaddress,compon):
    # load
    with open(treeaddress) as f:
        data=json.load(f)
        
    tree=[]
    for i in range(len(data["items"])):    
        index=findincompon(data["items"][i]["name"],compon)
        tree.append([data["items"][i]["row"],data["items"][i]["idinrow"],index,data["items"][i]["rotation"]])
    
    maxrow=data["maxrow"]
    
    return tree, maxrow

# def readconnection(connectionaddress):
#     # 2024.1.13(unsolved),we need to add the port information in this function, consider directly get this information from the original json file and refer to row information (no longer use connection.csv)
#     tmpconnection=read(connectionaddress)
#     # each row in tmpconnection contains id_region,x_up,x_low,id_up,id_low
#     # id_region starts from the top, so id_region=0 indicates the connection between the top row and the second top row
#     # the first row of tmpconnection is num_connection_regions,num_connection_regions,num_connection_regions,num_connection_regions,num_connection_regions
    
#     connection=[]
#     # connection starts from the top, so the first element in connetion contains the connections between the top row and the second top row
#     for i in range(int(tmpconnection[0,0])):
#         connection.append([])
    
#     for I in range(tmpconnection.shape[0]-1):
#         i=I+1
#         connection[int(tmpconnection[i][0])].append([tmpconnection[i][1],tmpconnection[i][2],tmpconnection[i][3],tmpconnection[i][4]])
        
#     return connection


def readconnection_with_rotation(CONNECTIONADDRESS,COMPON,TREE):
    # flow connection only
    # TREE is sorted based on index
    # load
    with open(CONNECTIONADDRESS) as f:
        design=json.load(f)
    design = _filter_design_layer0(design)

    name_to_id = {com[3]: com[0] for com in COMPON}
        
    connection=[]
    maxnum=max(TREE,key=takeFirst)[0] # id of the highest row
    for _ in range(maxnum):
        # id_row starts from 0, so maxnum=the number of connection regions
        connection.append([])
    
    for connect in design["connections"]:
        if len(connect["sinks"]) == 0:
            continue

        sink_name = connect["sinks"][0]["component"]
        source_name = connect["source"]["component"]
        if sink_name not in name_to_id or source_name not in name_to_id:
            continue

        id_sink = name_to_id[sink_name]
        id_source = name_to_id[source_name]
    
        id_up=id_sink
        id_low=id_source
        flag=0
        # sink on top
        if TREE[id_sink][0]<=TREE[id_source][0]:
            id_up=id_source
            id_low=id_sink
            flag=1
            # source on top
                
        id_region=int(maxnum-max(TREE[id_sink][0],TREE[id_source][0]))
        # [x_up,x_low,id_up,id_low,port_id_up,port_id_low]

        if flag==0:
            connection[id_region].append([0,0,TREE[id_up][1],TREE[id_low][1],int(connect["sinks"][0]["port"])-1,int(connect["source"]["port"])-1])
        else:
            connection[id_region].append([0,0,TREE[id_up][1],TREE[id_low][1],int(connect["source"]["port"])-1,int(connect["sinks"][0]["port"])-1])

        for i in range(maxnum-1):
            connection[i].sort(key=takeThird)

    return connection

if __name__=='__main__':  
    ##### load json file #####
    filename='./flow_focus_no_par.json'
    with open(filename) as f:
        layout=json.load(f)
    SIZE=[layout["params"]["x-span"],layout["params"]["y-span"]]
        
    for i in range(len(layout["components"])):
        if  layout["components"][i]["name"]=='n1':
            print('found',i)

