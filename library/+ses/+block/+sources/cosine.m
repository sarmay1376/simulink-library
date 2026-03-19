function h = cosine(name)
    % COSINE Add a Cosine Wave source block.
    % This is implemented using a Sine Wave block with Phase = pi/2.
    h = ses.start_block(name, 'simulink/Sources/Sine Wave');
    set_param(h, 'Phase', 'pi/2');
end