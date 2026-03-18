%% SES MAIN SCRIPT - Python Style!
% This script uses your new SES library to build and VIEW the model.

% 1. Add the simulink folder to path and import
addpath('../library'); 
from ses import setup
from ses import sine gain mux step scope 

% 2. Setup engine (start, connect, etc.)
setup()

% 3. Start a visual model
start("SES_Visual_Demo")

% 4. Add blocks 
addsine("S1")
addstep("ST1")
addmux("M1")
addgain("G1")
addscope("SC1")

% 5. Connect 
connect("S1.1", "M1.1")
connect("ST1.1", "M1.2")
connect("M1.1", "G1.1")
connect("G1.1", "SC1.1")

% 6. Auto-layout and Show
arrange()
show()

% 7. RUN AND KEEP OPEN!
% 'run()' keeps the window open so you can see your blocks.
% 'rundelete()' would close and delete everything.
run()

fprintf('\n[SES] Model is open in Simulink! You can see it now.\n');