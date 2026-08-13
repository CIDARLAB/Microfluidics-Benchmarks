import numpy as np
from utils import *

class UnionFind:
    def __init__(self, n):
        self.parent = list(range(n))
        self.rank = [0] * n

    def find(self, x):
        # print(x)
        # print(rf"root:{self.parent[x]}")
        if self.parent[x] != x:
            self.parent[x] = self.find(self.parent[x])
        return self.parent[x]

    def union(self, x, y):
        rootx = self.find(x)
        rooty = self.find(y)
        if rootx != rooty:
            if self.rank[rootx] < self.rank[rooty]:
                rootx, rooty = rooty, rootx
            self.parent[rooty] = rootx
            if self.rank[rootx] == self.rank[rooty]:
                self.rank[rootx] += 1

def detect_cluster(NODE,UP,BELOW):
    m=len(NODE)
    uf=UnionFind(m)

    neighbor=[]
    for i in range(m):
        neighbor.append([])
        neighbor[i]=UP[i]+BELOW[i]

    for j in range(m):
        for nei_p in neighbor[j]:
            uf.union(j,nei_p)

    record_root=[]
    cluster=[]
    # for k in NODE:
    for k in range(m):
        tmp_root=uf.find(k)
        if tmp_root not in record_root:
            record_root.append(tmp_root)
            cluster.append([])

        cluster[record_root.index(tmp_root)].append(k)

    return cluster


###### For project GPPP, not applicable here ##########
# def legalization(points,SKELETON,DIM):
#     # points is a list containing all the points
#     m = len(points)
#     uf = UnionFind(m)
#     if DIM==2:
#         directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
#         for i in range(m):
#             for dx, dy in directions:
#                 ni, nj = points[i][0] + dx, points[i][1] + dy
#                 if [ni,nj] in points:
#                     uf.union(i , points.index([ni,nj]))

#         island=[]
#         for i in range(m):
#             if uf.find(i)!=uf.find(points.index(SKELETON[0])):
#                 island.append(points[i])

#     else:
#         directions = [(0,0,1), (0,0,-1),(1,0,0),(-1,0,0),(0,1,0),(0,-1,0)]
#         for i in range(m):
#             for dx, dy, dk in directions:
#                 ni, nj, nk = points[i][0] + dx, points[i][1] + dy, points[i][2] + dk
#                 if [ni,nj,nk] in points:
#                     uf.union(i , points.index([ni,nj,nk]))

#         island=[]
#         for i in range(m):
#             if uf.find(i)!=uf.find(points.index(SKELETON[0])):
#                 island.append(points[i])

#     return island
