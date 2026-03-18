function connect(src, dst)
    % CONNECT  Connect two Simulink blocks.
    % Usage:
    %   connect("Sine", "Scope")
    %   connect("Sine/1", "Mux/2")
    %   connect("Sine.1", "Mux.1")
    
    src = char(src); dst = char(dst);
    global SES_MODEL;
    
    % Handle dot notation
    src = strrep(src, '.', '/');
    dst = strrep(dst, '.', '/');
    
    % Auto-append port 1 if missing
    if ~contains(src, '/')
        srcPath = [src '/1'];
    else
        srcPath = src;
    end
    
    if ~contains(dst, '/')
        dstPath = [dst '/1'];
    else
        dstPath = dst;
    end

    % Verify blocks exist before connecting
    srcBlock = strtok(srcPath, '/');
    dstBlock = strtok(dstPath, '/');
    
    if ~getSimulinkBlockExist([SES_MODEL '/' srcBlock])
        error('[SES] Source block "%s" does not exist in model "%s".', srcBlock, SES_MODEL);
    end
    if ~getSimulinkBlockExist([SES_MODEL '/' dstBlock])
        error('[SES] Destination block "%s" does not exist in model "%s".', dstBlock, SES_MODEL);
    end
    
    try
        add_line(SES_MODEL, srcPath, dstPath, 'autorouting', 'on');
    catch ME
        error('[SES] Failed to connect %s to %s: %s', srcPath, dstPath, ME.message);
    end
end

function exists = getSimulinkBlockExist(path)
    try
        exists = ~isempty(get_param(path, 'Handle'));
    catch
        exists = false;
    end
end
