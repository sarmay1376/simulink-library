function h = minmax(name)
    % MINMAX Add a MinMax block.
    h = ses.start_block(name, 'simulink/Math Operations/MinMax');
end
