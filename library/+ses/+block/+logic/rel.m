function out = rel(name); if nargin == 0, out = 'rel'; return; end
name = char(name); global SES_MODEL; add_block('simulink/Logic and Bit Operations/Relational Operator', [SES_MODEL '/' name]); end
