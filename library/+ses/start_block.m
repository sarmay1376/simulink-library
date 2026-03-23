function h = start_block(name, blockPath)
    % START_BLOCK  Helper for block addition logic.
    name = char(name); 
    global SES_MODEL; 
    if isempty(SES_MODEL)
        error('[SES] No active SES model. Call start("ModelName") first.');
    end
    h = add_block(blockPath, [SES_MODEL '/' name]); 
end
