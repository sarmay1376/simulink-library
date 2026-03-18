function show()
% SHOW  Reveal the model in the Simulink Editor.
    global SES_MODEL;
    if isempty(SES_MODEL); error('[SES] No active model. Call start() first.'); end
    
    % Bring to front
    open_system(SES_MODEL);
    
    fprintf('[SES] Model "%s" revealed in Simulink Editor.\n', SES_MODEL);
end
