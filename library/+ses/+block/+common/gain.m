function out = gain(name)
    if nargin == 0, out = 'gain'; return; end
    name = char(name); global SES_MODEL; add_block('simulink/Math Operations/Gain', [SES_MODEL '/' name]); 
end
