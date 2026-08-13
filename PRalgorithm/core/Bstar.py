from readjson import *
from rowplace import *
from rowroute import *
from writejson import *
from order_and_mirror import *
from func_for_cluster import *
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

# SA + B* tree floorplan

class Block:
    def __init__(self,name,width,height):
        self.name=name # suggested name: "sub1", "sub2", etc.
        self.width=width
        self.height=height

class Node:
    def __init__(self,idx,block):
        self.idx=idx
        self.block=block
        self.rotation=0 # by default, no rotation. 0 for not rotate, 1 for 90 degree clockwise rotation
        self.left=None
        self.right=None     

class B_star_tree:
    def __init__(self,ori_blocks):
        # generate default balanced B* tree
        # construct the nodes
        self.node=[]
        # put largest block in the middle
        ori_blocks.sort(key=lambda x: x.width*x.height) 
        mid=len(ori_blocks)//2
        first_half=ori_blocks[:mid]
        second_half=ori_blocks[mid:]
        second_half.reverse()
        self.blocks=first_half+second_half

        for i in range(len(self.blocks)):
            tmp_node=Node(i,self.blocks[i]) # after reordering, giving indecies
            self.node.append(tmp_node)
            
        self.root=self.build_tree(self.node) # balanced tree

    def build_tree(self,nodes):
        if not nodes:
            return None

        mid=len(nodes)//2

        nodes[mid].left=self.build_tree(nodes[:mid])
        nodes[mid].right=self.build_tree(nodes[mid+1:])

        return nodes[mid]

    def find_block(self,idx):
        return self._find_block(self.root,idx)

    def _find_block(self,node,idx):
        if node is None:
            return None

        if idx == node.idx:
            return node.block
        elif idx < node.idx:
            return self._find_block(node.left,idx)
        else:
            return self._find_block(node.right,idx)

class B_star_floorplan:
    def __init__(self,ori_blocks):
        self.b_star_tree=B_star_tree(ori_blocks)
        self.positions=[]
        for _ in range(len(ori_blocks)):
            self.positions.append([0,0])
        
    def map_tree_to_floorplan(self,cur_node,list_of_reached):
        # before execute this function, need to set the position of the root node as [0,0], and add the idx of the root in list_of_reached
        if cur_node==self.b_star_tree.root:
            idx_root=self.b_star_tree.node.index(cur_node)
            self.positions[idx_root]=[0,0]
            list_of_reached.append(idx_root)
        
        cur_x=self.positions[cur_node.idx][0]
        cur_y=self.positions[cur_node.idx][1]
        if cur_node.rotation:
            cur_w=cur_node.block.height
            cur_h=cur_node.block.width
        else:
            cur_w=cur_node.block.width
            cur_h=cur_node.block.height          

        if cur_node.left!=None:
            l_idx=self.b_star_tree.node.index(cur_node.left)

            if self.b_star_tree.node[l_idx].rotation:
                l_w=self.b_star_tree.node[l_idx].block.height
                l_h=self.b_star_tree.node[l_idx].block.width
            else:
                l_w=self.b_star_tree.node[l_idx].block.width
                l_h=self.b_star_tree.node[l_idx].block.height

            max_h=max(0,cur_y-l_h)
            # min_h=cur_y+cur_h

            for idx_reach in list_of_reached:
                if self.b_star_tree.node[idx_reach].rotation:
                    dx=self.b_star_tree.node[idx_reach].block.height
                    dy=self.b_star_tree.node[idx_reach].block.width
                else:
                    dx=self.b_star_tree.node[idx_reach].block.width
                    dy=self.b_star_tree.node[idx_reach].block.height

                if self.positions[idx_reach][0]>cur_x+cur_w+l_w or cur_x+cur_w+l_w+dx<cur_x:
                    pass
                elif self.positions[idx_reach][1]+dy>max_h and self.positions[idx_reach][1]<cur_y:
                    max_h=self.positions[idx_reach][1]+dy

            if max_h>=cur_y+cur_h:
                return None
            else:
                self.positions[l_idx]=[cur_x+cur_w,max_h] # left node new position

            if self.if_overlap(cur_node.left,list_of_reached):
                return None
            else:
                list_of_reached.append(l_idx)
                flag_l=self.map_tree_to_floorplan(cur_node.left,list_of_reached)
        else:
            flag_l=True # if there is no left node, let the flag be true to proceed to the right node

        if flag_l: # only when the left attempt succeeds, proceed to the right attempt
            if cur_node.right!=None:
                r_idx=self.b_star_tree.node.index(cur_node.right)
                self.positions[r_idx]=[cur_x,cur_y+cur_h] # right node
                if self.if_overlap(cur_node.right,list_of_reached):
                    return None
                else:
                    list_of_reached.append(r_idx)
                    flag_r=self.map_tree_to_floorplan(cur_node.right,list_of_reached)
            else:
                flag_r=True # if there is no right node, proceed

            if flag_r:
                return True
            else:
                return None
        else:
            return None


    def if_overlap(self,cur_node,list_of_reached):
        # return 1 for overlap, 0 for no overlapping
        cur_idx=self.b_star_tree.node.index(cur_node)
        cur_x=self.positions[cur_idx][0]
        cur_y=self.positions[cur_idx][1]

        if cur_node.rotation:
            cur_w=cur_node.block.height
            cur_h=cur_node.block.width
        else:
            cur_w=cur_node.block.width
            cur_h=cur_node.block.height

        for idx in list_of_reached:
            if self.b_star_tree.node[idx].rotation:
                w=self.b_star_tree.node[idx].block.height
                h=self.b_star_tree.node[idx].block.width
            else:
                w=self.b_star_tree.node[idx].block.width
                h=self.b_star_tree.node[idx].block.height

            if self.positions[idx][0]+w <= cur_x or self.positions[idx][1]+h <= cur_y or cur_x+cur_w <= self.positions[idx][0] or cur_y+cur_h <= self.positions[idx][1]:
                pass
            else:
                return True
            
        return None

    def perturb(self,record_attempts):
        # only consider swapping two nodes 
        # determine the nodes to be operated
        idx_1,idx_2=random.sample(list(range(len(self.b_star_tree.node))),2)

        # swich the two nodes
        ## switch the connection to parent nodes
        for idx in range(len(self.b_star_tree.node)):
            if self.b_star_tree.node[idx].left:
                if self.b_star_tree.node[idx].left.idx==idx_1:
                    self.b_star_tree.node[idx].left=self.b_star_tree.node[idx_2]
                elif self.b_star_tree.node[idx].left.idx==idx_2:
                    self.b_star_tree.node[idx].left=self.b_star_tree.node[idx_1]
            if self.b_star_tree.node[idx].right:
                if self.b_star_tree.node[idx].right.idx==idx_1:
                    self.b_star_tree.node[idx].right=self.b_star_tree.node[idx_2]
                elif self.b_star_tree.node[idx].right.idx==idx_2:
                    self.b_star_tree.node[idx].right=self.b_star_tree.node[idx_1]

        ## if one of the two is the root, change the root setting
        if self.b_star_tree.node[idx_1]==self.b_star_tree.root:
            self.b_star_tree.root=self.b_star_tree.node[idx_2]
        elif self.b_star_tree.node[idx_2]==self.b_star_tree.root:
            self.b_star_tree.root=self.b_star_tree.node[idx_1]
        
        ## switch son nodes
        tmp_node_l=self.b_star_tree.node[idx_1].left
        tmp_node_r=self.b_star_tree.node[idx_1].right

        self.b_star_tree.node[idx_1].left=self.b_star_tree.node[idx_2].left
        self.b_star_tree.node[idx_1].right=self.b_star_tree.node[idx_2].right

        self.b_star_tree.node[idx_2].left=tmp_node_l
        self.b_star_tree.node[idx_2].right=tmp_node_r 

        # check if this pattern has been reached
        if self.gen_seq(self.b_star_tree.root) in record_attempts:
            return None, 9999999999999999

        # check rotations
        ## 4 cases, only maintain the best case(with the lowest cost)
        costs=[]
        self.b_star_tree.node[idx_1].rotation=0
        self.b_star_tree.node[idx_2].rotation=0
        costs.append(self.evaluate_cost())

        self.b_star_tree.node[idx_1].rotation=0
        self.b_star_tree.node[idx_2].rotation=1
        costs.append(self.evaluate_cost())

        self.b_star_tree.node[idx_1].rotation=1
        self.b_star_tree.node[idx_2].rotation=0
        costs.append(self.evaluate_cost())

        self.b_star_tree.node[idx_1].rotation=1
        self.b_star_tree.node[idx_2].rotation=1
        costs.append(self.evaluate_cost())

        best_cost=min(costs)
        idx_best=costs.index(best_cost)
        match idx_best:
            case 0:
                self.b_star_tree.node[idx_1].rotation=0
                self.b_star_tree.node[idx_2].rotation=0
            case 1:
                self.b_star_tree.node[idx_1].rotation=0
                self.b_star_tree.node[idx_2].rotation=1
            case 2:
                self.b_star_tree.node[idx_1].rotation=1
                self.b_star_tree.node[idx_2].rotation=0
            case 3:
                self.b_star_tree.node[idx_1].rotation=1
                self.b_star_tree.node[idx_2].rotation=1

        record_attempts.append(self.gen_seq(self.b_star_tree.root))
        return True, best_cost
        
    def gen_seq(self,curnode):
        seq=[]
        seq.append(curnode.idx)
        if curnode.left!=None:
            subseq_l=self.gen_seq(curnode.left)
        else:
            subseq_l=[]

        if curnode.right!=None:
            subseq_r=self.gen_seq(curnode.right)
        else:
            subseq_r=[]

        subseq=subseq_l+subseq_r
        seq=seq+subseq
        return seq

    def evaluate_cost(self):
        flag=self.map_tree_to_floorplan(self.b_star_tree.root,[])
        if flag:
            max_x=0
            max_y=0
            for i in range(len(self.b_star_tree.node)):
                if self.b_star_tree.node[i].rotation:
                    max_x=max(max_x,self.positions[i][0]+self.b_star_tree.node[i].block.height)
                    max_y=max(max_y,self.positions[i][1]+self.b_star_tree.node[i].block.width)
                else:
                    max_x=max(max_x,self.positions[i][0]+self.b_star_tree.node[i].block.width)
                    max_y=max(max_y,self.positions[i][1]+self.b_star_tree.node[i].block.height)
            # print(max_x,max_y)
            return max_x*max_y # use the area as the cost
        else:
            return 9999999999999999 # failed floorplan, return inf cost
        
    def accept_new_solution(self, old_cost, new_cost, temperature):
        if new_cost < old_cost:
            # If the new solution is better (lower cost), accept it
            return True
        else:
            # If the new solution is worse (higher cost), accept it with a certain probability
            delta_cost = new_cost - old_cost
            acceptance_probability = m.exp(-delta_cost / temperature)
            return random.random() < acceptance_probability

def update_temperature(current_temperature, cooling_rate):
    # Linearly reduce the temperature by the cooling rate
    new_temperature = current_temperature - cooling_rate
    return max(new_temperature, 0)

def gen_floorplan(blocks,ini_temperature,threshold,max_iter,rate):
    floorplan=B_star_floorplan(blocks)
    best_solution=floorplan
    best_cost=floorplan.evaluate_cost()
    temp=ini_temperature
    cool_rate=rate

    attempt_record=[]
    attempt_record.append(floorplan.b_star_tree)

    iteration=0
    max_iteration=max_iter

    while temp>threshold and iteration<max_iteration:
        flag,newcost=floorplan.perturb(attempt_record)
        print(iteration,newcost,best_cost)

        if flag:
            if floorplan.accept_new_solution(best_cost,newcost,temp):
                best_solution=copy.deepcopy(floorplan)
                best_cost=newcost
        
        temp=update_temperature(temp,cool_rate)
        iteration+=1

    # flag_final=best_solution.map_tree_to_floorplan(best_solution.b_star_tree.root,[])
    print("Final cost:",best_solution.evaluate_cost())
    return best_solution

def mapping_to_wholedesign(FLOORPLAN,CLUSTER):
    pass


###### main ######
if __name__ == "__main__":
    b = [Block('sub1', 4, 5), Block('sub2', 3, 7), Block('sub3', 6, 2), Block('sub4', 8, 4), Block('sub5', 5, 6)]
    initial_temperature = 100.0
    cooling_down_threshold = 1e-3
    cooling_rate=1
    max_iterations = 500

    solution=gen_floorplan(b,initial_temperature,cooling_down_threshold,max_iterations,cooling_rate)
    print("Results:")
    # print(f"New sequence of blocks:")
    # for nod in solution.b_star_tree.node:
    #     print(nod.idx,nod.block.name,nod.block.width,nod.block.height)


    cnt=0
    print(f"Location of blocks:")
    for pos in solution.positions:
        print(f"Block {cnt}, name \"{solution.b_star_tree.node[cnt].block.name}\", size {(solution.b_star_tree.node[cnt].block.width,solution.b_star_tree.node[cnt].block.height)} at Position: ({pos[0]}, {pos[1]}), Rotation: {solution.b_star_tree.node[cnt].rotation}")
        # if solution.b_star_tree.node[cnt].left!=None:
        #     print("left:",{solution.b_star_tree.node[cnt].left.idx})
        # if solution.b_star_tree.node[cnt].right!=None:
        #     print("right:",{solution.b_star_tree.node[cnt].right.idx})
        cnt+=1