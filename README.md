# SES: Simulink Easy Script 🚀

> **The Python-style DSL for high-speed Simulink generation. Build complex models in seconds, not minutes.**

**SES** is a high-performance, developer-friendly interface for building and simulating Simulink models programmatically in MATLAB. It brings the elegance of Python to the power of Simulink, significantly reducing the overhead of manual block creation and manual wiring.

## 🌟 Why SES?
- **Pythonic Imports**: `from ses import setup sine gain mux scope` — intuitive, quote-free imports.
- **Turbo Speed (8.75s Build)**: Built-in "Silent Build" technology achieves **10x-50x speedups**.
- **Comprehensive Library**: Standard blocks across Continuous, Discrete, Logic, Math, and more.
- **Modern Syntax**: Full support for `""` strings, `Port.Number` notation, and automatic block aliasing.
- **Auto-Persistence**: One-command simulation and permanent `.slx` saving.

---

## 🛠️ Quick Start

### 1. Installation
Clone the repository and add the `library` folder to your MATLAB path:

```matlab
% Add the core library to your path
addpath('/path/to/SES-Simulink-Library/library');
savepath; % Optional: keeps it on your path permanently
```

### 2. Basic Example (`examples/main.m`)
Enable the engine and build your model in clean, Python-style code:

```matlab
% 1. Import core utilities and your favorite blocks
from ses import setup
from ses import sine gain mux scope integrator pid logical 

% 2. Setup the engine
setup()
start("Turbo_SES_Demo")

% 3. Assemble and Configure (supports addsine or sine handles)
addsine("S1")
integrator("I1")
pid("C1")
scope("SC1")

% 4. Logic-First Wiring
connect("S1.1", "I1.1")
connect("I1.1", "C1.1")
connect("C1.1", "SC1.1")

% 5. Auto-Layout and Launch
arrange() 
run() % Turbo-builds, simulates, and reveals the GUI
```

---

## 📂 Project Structure
- **/library**: The core engine and the `from.m` import magic.
- **/examples**: Ready-to-run samples including the `main_turbo.m` benchmark.

---

## 🏗️ Block Categories
- **Continuous**: `integrator`, `derivative`, `transferfcn`, `pid`, `statespace`
- **Discrete**: `delay`, `filter`
- **Logic**: `logical` (AND/OR/XOR), `compare` (==, ~=, <, >)
- **Math**: `abs`, `prod`, `sum`, `minmax`, `trig`, `sqrt`
- **Sources**: `sine`, `step`, `pulse`, `ramp`, `const`, `random`, `clock`, `ground`
- **Sinks**: `scope`, `display`, `terminator`, `toworkspace`

---

## 💡 About the Project
SES was designed to solve the slowness of traditional Matlab/Simulink scripting. By isolating block creation from GUI refreshes and providing a high-level Pythonic abstraction, SES allows engineers to focus on the **logic** of their models, not the mechanics of the API.

---

## 📜 License
MIT License. High-Standard Engineering by [USER].
