function setparam(blockName, paramAlias, paramValue)
% SES.SETPARAM  Set a block parameter using short aliases.
% Usage: setparam("S1", "amp", 10)
    
    blockName = char(blockName); % Support "" strings
    paramAlias = char(paramAlias);
    if isstring(paramValue) || ischar(paramValue)
        paramValue = char(paramValue);
    end

    global SES_MODEL;
    if isempty(SES_MODEL); error('[SES] No active model. Call start() first.'); end

    fullPath = [SES_MODEL '/' blockName];

    % Alias map
    aliases = containers.Map( ...
        {'amp','fre','pha','val','sam','num','den','pos', ...
         'inp','out','ini','sta','sto','gai','tim','ste', ...
         'fin','con','bas','sat','upl','lol','del','wid'}, ...
        {'Amplitude','Frequency','Phase','Value','SampleTime','Numerator','Denominator','Position', ...
         'Inputs','Outputs','InitialCondition','StartTime','StopTime','Gain','Time','StepTime', ...
         'FinalValue','Constant','Bias','UpperLimit','UpperLimit','LowerLimit','Delay','Width'} ...
    );

    % Resolve alias
    if aliases.isKey(lower(paramAlias))
        realParam = aliases(lower(paramAlias));
    else
        realParam = paramAlias;
    end

    % Handle 'cod' special case: load MATLAB code from file
    if strcmpi(paramAlias, 'cod') || strcmpi(paramAlias, 'code')
        if isfile(paramValue)
            code = fileread(paramValue);
            set_param(fullPath, 'MATLABFunctionCode', code);
        else
            error('[SES] File not found: %s', paramValue);
        end
        return;
    end

    % Convert numeric to string
    if isnumeric(paramValue)
        paramValue = mat2str(paramValue);
    end

    set_param(fullPath, realParam, paramValue);
end
