function setparam(blockIdent, varargin)
% SES.SETPARAM  Set block parameters using short aliases.
% Usage: 
%   setparam("S1", "amp", 10) 
%   setparam(h, "num", [1], "den", [1 10])
    
    global SES_MODEL;
    if isempty(SES_MODEL); error('[SES] No active model. Call start() first.'); end

    % 1. Resolve full path from name or handle
    if isnumeric(blockIdent)
        fullPath = blockIdent;
    else
        blockIdent = char(blockIdent);
        if contains(blockIdent, '/')
            fullPath = blockIdent;
        else
            fullPath = [SES_MODEL '/' blockIdent];
        end
    end

    % 2. Alias map
    aliases = containers.Map( ...
        {'amp','fre','pha','val','sam','num','den','pos', ...
         'inp','out','ini','sta','sto','gai','tim','ste', ...
         'fin','con','bas','sat','upl','lol','del','wid'}, ...
        {'Amplitude','Frequency','Phase','Value','SampleTime','Numerator','Denominator','Position', ...
         'Inputs','Outputs','InitialCondition','StartTime','StopTime','Gain','Time','StepTime', ...
         'FinalValue','Constant','Bias','UpperLimit','UpperLimit','LowerLimit','Delay','Width'} ...
    );

    % 3. Process pairs
    for i = 1:2:length(varargin)
        paramAlias = char(varargin{i});
        paramValue = varargin{i+1};
        if isstring(paramValue) || ischar(paramValue)
            paramValue = char(paramValue);
        end

        % Resolve alias
        if aliases.isKey(lower(paramAlias))
            realParam = aliases(lower(paramAlias));
        else
            realParam = paramAlias;
        end

        % Handle 'cod' special case
        if strcmpi(paramAlias, 'cod') || strcmpi(paramAlias, 'code')
            if isfile(paramValue)
                code = fileread(paramValue);
                set_param(fullPath, 'MATLABFunctionCode', code);
            else
                error('[SES] File not found: %s', paramValue);
            end
            continue;
        end

        % Convert numeric to string
        if isnumeric(paramValue)
            paramValue = mat2str(paramValue);
        end

        set_param(fullPath, realParam, paramValue);
    end
end
