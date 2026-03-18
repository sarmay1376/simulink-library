function h = pid(name)
    % PID Add a Continuous PID Controller block.
    h = ses.start_block(name, 'simulink/Continuous/PID Controller');
end
