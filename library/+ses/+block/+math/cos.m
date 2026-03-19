function h = cos(name)
    % COS Add a Trigonometric Function block set to 'cos'.
    h = ses.start_block(name, 'simulink/Math Operations/Trigonometric Function');
    set_param(h, 'Function', 'cos');
end
