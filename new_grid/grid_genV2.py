from parchmint.device import ValveType
from pymint import MINTDevice, MINTComponent
from pymint.mintconnection import MINTConnection
from pymint.mintlayer import MINTLayer, MINTLayerType
from pymint.minttarget import MINTTarget
import sys

GRID_SIZE = 2
FLOW_CHANNEL_DEFAULTS = {"channelWidth": 100}
TREE_DEFAULTS = {"spacing": 1200, "flowChannelWidth": 100}
PORT_DEFAULTS = {"portRadius": 100}
DUMMY_CON = MINTConnection(
    "TEST",
    "TEST",
    {},
    MINTTarget("", ""),
    [MINTTarget("", "")],
    MINTLayer("", "", "", MINTLayerType.FLOW),
)
VALVE_DEFAULTS = {"width": 300, "length": 100}


def main():
    # Do this for 2, 4, 8, 16
    grid_size_arg = int(sys.argv[1])
    if grid_size_arg not in [2, 4, 8, 16]:
        raise ValueError("Grid size must be 2, 4, 8, or 16")
    GRID_SIZE = grid_size_arg
    # Create a new MINTDevice
    device = MINTDevice("grid_{}".format(GRID_SIZE))
    # Add the default Flow layer
    flow_layer_ref = device.create_mint_layer("flow1", "", "0", MINTLayerType.FLOW)
    # Add the default control layer
    control_layer_ref = device.create_mint_layer(
        "control1", "", "0", MINTLayerType.CONTROL
    )

    assert flow_layer_ref.ID is not None
    assert control_layer_ref.ID is not None

    port_in = MINTComponent(
        "port_in", "PORT", params=PORT_DEFAULTS, layers=[flow_layer_ref]
    )
    device.add_component(port_in)

    input_tree = MINTComponent(
        "input_tree", "TREE", params=TREE_DEFAULTS, layers=[flow_layer_ref]
    )
    input_tree.params.set_param("in", 1)
    input_tree.params.set_param("out", GRID_SIZE)
    device.add_component(input_tree)

    # Connect the input tree to the port
    device.create_mint_connection(
        "channel_in",
        "CHANNEL",
        {"channelWidth": 100},
        MINTTarget(port_in.ID, "1"),
        [MINTTarget(input_tree.ID, "1")],
        flow_layer_ref.ID,
    )

    cell_trap_refs = [[port_in for x in range(GRID_SIZE)] for y in range(GRID_SIZE)]
    # Create a grid of SQUARE CELL TRAP
    for i in range(1, GRID_SIZE + 1):
        for j in range(1, GRID_SIZE + 1):
            cell = MINTComponent(
                "ct_{}_{}".format(i, j),
                "SQUARE CELL TRAP",
                params={"chamberWidth": 100, "chamberLength": 100, "channelWidth": 100},
                layers=[flow_layer_ref],
            )
            device.add_component(cell)
            cell_trap_refs[i - 1][j - 1] = cell

    # Create the inter cell trap connections
    horizontal_connections = [
        [DUMMY_CON for x in range(GRID_SIZE - 1)] for y in range(GRID_SIZE)
    ]
    vertical_connections = [
        [DUMMY_CON for x in range(GRID_SIZE)] for y in range(GRID_SIZE - 1)
    ]

    # Do the horizontal ones first
    for i in range(1, GRID_SIZE + 1):
        for j in range(1, GRID_SIZE):
            con = device.create_mint_connection(
                "channel_horizontal_{}_{}".format(i, j),
                "CHANNEL",
                FLOW_CHANNEL_DEFAULTS,
                MINTTarget(cell_trap_refs[i - 1][j - 1].ID, "2"),
                [MINTTarget(cell_trap_refs[i - 1][j].ID, "4")],
                flow_layer_ref.ID,
            )
            horizontal_connections[i - 1][j - 1] = con

    # Do the vertical ones next
    for i in range(1, GRID_SIZE):
        for j in range(1, GRID_SIZE + 1):
            con = device.create_mint_connection(
                "channel_vertical_{}_{}".format(i, j),
                "CHANNEL",
                FLOW_CHANNEL_DEFAULTS,
                MINTTarget(cell_trap_refs[i - 1][j - 1].ID, "3"),
                [MINTTarget(cell_trap_refs[i][j - 1].ID, "1")],
                flow_layer_ref.ID,
            )
            vertical_connections[i - 1][j - 1] = con

    # Create the output tree
    output_tree = MINTComponent(
        "output_tree", "TREE", params=TREE_DEFAULTS, layers=[flow_layer_ref]
    )

    # Create input connections
    for i in range(1, GRID_SIZE + 1):
        device.create_mint_connection(
            "channel_in_{}".format(i),
            "CHANNEL",
            FLOW_CHANNEL_DEFAULTS,
            MINTTarget(input_tree.ID, str(i + 1)),
            [MINTTarget(cell_trap_refs[0][i - 1].ID, "1")],
            flow_layer_ref.ID,
        )

    output_tree = MINTComponent(
        "output_tree", "TREE", params=TREE_DEFAULTS, layers=[flow_layer_ref]
    )
    output_tree.params.set_param("in", 1)
    output_tree.params.set_param("out", GRID_SIZE)
    device.add_component(output_tree)

    # Create output connections
    for i in range(1, GRID_SIZE + 1):
        device.create_mint_connection(
            "channel_out_{}".format(i),
            "CHANNEL",
            FLOW_CHANNEL_DEFAULTS,
            MINTTarget(cell_trap_refs[GRID_SIZE - 1][i - 1].ID, "3"),
            [MINTTarget(output_tree.ID, str(GRID_SIZE + 1 - i))],
            flow_layer_ref.ID,
        )

    port_out = MINTComponent(
        "port_out", "PORT", params=PORT_DEFAULTS, layers=[flow_layer_ref]
    )
    device.add_component(port_out)

    # Create output port connection
    device.create_mint_connection(
        "channel_out",
        "CHANNEL",
        FLOW_CHANNEL_DEFAULTS,
        MINTTarget(output_tree.ID, "1"),
        [MINTTarget(port_out.ID, "1")],
        flow_layer_ref.ID,
    )

    # Generate valves on all the connections

    horizontal_valve_refs = [
        [port_in for x in range(GRID_SIZE - 1)] for y in range(GRID_SIZE)
    ]
    vertical_valve_refs = [
        [port_in for x in range(GRID_SIZE)] for y in range(GRID_SIZE - 1)
    ]
    # Add a valve on the horizontal connections
    for i in range(1, GRID_SIZE + 1):
        for j in range(1, GRID_SIZE):
            valve = device.create_valve(
                "valve_horizontal_{}_{}".format(i, j),
                "VALVE",
                VALVE_DEFAULTS,
                [control_layer_ref.ID],
                horizontal_connections[i - 1][j - 1],
            )
            horizontal_valve_refs[i - 1][j - 1] = valve

    # Add a valve on the vertical connections
    for i in range(1, GRID_SIZE):
        for j in range(1, GRID_SIZE + 1):
            valve = device.create_valve(
                "valve_vertical_{}_{}".format(i, j),
                "VALVE",
                VALVE_DEFAULTS,
                [control_layer_ref.ID],
                vertical_connections[i - 1][j - 1],
            )
            vertical_valve_refs[i - 1][j - 1] = valve

    # Create a port and connect to each of the rows of horizontal valves in the grid

    # Loop through each of the rows
    for i in range(1, GRID_SIZE + 1):
        # Create a port
        port_ctrl = MINTComponent(
            "port_ctrl_in_horizontal_{}".format(i),
            "PORT",
            params=PORT_DEFAULTS,
            layers=[control_layer_ref],
        )
        device.add_component(port_ctrl)
        # Connect the port to the first horizontal valve in the row
        sink_targets = []
        for j in range(1, GRID_SIZE):
            sink_targets.append(MINTTarget(horizontal_valve_refs[i - 1][j - 1].ID, "1"))
        device.create_mint_connection(
            "channel_ctrl_in_horizontal_{}".format(i),
            "CHANNEL",
            FLOW_CHANNEL_DEFAULTS,
            MINTTarget(port_ctrl.ID, "1"),
            sink_targets,
            control_layer_ref.ID,
        )

    # Create a port and connect to each of the rows of vertical valves in the grid

    # Loop through each of the rows
    for i in range(1, GRID_SIZE):
        # Create a port
        port_ctrl = MINTComponent(
            "port_ctrl_in_vertical_{}".format(i),
            "PORT",
            params=PORT_DEFAULTS,
            layers=[control_layer_ref],
        )
        device.add_component(port_ctrl)
        # Connect the port to the first vertical valve in the row
        sink_targets = []
        for j in range(1, GRID_SIZE + 1):
            sink_targets.append(MINTTarget(vertical_valve_refs[i - 1][j - 1].ID, "1"))
        device.create_mint_connection(
            "channel_ctrl_in_vertical_{}".format(i),
            "CHANNEL",
            FLOW_CHANNEL_DEFAULTS,
            MINTTarget(port_ctrl.ID, "1"),
            sink_targets,
            control_layer_ref.ID,
        )

    # Generate the MINT
    mint_text = device.to_MINT()
    print(mint_text)
    outfile = open("grid_{}.mint".format(GRID_SIZE), "w+")
    outfile.write(mint_text)


if __name__ == "__main__":
    main()