function h = addgain(varargin)
% ADDGAIN  Ultra-Easy Proxy for ses.block.common.gain
    if nargin > 0
        h = ses.block.common.gain(varargin{:});
    else
        h = [];
    end
end
