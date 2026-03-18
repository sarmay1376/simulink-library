function start(modelName)
    % START  Initialize a new Simulink model in TURBO mode.
    % Uses load_system() for background building (no UI overhead).
    
    modelName = char(modelName); 
    global SES_MODEL; 
    SES_MODEL = modelName;
    
    % 1. Close if already open in memory
    if bdIsLoaded(modelName)
        close_system(modelName, 0); 
    end
    
    % 2. Avoid Shadowing: Clear from workspace
    evalin('base', ['clear ' modelName]);
    if exist([modelName '.slx'], 'file')
        delete([modelName '.slx']);
    end
    
    % 3. Create fresh system 
    new_system(modelName); 
    
    % --- TURBO OPTIMIZATION ---
    % Load without opening GUI (extremely fast building)
    load_system(modelName);
    
    fprintf('[SES] Turbo build started: %s (Background mode)\n', modelName);
end
