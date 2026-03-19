function h = addsine(varargin)
% ADDSINE  Ultra-Easy Proxy for ses.block.common.sine
% Supports command syntax: addsine my_sine
    if nargin > 0
        h = ses.block.common.sine(varargin{:});
    else
        h = [];
    end
end
