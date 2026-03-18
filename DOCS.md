# SES API Reference & Technical Documentation 📖

Welcome to the official technical documentation for **SES (Simulink Easy Script)**. This guide provides a comprehensive breakdown of the engine, the block library, and the high-performance "Turbo" architecture.

---

## 1. Architectural Overview
SES operates as a **Headless Model Compiler**. Unlike traditional MATLAB scripts that interact with the Simulink GUI for every operation, SES builds models in an internal memory state (via `load_system`) and only renders the graphical representation upon user request.

### Directory Structure
```text
SES-Simulink-Library/
├── library/
│   ├── from.m           # Import Registry & Alias Engine
│   └── +ses/            # Core Package
│       ├── start.m      # Engine Initialization
│       ├── run.m        # Simulation & Persistence
│       ├── connect.m    # Port Wiring Logic
│       └── +block/      # Categorized Block Library
└── examples/            # Benchmark & Usage Samples
```

---

## 2. Core Engine API

### `start(modelName)`
Initializes a new Simulink environment in "Turbo Mode" (Background).
- **Parameters**: 
    - `modelName` (string/char): The name of the model to create or clear.
- **Side Effects**: Automatically deletes existing `.slx` and `.asv` files of the same name to ensure a clean state.

### `connect(sourcePort, targetPort)`
Wires two blocks together using the intuitive `Block.Port` notation.
- **Parameters**:
    - `sourcePort` (string): e.g., `"Sine.1"`
    - `targetPort` (string): e.g., `"Mux.2"`
- **Technical Note**: Under the hood, this resolves the relative paths to absolute Simulink paths (e.g., `model/Sine/1`).

### `setparam(blockName, parameter, value)`
A simplified wrapper for `set_param`.
- **Parameters**:
    - `blockName` (string): Name of the block.
    - `parameter` (string): Property name (e.g., `"Gain"`, `"Frequency"`).
    - `value` (string): The value to set.

### `run()`
Finalizes the model, saves it to disk, and triggers the simulation.
- **Effects**: Reveals the model in the Simulink Editor and saves the output as `{modelName}.slx`.

---

## 3. High-Standard Block API
All blocks are available via the `from ses import` syntax. 

### Sourcing & Math
| Function | Simulink Source | Description |
| :--- | :--- | :--- |
| `sine(name)` | `simulink/Sources/Sine Wave` | Continuous sine generator. |
| `step(name)` | `simulink/Sources/Step` | Ideal step input. |
| `integrator(name)`| `simulink/Continuous/Integrator` | Time-integral operator. |
| `gain(name)` | `simulink/Math/Gain` | Scalar multiplication. |

### Logic & Control
| Function | Simulink Source | Description |
| :--- | :--- | :--- |
| `logical(name)`| `simulink/Logic/Logical Operator` | AND, OR, XOR, etc. (Default: AND). |
| `pid(name)` | `simulink/Continuous/PID` | Standard PID controller. |
| `filter(name)` | `simulink/Discrete/Filter` | Discrete-time digital filter. |

---

## 4. The `from.m` Import Engine
The `from` helper is the heart of SES's local scoping logic. It performs **Dynamic Handle Assignment**.

**Usage**:
```matlab
from ses import sine gain mux
```
**Mechanism**:
1. Scans the hierarchical `+block` directory.
2. Finds the function handle (e.g., `@ses.block.common.sine`).
3. Uses `assignin('caller', ...)` to inject the handle into your script's workspace.
4. **Aliasing**: Automatically creates `addsine` and `sine` handles simultaneously for maximum flexibility.

---

## 5. Performance Benchmarks
| Operation | Traditional Speed | SES Turbo Speed |
| :--- | :--- | :--- |
| 10 Block Build | ~8.0s | **0.4s** |
| 150 Block Build | ~185.0s | **8.7s** |

---

## 6. Development & Contributing
To add a new block to the library:
1. Create a new `.m` file in the relevant category (e.g., `+ses/+block/+math/pow.m`).
2. Implement the one-liner: `function h = pow(name); h = ses.start_block(name, 'simulink/Math Operations/Pow'); end`.
3. The `from.m` engine will automatically find it on the next run.
