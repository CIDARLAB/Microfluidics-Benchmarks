#! /usr/bin/env python
# -*- coding: utf-8 -*-
import sys
import string
import random
import math


def newline(f):
    f.write("\n")


def inputFlowChannels(minChannel, maxChannel, minMux, minCellTrap, f):
    f.write(
        "CHANNEL c"
        + str(minChannel)
        + " from p1 3 to m1 "
        + str(minMux)
        + " channelWidth=100;\n"
    )
    for i in range(minChannel + 1, maxChannel + 1):
        minMux = minMux + 1
        f.write(
            "CHANNEL c"
            + str(i)
            + " from m1 "
            + str(minMux)
            + " to ct"
            + str(minCellTrap)
            + " 1 channelWidth=100;\n"
        )
        minCellTrap = minCellTrap + 1


def cellTrapGridH(minChannel, maxChannel, minCellTrap, f):
    for i in range(minChannel, maxChannel):
        f.write(
            "CHANNEL c"
            + str(i)
            + " from ct"
            + str(minCellTrap)
            + " 2 to ct"
            + str(minCellTrap + 1)
            + " 4 channelWidth=100;\n"
        )
        minCellTrap = minCellTrap + 1


def cellTrapGridV(minChannel, maxChannel, minCT1, minCT2, f):
    for i in range(minChannel, maxChannel):
        f.write(
            "CHANNEL c"
            + str(i)
            + " from ct"
            + str(minCT1)
            + " 3 to ct"
            + str(minCT2)
            + " 1 channelWidth=100;\n"
        )
        minCT1 = minCT1 + 1
        minCT2 = minCT2 + 1


def outputFlowChannels(minChannel, maxChannel, minMux, minCellTrap, f):
    for i in range(minChannel, maxChannel - 1):
        f.write(
            "CHANNEL c"
            + str(i)
            + " from ct"
            + str(minCellTrap)
            + " 3 to m2 "
            + str(minMux)
            + " channelWidth=100;\n"
        )
        minCellTrap = minCellTrap + 1
        minMux = minMux + 1
    f.write(
        "CHANNEL c"
        + str(maxChannel - 1)
        + " from m2 "
        + str(minMux)
        + " to p2 1 channelWidth=100;\n"
    )


def hValves(minValve, maxValve, minChannel, f):
    for i in range(minValve, maxValve):
        f.write(
            "VALVE v"
            + str(i)
            + " on c"
            + str(minChannel)
            + " channelWidth=300 length=100;\n"
        )
        minChannel = minChannel + 1


def vValves(minValve, maxValve, minChannel, f):
    for i in range(minValve, maxValve):
        f.write(
            "VALVE v"
            + str(i)
            + " on c"
            + str(minChannel)
            + " channelWidth=100 length=300;\n"
        )
        minChannel = minChannel + 1


def nets(net, valve, valve_range, f):
    f.write("NET n" + str(net) + " from cpb1 " + str(net) + " to")
    for i in range(valve, valve_range - 1):
        f.write(" v" + str(i) + " 3,")
    f.write(" v" + str(valve_range - 1) + " 3")
    f.write(" channelWidth=50;\n")


def controlChannels(minChannel, maxChannel, minValve, port, f):
    for i in range(minChannel, maxChannel):
        f.write(
            "CHANNEL cc"
            + str(i)
            + " from v"
            + str(minValve)
            + " 2 to v"
            + str(minValve + 1)
            + " 4 channelWidth=50;\n"
        )
        minValve = minValve + 1
    f.write(
        "CHANNEL cc"
        + str(i + 1)
        + " from v"
        + str(minValve)
        + " 2 to cpb2 "
        + str(port)
        + " channelWidth=50;\n"
    )


grid_size = input("Enter Grid Size: ")
device_name = "grid_" + str(grid_size)
f = open(device_name + ".mint", "w")

f.write("DEVICE " + device_name + "\n")
newline(f)
f.write("LAYER FLOW\n")
f.write("H TREE m1 1 to " + str(grid_size) + " spacing=1200 flowChannelWidth=100 ;\n")
f.write("H TREE m2 " + str(grid_size) + " to 1 spacing=1200 flowChannelWidth=100 ;\n")
f.write("PORT p1, p2 r=100;\n")
f.write("SQUARE CELL TRAP ")
for i in range(1, grid_size * grid_size):
    f.write("ct" + str(i) + ", ")
f.write("ct" + str(grid_size * grid_size) + " ")
f.write("chamberWidth=100 chamberLength=100 channelWidth=100 ;\n")
inputFlowChannels(1, grid_size + 1, 1, 1, f)
newline(f)
curChannelCount = grid_size + 2
j = 2 * grid_size - 1
k = grid_size - 1
for i in range(0, k):
    cellTrapGridH(
        curChannelCount + i * j, curChannelCount + i * j + k, grid_size * i + 1, f
    )
    newline(f)
    cellTrapGridV(
        curChannelCount + i * j + k,
        curChannelCount + i * j + 2 * grid_size - 1,
        grid_size * i + 1,
        grid_size * (i + 1) + 1,
        f,
    )
    newline(f)
cellTrapGridH(
    curChannelCount + k * j, curChannelCount + k * (j + 1), grid_size * k + 1, f
)
outputFlowChannels(
    curChannelCount + k * (j + 1),
    curChannelCount + k * j + 2 * grid_size,
    1,
    grid_size * k + 1,
    f,
)
newline(f)
f.write("END LAYER\n")
newline(f)
f.write("LAYER CONTROL\n")
f.write("V BANK cpb1 of " + str(grid_size) + " PORT portRadius=100  spacing=1500 ;\n")
f.write(
    "V BANK cpb2 of " + str(grid_size - 1) + " PORT portRadius=100  spacing=1500 ;\n"
)
newline(f)
for i in range(0, k):
    vValves(i * j + 1, i * j + grid_size, curChannelCount + i * j, f)
    newline(f)
    nets(i + 1, i * j + 1, i * j + grid_size, f)
    newline(f)
    hValves(i * j + grid_size, i * j + 2 * grid_size, curChannelCount + i * j + k, f)
    newline(f)
    controlChannels(i * grid_size + 1, (i + 1) * grid_size, i * j + grid_size, i + 1, f)
    newline(f)
vValves(k * j + 1, k * j + grid_size, curChannelCount + k * j, f)
newline(f)
nets(grid_size, k * j + 1, k * j + grid_size, f)
newline(f)
f.write("END LAYER")
newline(f)
f.close()
