function run()
    % RUN  Simulate the active model, save it, and reveal the GUI.
    global SES_MODEL;
    if isempty(SES_MODEL); error('[SES] No active model. Call start() first.'); end
    
    % --- REVEAL FOR VIEWING ---
    % Reveal only at the end
    open_system(SES_MODEL);
    
    % Save simulation results and state
    save_system(SES_MODEL);
    
    % Run simulation
    sim(SES_MODEL);
    
    fprintf('[SES] Turbo build finished. Model saved: %s.slx\n', SES_MODEL);
end
