# SES: Simulink Easy Script 🚀

> **The Python-style DSL for high-speed Simulink generation. Build complex models in seconds, not minutes.**

**SES** is a high-performance, developer-friendly interface for building and simulating Simulink models programmatically in MATLAB. It brings the elegance of Python to the power of Simulink, significantly reducing the overhead of manual block creation and manual wiring.

## 🌟 Why SES?
- **Pythonic Imports**: `from ses import setup sine gain mux scope` — intuitive, quote-free imports.
- **Turbo Speed (8.75s Build)**: Built-in "Silent Build" technology achieves **10x-50x speedups** compared to standard scripting.
- **Hierarchical Library**: A professional, categorized library of 75+ blocks for organized development.
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
from ses import sine gain mux scope 

% 2. Setup the engine
setup()
start("Turbo_SES_Demo")

% 3. Assemble and Configure (supports addsine or sine handles)
addsine("S1")
addgain("G1")
mux("M1")
setparam("M1", "inp", 3) % Professional short-alias parameters

% 4. Logic-First Wiring
connect("S1.1", "M1.1")
connect("M1.1", "G1.1")

% 5. Auto-Layout and Launch
arrange() 
run() % Turbo-builds, simulates, and reveals the GUI
```

---

## 📂 Project Structure
- **/library**: The core engine and the `from.m` import magic.
- **/examples**: Ready-to-run samples including the `main_turbo.m` benchmark.

---

## 💡 About the Project
SES was designed to solve the slowness of traditional Matlab/Simulink scripting. By isolating block creation from GUI refreshes and providing a high-level Pythonic abstraction, SES allows engineers to focus on the **logic** of their models, not the mechanics of the API.

---

## 📜 License
MIT License. High-Standard Engineering by [USER].
