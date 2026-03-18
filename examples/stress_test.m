%% SES STRESS TEST - 150 BLOCKS
% This script benchmarks the library's performance under heavy load.

tic; % Start benchmark timer

% 1. Setup Path and Imports
addpath('../library'); % Adjust if running from root
from ses import setup
from ses import sine gain mux scope integrator 

setup()
start("SES_Stress_Test")

num_blocks = 150;
fprintf('[SES] Generating %d blocks and setting parameters...\n', num_blocks);

% 2. Dynamic Generation Loop
for i = 1:num_blocks
    % Create unique names
    s_name = sprintf('S%d', i);
    g_name = sprintf('G%d', i);
    
    % Add blocks
    sine(s_name);
    gain(g_name);
    
    % Set parameters (Stress the setparam function)
    % Assign random frequencies and gains
    setparam(s_name, 'Frequency', num2str(rand()*10));
    setparam(g_name, 'Gain', num2str(rand()*5));
    
    % 3. Incremental Connections
    % Connect S(i) -> G(i)
    connect([s_name '.1'], [g_name '.1']);
end

fprintf('[SES] Assembly complete. Performing auto-layout...\n');

% 4. Finalize
% Note: layout 150 blocks is the hardest part for Simulink's engine
arrange() 
run()

total_time = toc;
fprintf('\n========================================\n');
fprintf('  STRESS TEST COMPLETED (150 BLOCKS)\n');
fprintf('  Total Duration: %.2f seconds\n', total_time);
fprintf('  Time per Block Pair: %.4f seconds\n', total_time/num_blocks);
fprintf('========================================\n');
