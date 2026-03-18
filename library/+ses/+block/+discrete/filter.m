function h = filter(name)
    % FILTER Add a Discrete Filter block.
    h = ses.start_block(name, 'simulink/Discrete/Discrete Filter');
end
