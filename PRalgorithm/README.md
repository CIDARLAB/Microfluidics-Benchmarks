# PRalgorithm：TREE-PLACE flow/control 核心算法

本目录把 TREE-PLACE 的两层物理设计主链整理为一个可独立识别的算法包，并提供三个命令行脚本和一个 Python API：

- `run_flow.py`：只运行 layer 0（flow）放置与布线。
- `run_control.py`：读取已有 layer-0 `result.json`，只运行 layer 1（control）综合。
- `run_flow_control.py`：先运行 flow，再运行 control。
- `api.py`：供其他 Python 程序直接调用。

原仓库根目录下的算法文件没有删除或修改；`core/` 是本次整理出的完整运行快照，便于后续单独维护、对比和迁移。

## 1. 目录结构

```text
PRalgorithm/
├── README.md
├── requirements.txt
├── __init__.py
├── api.py                    # 路径处理、输入准备和稳定 Python API
├── run_flow.py               # flow 层 CLI
├── run_control.py            # control 层 CLI
├── run_flow_control.py       # 两层串行 CLI
└── core/
    ├── flow_syn.py           # layer-0 主流程
    ├── control_syn.py        # layer-1 主流程
    ├── design_rules.py       # 两层共享设计规则
    ├── readjson.py           # 输入解析
    ├── writejson.py          # 结果回写
    ├── graph.py              # flow 图和层次树生成
    ├── disjoint_set.py       # 连通分量支持
    ├── rowplace.py           # 基于 row 的初始放置与压缩
    ├── rowroute.py           # row 间通道路由
    ├── withinrowroute.py     # row 内路由工具
    ├── order_and_mirror.py   # 顺序搜索、镜像和拓扑合法化
    ├── LP_postprocess.py     # 线性规划后处理
    ├── Bstar.py              # B*-tree/多子图 floorplan 支持
    ├── func_for_cluster.py   # cluster 子问题处理
    ├── mapping_for_3duf.py   # 3DµF 映射支持
    └── utils.py              # 通用 I/O、组合与绘图工具
```

`core/` 保留了旧代码的顶层模块导入方式。`api.py` 会自动把该目录加入模块搜索路径，并在调用 flow 时临时切换到仓库根目录。因此三个脚本可以从任意当前目录启动，不要求先 `cd` 到仓库根目录。

## 2. 环境要求

- Python 3.10 或更高版本。代码使用了 `match/case` 和现代类型标注。
- NumPy、SciPy、Matplotlib。
- 建议使用项目已有 `.venv`；本仓库当前可用环境为 Python 3.12。

在仓库根目录安装依赖：

```powershell
python -m venv .venv
.venv\Scripts\Activate.ps1
python -m pip install -r PRalgorithm\requirements.txt
```

Linux/macOS 对应命令：

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install -r PRalgorithm/requirements.txt
```

如果系统 Python 报 `ModuleNotFoundError: scipy`，说明没有进入项目虚拟环境，或尚未安装 `requirements.txt`。

## 3. 输入组织与数据约定

### 3.1 标准 benchmark 布局

flow 核心沿用 TREE-PLACE 的标准目录约定：

```text
Benchmarks/<category>/<filename>/<filename>.json
```

例如：

```text
Benchmarks/Quick_Examples/flow_and_control_demo/
└── flow_and_control_demo_fromLFR/
    └── flow_and_control_demo_fromLFR.json
```

对应参数是：

```text
category = Quick_Examples/flow_and_control_demo
filename = flow_and_control_demo_fromLFR
```

`category` 可以包含多级相对目录，但不能是绝对路径，也不能包含 `..`；`filename` 只能是单个目录名，不含 `.json`。

### 3.2 JSON 关键字段

输入至少应符合项目现有 netlist schema，并包含：

- `components`：器件、外部 flow port、valve 和 control port。
- `connections`：源端、汇端、layer 及连接参数。
- `params`：设计范围，如 `x-span`、`y-span`、`length`。
- `valves`：control 综合所需的 valve、flow connection、control port 映射。
- component 的 `ports`、`x-span`、`y-span` 和 `params.position/rotation`。

layer 0 通常用字符串 `"0"` 或 `layers: ["0"]` 表示；layer 1 同理。flow 输出会补全器件位置和 flow channel 路径，control 输出会进一步补全 valve/Cport 位置及 control channel 路径。

默认情况下，flow 脚本会把外部组件（ID 以 `port_` 开头）连接端点中的 `port: null` 改成 `port: "1"`。这是现有 flow 解析器所需的兼容处理。若直接运行标准 benchmark，这会原地更新该输入文件；可用 `--no-normalize-external-ports` 禁用。

### 3.3 从任意 JSON 导入

传入 `--input` 时，脚本会先把文件复制到上述标准位置，然后再运行：

```powershell
.venv\Scripts\python.exe PRalgorithm\run_flow.py `
  --category MyCases `
  --filename demo `
  --input C:\data\demo.json
```

若 `Benchmarks/MyCases/demo/demo.json` 已存在，脚本默认拒绝覆盖。明确需要替换时增加 `--force`。

## 4. 快速运行

以下命令均从仓库根目录演示；从其他目录运行时，只需把脚本路径写成绝对路径。

### 4.1 只跑 flow 层

```powershell
.venv\Scripts\python.exe PRalgorithm\run_flow.py `
  --category case_control `
  --filename flow_and_control_demo_fromLFR
```

主要输出：

```text
Benchmarks/case_control/flow_and_control_demo_fromLFR/result/result.json
```

同一目录还会生成 `1_...png` 到 `9_...png` 的中间放置/布线图片，便于定位算法阶段问题。

### 4.2 只跑 control 层

使用标准 benchmark 默认路径：

```powershell
.venv\Scripts\python.exe PRalgorithm\run_control.py `
  --category case_control `
  --filename flow_and_control_demo_fromLFR
```

也可以显式指定任意 flow 结果和输出位置：

```powershell
.venv\Scripts\python.exe PRalgorithm\run_control.py `
  --input Benchmarks\case_control\flow_and_control_demo_fromLFR\result\result.json `
  --output outputs\demo_control.json `
  --plot outputs\demo_layer01.png
```

CLI 中相对路径统一按仓库根目录解析，而不是按当前终端目录解析。

### 4.3 连续跑 flow + control

```powershell
.venv\Scripts\python.exe PRalgorithm\run_flow_control.py `
  --category case_control `
  --filename flow_and_control_demo_fromLFR
```

默认生成：

```text
result/result.json           # layer 0
result/result_control.json   # layer 0 + layer 1
result/layer01_check.png     # 两层联合检查图
```

指定 control 输出位置：

```powershell
.venv\Scripts\python.exe PRalgorithm\run_flow_control.py `
  --category case_control `
  --filename flow_and_control_demo_fromLFR `
  --output outputs\final.json `
  --plot outputs\final.png
```

查看所有参数：

```powershell
.venv\Scripts\python.exe PRalgorithm\run_flow.py --help
.venv\Scripts\python.exe PRalgorithm\run_control.py --help
.venv\Scripts\python.exe PRalgorithm\run_flow_control.py --help
```

## 5. Python API

从仓库根目录或已把仓库加入 `PYTHONPATH` 的项目中调用：

```python
from PRalgorithm import run_flow, run_control, run_flow_control

# 只运行 flow
flow_json = run_flow("case_control", "flow_and_control_demo_fromLFR")

# 在已有 flow JSON 上运行 control
control_json, plot_png = run_control(
    flow_json,
    "outputs/result_control.json",
    "outputs/layer01_check.png",
)

# 或一次运行两层
flow_json, control_json, plot_png = run_flow_control(
    "case_control",
    "flow_and_control_demo_fromLFR",
)
```

导入任意 JSON：

```python
flow_json, control_json, plot_png = run_flow_control(
    "MyCases",
    "demo",
    input_json="C:/data/demo.json",
    overwrite=False,
)
```

API 返回的都是绝对 `pathlib.Path`。`run_control()` 不依赖 benchmark 目录，可以直接处理任意位置的 layer-0 JSON。

## 6. 算法主流程

### 6.1 Flow layer

`core/flow_syn.py::gen_PR_developing()` 的主要阶段为：

1. 解析 layer-0 components/connections，生成 `tree.json` 和连通子图信息。
2. 按拓扑 row 完成初始放置，并根据端口关系决定器件旋转。
3. 对放置做对称化，生成 row 间初始通道路由。
4. 搜索合法器件顺序并应用镜像，减少不可平面连接。
5. 根据相邻 row 的连接关系缩短线长，并进行可选 LP 后处理。
6. 按 valve 区域设计规则重新分配路由间距，完成最终 compact。
7. 回写 component position/rotation、connection wayPoints/segments 和设计范围。
8. 对互不连通的 layer-0 子图进行紧凑 floorplan，写出 `result.json`。

如果日志出现 `Fail to find valid order`，函数可能提前结束；包装 API 会检查 `result.json` 是否实际生成，并在缺失时返回非零退出状态。

### 6.2 Control layer

`core/control_syn.py::run()` 的主要阶段为：

1. 读取 flow 结果并收集 layer-0 器件、外部 port 和 channel 障碍物。
2. 沿目标 flow connection 为每个 800×800 valve 搜索合法锚点。
3. 在设计外围紧凑放置 Cport，并把 valve 映射到合适的 Cport。
4. 在栅格上使用正交 A* 路由 control connection，简化路径并维护间距占用。
5. 对失败路径尝试备用 track route，记录 placement/routing failure。
6. 将版图平移到非负坐标，更新 `x-span/y-span/length`。
7. 写出合并 JSON，并绘制 layer 0/1 联合检查图。

当前共享设计规则位于 `core/design_rules.py`，包括 valve 尺寸以及 Cport、flow port、flow channel、device 和 bend 的最小间距。修改规则后应重新跑完整样例并检查 PNG。

## 7. 输出检查

脚本退出码为 `0` 表示调用过程完成且主要输出文件存在，但物理结果仍建议做以下检查：

- 打开 `layer01_check.png`，检查器件重叠、control route 交叉和异常长绕线。
- 检查终端是否打印 `Cannot finish valid layer-1 synthesis for:`；其后会列出失败 valve 和原因。
- 检查输出 JSON 中 `IsPlacedAndRouted`、`params.x-span/y-span`、connection `wayPoints/segments`。
- 对批量结果继续使用仓库现有批量脚本和汇总日志，不要只依赖进程退出码判断物理合法性。

## 8. 常见问题

### 找不到输入 JSON

确认路径严格为：

```text
Benchmarks/<category>/<filename>/<filename>.json
```

或使用 `--input` 自动复制到标准位置。

### `ModuleNotFoundError: scipy`

使用 `.venv/Scripts/python.exe`，或在当前环境安装 `requirements.txt`。

### 已有输入不允许覆盖

`--input` 的目标已经存在。确认内容可替换后显式使用 `--force`；不希望覆盖时换一个 `category` 或 `filename`。

### flow 没有生成 `result.json`

查看 flow 日志中最早出现的错误。常见原因是 JSON schema/端口编号不完整，或者顺序搜索未找到合法平面布局。

### control 打印部分 valve 失败

输出仍会写盘，用于诊断。根据打印的 `valve`、`flow_connection` 和 `control_port`，结合联合检查图确认是 valve 放置空间不足还是 control 路由没有可行通道。

### Matplotlib 在无显示环境报错

包装 API 默认使用无界面 `Agg` backend。若调用程序在导入 `PRalgorithm` 之前已经加载并锁定了其他 Matplotlib backend，可在启动前显式设置：

```powershell
$env:MPLBACKEND = "Agg"
.venv\Scripts\python.exe PRalgorithm\run_flow_control.py --category case_control --filename flow_and_control_demo_fromLFR
```

## 9. 维护说明

`PRalgorithm/core/` 是从仓库根目录以下文件整理出的快照：

```text
flow_syn.py control_syn.py design_rules.py disjoint_set.py graph.py
readjson.py writejson.py Bstar.py rowplace.py rowroute.py withinrowroute.py
order_and_mirror.py func_for_cluster.py LP_postprocess.py mapping_for_3duf.py utils.py
```

后续若继续修改根目录旧实现，应同步更新 `core/`，或正式把调用方迁移到 `PRalgorithm` 后只维护这里一份。同步后至少运行第 10 节中的导入检查、control smoke test 和完整示例。

## 10. 最小验证命令

仅验证模块和 CLI 可导入：

```powershell
.venv\Scripts\python.exe -m compileall -q PRalgorithm
.venv\Scripts\python.exe PRalgorithm\run_flow.py --help
.venv\Scripts\python.exe PRalgorithm\run_control.py --help
.venv\Scripts\python.exe PRalgorithm\run_flow_control.py --help
```

验证 control（复用已有 flow 结果，速度较快）：

```powershell
.venv\Scripts\python.exe PRalgorithm\run_control.py `
  --input case_control\result.json `
  --output PRalgorithm\_smoke\result_control.json `
  --plot PRalgorithm\_smoke\layer01_check.png
```

完整端到端验证：

```powershell
.venv\Scripts\python.exe PRalgorithm\run_flow_control.py `
  --category case_control `
  --filename flow_and_control_demo_fromLFR
```
