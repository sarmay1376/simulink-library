function out = const(name); if nargin == 0, out = 'const'; return; end
name = char(name); global SES_MODEL; add_block('simulink/Sources/Constant', [SES_MODEL '/' name]); end
