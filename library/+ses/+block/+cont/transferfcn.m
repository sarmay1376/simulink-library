function h = transferfcn(name)
    % TRANSFERFCN Add a Continuous Transfer Fcn block.
    h = ses.start_block(name, 'simulink/Continuous/Transfer Fcn');
end
