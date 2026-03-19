function out = prod(name); if nargin == 0, out = 'prod'; return; end
name = char(name); global SES_MODEL; out = add_block('simulink/Math Operations/Product', [SES_MODEL '/' name]); end
