function from(pkgName, ~, varargin)
    % FROM  Python-style import helper for MATLAB.
    % Usage: from ses import setup sine gain mux
    
    % Ensure path is correct
    libRoot = fileparts(mfilename('fullpath'));
    if isempty(strfind(path, libRoot))
        addpath(libRoot);
    end
    rehash path;

    if ~strcmpi(pkgName, 'ses')
        error('[SES] Only imports from "ses" package are supported.');
    end

    for i = 1:length(varargin)
        rawName = varargin{i};
        
        if strcmp(rawName, '*')
            from ses setup sine gain mux scope step;
            continue;
        end

        % Stripprefix 'add' if needed for search
        if startsWith(rawName, 'add') && isempty(which(['ses.' rawName]))
            name = rawName(4:end); 
        else
            name = rawName;
        end

        % 1. Search core +ses/ folder
        found = false;
        fullPath = ['ses.' name];
        if ~isempty(which(fullPath))
            assignin('caller', name, str2func(fullPath));
            found = true;
        elseif ~isempty(which(['ses.' rawName]))
            assignin('caller', rawName, str2func(['ses.' rawName]));
            found = true;
        end

        if found, continue; end

        % 2. Search hierarchical blocks (+ses/+block/+category/)
        subpkgs = {'common', 'sources', 'sinks', 'math', 'cont', 'discrete', 'logic'};
        for j = 1:length(subpkgs)
            term = ['ses.block.' subpkgs{j} '.' name];
            if ~isempty(which(term))
                % ALWAYS assign both styles: 'sine' and 'addsine'
                fHandle = str2func(term);
                assignin('caller', name, fHandle);
                assignin('caller', ['add' name], fHandle);
                found = true;
                break;
            end
        end

        if ~found
            if ~isempty(which(rawName)), continue; end
            warning('[SES] Could not find: %s', rawName);
        end
    end
end
