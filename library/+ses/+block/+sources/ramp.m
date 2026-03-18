function out = ramp(name); if nargin == 0, out = 'ramp'; return; end
name = char(name); global SES_MODEL; add_block('simulink/Sources/Ramp', [SES_MODEL '/' name]); end
