function out = step(name)
    if nargin == 0, out = 'step'; return; end
    name = char(name); global SES_MODEL; add_block('simulink/Sources/Step', [SES_MODEL '/' name]); 
end
