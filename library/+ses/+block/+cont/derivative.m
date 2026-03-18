function h = derivative(name)
    % DERIVATIVE Add a Continuous Derivative block.
    h = ses.start_block(name, 'simulink/Continuous/Derivative');
end
