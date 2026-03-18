%% SES TURBO DEMO
% Targets 5-10 second generation time.

tic; % Start timer

addpath('../library');
from ses import setup
from ses import sine gain mux step scope 

setup()
start("SES_Turbo_Demo")

% 1. Add blocks FIRST
addsine("S1")
addsine("S2") 
mux("M1")     
gain("G1")
step("ST1")
scope("SC1")

% 2. Configure blocks (parameters)
setparam("M1", "inp", 3)

% 3. Connect blocks
connect("S1.1", "M1.1")
connect("S2.1", "M1.2")
connect("ST1.1", "M1.3")
connect("M1.1", "G1.1")
connect("G1.1", "SC1.1")

% 4. Finalize
arrange() % Layout
run()     % Reveal and Simulate

elapsed = toc;
fprintf('[SES] Total Build Time: %.2f seconds\n', elapsed);
