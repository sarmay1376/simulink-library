function out = pulse(name); if nargin == 0, out = 'pulse'; return; end
name = char(name); global SES_MODEL; out = add_block('simulink/Sources/Pulse Generator', [SES_MODEL '/' name]); end
