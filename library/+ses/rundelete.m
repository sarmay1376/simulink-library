function rundelete()
% SES.RUNDELETE  Simulate the model, then close and delete it. Clean workspace.

    global SES_MODEL;
    if isempty(SES_MODEL); error('[SES] No active model. Call start() first.'); end

    open_system(SES_MODEL);
    sim(SES_MODEL);
    pause(1);

    close_system(SES_MODEL, 0);

    slxFile = [SES_MODEL '.slx'];
    if isfile(slxFile), delete(slxFile); end

    fprintf('[SES] Model "%s" simulated and deleted.\n', SES_MODEL);
    SES_MODEL = '';
end
