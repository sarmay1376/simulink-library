function h = compare(name)
    % COMPARE Add a Relational Operator block (==, ~=, <, >, etc.).
    % Use setparam(h, 'Operator', '<=') to change.
    h = ses.start_block(name, 'simulink/Logic and Bit Operations/Relational Operator');
end
