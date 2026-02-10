import os
import random
import re
import sys

TREE_DEVICE_FOLDER = "BaseDevices"


def load_device_template(path):
    with open(path, 'r') as f:
        return f.read()


def extract_io_vars(lfr_text):
    match = re.search(
        r'module\s+([A-Za-z_]\w*)\s*\((.*?)\)\s*;', lfr_text, re.DOTALL)
    if not match:
        raise ValueError("Could not parse module header.")
    ports_block = match.group(2)
    port_lines = [p.strip() for p in ports_block.split(',') if p.strip()]
    inputs = []
    outputs = []
    current_mode = None
    for port in port_lines:
        if port.startswith("finput"):
            port = port[len("finput"):].strip()
            current_mode = "input"
        elif port.startswith("foutput"):
            port = port[len("foutput"):].strip()
            current_mode = "output"
        if current_mode:
            for name in port.split(','):
                clean = name.strip()
                if clean:
                    if current_mode == "input":
                        inputs.append({'name': clean})
                    else:
                        outputs.append(clean)
    if len(inputs) < 2 or len(outputs) < 1:
        raise ValueError(
            "Each device must have at least 2 inputs and 1 output")
    return inputs, outputs


def strip_module_body(lfr_text):
    lines = lfr_text.splitlines()
    inside = False
    body_lines = []
    for line in lines:
        stripped = line.strip()
        if stripped.startswith("module"):
            inside = True
            continue
        elif stripped == ");" or stripped.startswith("endmodule"):
            continue
        elif inside:
            if stripped.startswith("finput") or stripped.startswith("foutput") or not stripped:
                continue
            body_lines.append(stripped)
    return "\n".join(body_lines)


def _mask_strings(s):
    placeholders = []

    def repl(m):
        placeholders.append(m.group(0))
        return f"__STR_{len(placeholders)-1}__"
    masked = re.sub(r'"[^"\n]*"', repl, s)
    return masked, placeholders


def _unmask_strings(s, placeholders):
    def repl(m):
        idx = int(m.group(1))
        return placeholders[idx]
    return re.sub(r'__STR_(\d+)__', repl, s)


def _strip_dev_suffix(name: str) -> str:
    return re.sub(r'_dev\d+$', '', name)


def rename_variables(body, inputs, outputs, input_renames, new_outputs, device_suffix):
    masked, placeholders = _mask_strings(body)
    renamed = masked

    for inp in inputs:
        old_name = inp['name']
        new_name = input_renames[old_name]
        renamed = re.sub(
            rf'(?<!\w){re.escape(old_name)}(?!\w)', new_name, renamed)

    for old, new in zip(outputs, new_outputs):
        if "[" in old:
            base = old.split("[")[0]
            renamed = re.sub(rf'(?<!\w){re.escape(old)}(?!\w)', new, renamed)
            renamed = re.sub(rf'(?<!\w){re.escape(base)}(?!\w)', new, renamed)
        else:
            renamed = re.sub(rf'(?<!\w){re.escape(old)}(?!\w)', new, renamed)

    reserved = set(input_renames.values()) | set(new_outputs)
    keywords = {
        'module', 'endmodule', 'finput', 'foutput', 'storage', 'assign', 'case', 'begin', 'end',
        'distribute', 'if', 'else', 'endcase', 'flow', 'MAP'
    }

    tokens = set(re.findall(r'\b([a-zA-Z_][a-zA-Z0-9_]*)\b', renamed))
    for var in sorted(tokens, key=len, reverse=True):
        if var in reserved or var in keywords:
            continue
        if re.search(r'^__STR_\d+__$', var):
            continue
        if re.search(rf'#\s*{re.escape(var)}\b', renamed):
            continue
        clean_var = _strip_dev_suffix(var)
        renamed = re.sub(rf'(?<!\w){re.escape(var)}(?!\w)',
                         f"{clean_var}_{device_suffix}", renamed)

    renamed = _unmask_strings(renamed, placeholders)
    return renamed


def build_tree(num_levels, device_templates):
    num_leaf_nodes = 2 ** num_levels
    device_counter = 0
    lfr_blocks = []
    input_declarations = []
    output_vars = []
    final_output = None

    def declare_flows(outputs):
        return [f"flow {name};" for name in outputs]

    for _ in range(num_leaf_nodes):
        dev_path = random.choice(device_templates)
        print(f"Device {device_counter}: {os.path.basename(dev_path)}")
        raw_code = load_device_template(dev_path)
        inputs, outputs = extract_io_vars(raw_code)
        body = strip_module_body(raw_code)

        input_renames = {}
        top_inputs = []
        for inp in inputs:
            orig = inp['name']
            renamed_in = f"{_strip_dev_suffix(orig)}_dev{device_counter}"
            input_renames[orig] = renamed_in
            top_inputs.append(renamed_in)
        input_declarations.extend(top_inputs)

        renamed_outputs = [
            f"out_dev{device_counter}_{i}" for i in range(len(outputs))]
        renamed_block = rename_variables(
            body, inputs, outputs, input_renames, renamed_outputs, f"dev{device_counter}")

        block_lines = []
        block_lines += declare_flows(renamed_outputs)
        block_lines.extend(
            ln for ln in renamed_block.splitlines() if ln.strip() != "")
        lfr_blocks.append("\n".join(block_lines))

        output_vars.append(renamed_outputs[0])
        device_counter += 1

    while len(output_vars) > 1:
        next_level = []
        for i in range(0, len(output_vars), 2):
            dev_path = random.choice(device_templates)
            print(f"Device {device_counter}: {os.path.basename(dev_path)}")
            raw_code = load_device_template(dev_path)
            inputs, outputs = extract_io_vars(raw_code)
            body = strip_module_body(raw_code)

            if len(inputs) < 2:
                raise ValueError(
                    "Each internal device must have at least 2 inputs")

            input_renames = {
                inputs[0]['name']: output_vars[i],
                inputs[1]['name']: output_vars[i + 1]
            }
            for extra_inp in inputs[2:]:
                clean = _strip_dev_suffix(extra_inp['name'])
                renamed = f"{clean}_dev{device_counter}"
                input_renames[extra_inp['name']] = renamed
                input_declarations.append(renamed)

            renamed_outputs = [
                f"out_dev{device_counter}_{j}" for j in range(len(outputs))]
            renamed_block = rename_variables(
                body, inputs, outputs, input_renames, renamed_outputs, f"dev{device_counter}")

            is_final = len(output_vars) == 2 and len(next_level) == 0
            block_lines = []
            if is_final:
                final_output = renamed_outputs[0]
                if len(renamed_outputs) > 1:
                    block_lines += declare_flows(renamed_outputs[1:])
            else:
                block_lines += declare_flows(renamed_outputs)
            block_lines.extend(
                ln for ln in renamed_block.splitlines() if ln.strip() != "")
            lfr_blocks.append("\n".join(block_lines))

            next_level.append(renamed_outputs[0])
            device_counter += 1
        output_vars = next_level

    if not final_output:
        final_output = output_vars[0]

    return lfr_blocks, input_declarations, final_output


def generate_tree_lfr(levels, output_file):
    device_templates = [os.path.join(TREE_DEVICE_FOLDER, f)
                        for f in os.listdir(TREE_DEVICE_FOLDER)
                        if f.endswith(".lfr")]

    if not device_templates:
        raise FileNotFoundError("No valid .lfr files in 'Tree Devices V3/'")

    blocks, input_declarations, final_output = build_tree(
        levels, device_templates)

    module_name = os.path.splitext(os.path.basename(output_file))[0]

    lfr = []
    lfr.append(f"module {module_name}(")
    lfr.append(f"    finput {', '.join(input_declarations)},")
    lfr.append(f"    foutput {final_output}")
    lfr.append(");")
    lfr.append("")
    lfr.append(("\n\n").join(blocks))
    lfr.append("")
    lfr.append("endmodule")
    lfr_text = "\n".join(lfr)

    with open(output_file, 'w') as f:
        f.write(lfr_text)

    print(f"Final output: {final_output}")
    print(f"Module name: {module_name}")
    print(f"Output written to: {output_file}")


if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python generate_tree_lfr.py <num_files> <height>")
        sys.exit(1)

    num_files = int(sys.argv[1])
    height = int(sys.argv[2])

    os.makedirs("output", exist_ok=True)

    for i in range(1, num_files + 1):
        filename = f"treeDevice_{height}_{i}_ref.lfr"
        output_path = os.path.join("output", filename)
        generate_tree_lfr(height, output_path)
