function out = display(name); if nargin == 0, out = 'display'; return; end
name = char(name); global SES_MODEL; out = add_block('simulink/Sinks/Display', [SES_MODEL '/' name]); end
