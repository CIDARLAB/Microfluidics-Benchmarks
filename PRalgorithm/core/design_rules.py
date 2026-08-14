"""Shared physical-design rules used by flow and control synthesis."""


VALVE_SIZE = 800.0
# Minimum edge-to-edge distances. A zero bend clearance permits boundary
# contact, but the bend point must not enter the valve interior.
VALVE_FLOW_PORT_CLEARANCE = 1000.0
CPORT_FLOW_PORT_CLEARANCE = 1000.0
CPORT_FLOW_CHANNEL_CLEARANCE = 1000.0
CPORT_VALVE_CLEARANCE = 1000.0
CPORT_DEVICE_CLEARANCE = 1000.0
CPORT_CPORT_CLEARANCE = 1000.0
VALVE_BEND_CLEARANCE = 100.0
