function out = clock(name); if nargin == 0, out = 'clock'; return; end
name = char(name); global SES_MODEL; add_block('simulink/Sources/Clock', [SES_MODEL '/' name]); end
