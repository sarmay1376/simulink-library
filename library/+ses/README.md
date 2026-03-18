# SES — Pythonic Simulink Easy Script

A professional MATLAB package for building Simulink models with a clean, Python-like syntax. No folder clutter. No memorizing paths.

## 1. Clean Folder Structure
The entire library lives in the `+ses/` folder and has only **8 files**. No "trash" files.

## 2. Python-Style Imports
You can import exactly what you need at the top of your script:
```matlab
import ses.add.sine ses.add.gain ses.add.mux    % Like "from ses import sine, gain..."
import ses.start ses.connect ses.rundelete      % Import engine
```
Or import everything:
```matlab
import ses.add.*
import ses.*
```

## 3. Double Quote Support (`""`)
Everything supports double quotes and standard brackets:
```matlab
start("MyModel")
sine("S1")
addgain("G1")
setparam("S1", "amp", 10)
connect("S1.1", "G1.1")
rundelete()
```

## 4. Key Commands

| Command | Description |
|:---|:---|
| `start(name)` | Initialize/Reset model (handles stuck models) |
| `arrange()` | Auto-layout all blocks |
| `run()` | Simulate (keep open) |
| `rundelete()` | Simulate then purge model file (keeps folder clean) |

## 5. Parameter Aliases
Use short names like `amp`, `fre`, `gai`, `num`, `den`, `inp`, `val`.

## 6. Smart `connect`
- **Dot Notation**: `connect("S1.1", "Mux.1")`
- **Signal Reuse**: Connect one source to multiple destinations.
- **1-to-1 Shorthand**: `connect("Mux", "Scope")`
