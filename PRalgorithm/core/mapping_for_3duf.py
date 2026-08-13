from readjson import *
from rowplace import *
from rowroute import *
from writejson import *
from order_and_mirror import *
from graph import *
from utils import *
# from withinrowroute import *
import random
import matplotlib.pyplot as plt
import time 
import math as m


################ !!! #######################
# In 3duf, rotate clockwise, y-axis flipped, reference point not always at the smallest x and y.
def map_for_3duf(ORI_JSON):
    reference=readjson('./3duf_ref.json')

    xmax=0
    ymax=0
    for i in range(len(ORI_JSON["components"])):
        # find compon in the reference json
        if ORI_JSON["components"][i]["params"]["rotation"]==0 or ORI_JSON["components"][i]["params"]["rotation"]==180:
            xmax=max(ORI_JSON["components"][i]["params"]["position"][0]+ORI_JSON["components"][i]["x-span"],xmax)
            ymax=max(ORI_JSON["components"][i]["params"]["position"][1]+ORI_JSON["components"][i]["y-span"],ymax)
        else:
            xmax=max(ORI_JSON["components"][i]["params"]["position"][0]+ORI_JSON["components"][i]["y-span"],xmax)
            ymax=max(ORI_JSON["components"][i]["params"]["position"][1]+ORI_JSON["components"][i]["x-span"],ymax)


        for item in reference["components"]:
            if item["name"]==ORI_JSON["components"][i]["entity"]:
                ref_point=item["ref_point"]
                break
    
        # deteremine the new x,y values

        if ref_point=="top_left":
            # ORI_JSON["components"][i]["params"]["position"][0]= # new x
            ORI_JSON["components"][i]["params"]["position"][1]=ORI_JSON["components"][i]["params"]["position"][1]+ORI_JSON["components"][i]["y-span"] # new y
        elif ref_point=="top_middle":
            ORI_JSON["components"][i]["params"]["position"][0]=ORI_JSON["components"][i]["params"]["position"][0]+ORI_JSON["components"][i]["x-span"]/2 # new x
            ORI_JSON["components"][i]["params"]["position"][1]=ORI_JSON["components"][i]["params"]["position"][1]+ORI_JSON["components"][i]["y-span"] # new y
        elif ref_point=="top_right":
            ORI_JSON["components"][i]["params"]["position"][0]=ORI_JSON["components"][i]["params"]["position"][0]+ORI_JSON["components"][i]["x-span"] # new x
            ORI_JSON["components"][i]["params"]["position"][1]=ORI_JSON["components"][i]["params"]["position"][1]+ORI_JSON["components"][i]["y-span"] # new y

        elif ref_point=="middle_left":
            # ORI_JSON["components"][i]["params"]["position"][0]= # new x
            ORI_JSON["components"][i]["params"]["position"][1]=ORI_JSON["components"][i]["params"]["position"][1]+ORI_JSON["components"][i]["y-span"]/2 # new y
        elif ref_point=="middle":
            ORI_JSON["components"][i]["params"]["position"][0]=ORI_JSON["components"][i]["params"]["position"][0]+ORI_JSON["components"][i]["x-span"]/2 # new x
            ORI_JSON["components"][i]["params"]["position"][1]=ORI_JSON["components"][i]["params"]["position"][1]+ORI_JSON["components"][i]["y-span"]/2 # new y
        elif ref_point=="middle_right":
            ORI_JSON["components"][i]["params"]["position"][0]=ORI_JSON["components"][i]["params"]["position"][0]+ORI_JSON["components"][i]["x-span"] # new x
            ORI_JSON["components"][i]["params"]["position"][1]=ORI_JSON["components"][i]["params"]["position"][1]+ORI_JSON["components"][i]["y-span"]/2 # new y

        elif ref_point=="bottom_left":
            continue
        elif ref_point=="bottom_middle":
            ORI_JSON["components"][i]["params"]["position"][0]=ORI_JSON["components"][i]["params"]["position"][0]+ORI_JSON["components"][i]["x-span"]/2 # new x
            # ORI_JSON["components"][i]["params"]["position"][1]= # new y
        elif ref_point=="bottom_right":
            ORI_JSON["components"][i]["params"]["position"][0]=ORI_JSON["components"][i]["params"]["position"][0]+ORI_JSON["components"][i]["x-span"] # new x
            # ORI_JSON["components"][i]["params"]["position"][1]= # new y
        
        else:
            print("WARNING: Invalid ref_point for "+ORI_JSON["components"][i]["name"]+", whose entity is "+ORI_JSON["components"][i]["entity"])
            # print(ref_point)
    # change to new y axis which fits 3duf
    # location of blocks
    for i in range(len(ORI_JSON["components"])):   
        ORI_JSON["components"][i]["params"]["position"][1]=ymax-ORI_JSON["components"][i]["params"]["position"][1]
    
    # waypoints of connections
    for j in range(len(ORI_JSON["connections"])):
        for k in range(len(ORI_JSON["connections"][j]["paths"][0]["wayPoints"])):
            ORI_JSON["connections"][j]["paths"][0]["wayPoints"][k][1]=ymax-ORI_JSON["connections"][j]["paths"][0]["wayPoints"][k][1]

    return xmax,ymax