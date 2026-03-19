function h = sig_gen(name)
    % SIG_GEN Add a Signal Generator source block.
    % Can generate sine, square, sawtooth, and random signals.
    h = ses.start_block(name, 'simulink/Sources/Signal Generator');
end
