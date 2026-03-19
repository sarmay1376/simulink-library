function out = delay(name); if nargin == 0, out = 'delay'; return; end
name = char(name); global SES_MODEL; out = add_block('simulink/Discrete/Delay', [SES_MODEL '/' name]); end
