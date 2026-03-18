function out = abs(name); if nargin == 0, out = 'abs'; return; end
name = char(name); global SES_MODEL; add_block('simulink/Math Operations/Abs', [SES_MODEL '/' name]); end
