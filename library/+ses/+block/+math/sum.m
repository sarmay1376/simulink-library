function out = sum(name); if nargin == 0, out = 'sum'; return; end
name = char(name); global SES_MODEL; out = add_block('simulink/Math Operations/Sum', [SES_MODEL '/' name]); end
