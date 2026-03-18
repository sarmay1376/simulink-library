function out = scope(name)
    if nargin == 0, out = 'scope'; return; end
    name = char(name); global SES_MODEL; add_block('simulink/Sinks/Scope', [SES_MODEL '/' name]); 
end
