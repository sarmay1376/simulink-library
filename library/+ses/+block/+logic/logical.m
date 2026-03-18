function h = logical(name)
    % LOGICAL Add a Logical Operator block (AND, OR, NOT, etc.).
    % Use setparam(h, 'Operator', 'OR') to change from default AND.
    h = ses.start_block(name, 'simulink/Logic and Bit Operations/Logical Operator');
end
