function out = mux(name)
    if nargin == 0, out = 'mux'; return; end
    name = char(name); global SES_MODEL; 
    add_block('simulink/Signal Routing/Mux', [SES_MODEL '/' name]); 
end
