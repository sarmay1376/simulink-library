function h = toworkspace(name)
    % TOWORKSPACE Add a To Workspace block.
    h = ses.start_block(name, 'simulink/Sinks/To Workspace');
end
