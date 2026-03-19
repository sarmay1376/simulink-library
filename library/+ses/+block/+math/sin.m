function h = sin(name)
    % SIN Add a Trigonometric Function block set to 'sin'.
    h = ses.start_block(name, 'simulink/Math Operations/Trigonometric Function');
    set_param(h, 'Function', 'sin');
end
