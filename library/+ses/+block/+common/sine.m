function out = sine(name)
    if nargin == 0, out = 'sine'; return; end
    name = char(name); global SES_MODEL; add_block('simulink/Sources/Sine Wave', [SES_MODEL '/' name]); 
end
