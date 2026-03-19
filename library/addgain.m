function h = addgain(varargin)
% ADDGAIN  Ultra-Easy Proxy for ses.block.common.gain
    if nargout > 0
        h = ses.block.common.gain(varargin{:});
    else
        ses.block.common.gain(varargin{:});
    end
end
