function h = terminator(name)
    % TERMINATOR Add a Terminator block.
    h = ses.start_block(name, 'simulink/Sinks/Terminator');
end
