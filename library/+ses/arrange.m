function arrange()
% SES.ARRANGE  Auto-layout all blocks in the active model.

    global SES_MODEL;
    if isempty(SES_MODEL); error('[SES] No active model. Call start() first.'); end
    Simulink.BlockDiagram.arrangeSystem(SES_MODEL);
    fprintf('[SES] Model arranged.\n');
end
