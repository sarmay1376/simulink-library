function h = ground(name)
    % GROUND Add a Ground block.
    h = ses.start_block(name, 'simulink/Sources/Ground');
end
