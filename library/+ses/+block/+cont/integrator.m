function h = integrator(name)
    % INTEGRATOR Add a Continuous Integrator block.
    h = ses.start_block(name, 'simulink/Continuous/Integrator');
end
