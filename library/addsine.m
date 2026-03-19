function h = addsine(varargin)
% ADDSINE  Ultra-Easy Proxy for ses.block.common.sine
    if nargout > 0
        h = ses.block.common.sine(varargin{:});
    else
        ses.block.common.sine(varargin{:});
    end
end
