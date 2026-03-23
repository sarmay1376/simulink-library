# SES: Simulink Easy Script 🚀

> **The Python-style DSL for high-speed Simulink generation. Build complex models in seconds, not minutes.**

**SES** is a high-performance, developer-friendly interface for building and simulating Simulink models programmatically in MATLAB. It brings the elegance of Python to the power of Simulink, significantly reducing the overhead of manual block creation and manual wiring.

## 🌟 Why SES?
- **Pythonic Imports**: `from ses import setup sine gain mux scope` — intuitive, quote-free imports.
- **Ultra-Easy Mode**: Support for **Command-Style syntax** (`connect sine.1 mux.1`)—no parentheses or quotes required for common blocks!
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
% Use 'add*' prefix to avoid conflicts with MATLAB's analytical functions
from ses import setup addpulse addgain feedback addscope transferfcn addpid

% 2. Setup the engine
setup()
start("Turbo_SES_Demo")

% 3. Assemble and Configure
addpulse("S1")
addpid("C1")
transferfcn("P1")
addscope("SC1")

% 4. Modern setparam (supports handles and multiple pairs)
setparam("C1", 'P', 20, 'I', 10, 'D', 2)
setparam("P1", 'num', [1], 'den', [1 5])
```
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
- **DOCS.md**: [Full API Reference & Technical Documentation](./DOCS.md).

---

## 🏗️ Block Categories & Naming Convention
To prevent conflicts with MATLAB's control system toolbox (like `step()`, `pid()`, or `sum()`), SES blocks can be imported and called with an optional `add` prefix.

- **Continuous**: `transferfcn`, `addpid`, `addintegrator`, `addderivative`
- **Math**: `addsum`, `addgain`, `addprod`, `addabs`
- **Sources**: `addstep`, `addsine`, `addpulse`, `addramp`, `addconst`
- **Sinks**: `addscope`, `adddisplay`, `addtoworkspace`
- **Others**: `addmux`, `adddemux`, `addlogical`, `addcompare`

---

## 💡 About the Project
SES was designed to solve the slowness of traditional Matlab/Simulink scripting. By isolating block creation from GUI refreshes and providing a high-level Pythonic abstraction, SES allows engineers to focus on the **logic** of their models, not the mechanics of the API.

---

## 📜 License
MIT License. High-Standard Engineering by [USER].
