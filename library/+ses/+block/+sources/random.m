function h = random(name)
    % RANDOM Add a Random Number block.
    h = ses.start_block(name, 'simulink/Sources/Random Number');
end
