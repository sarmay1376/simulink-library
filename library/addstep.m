function h = addstep(varargin)
% ADDSTEP  Ultra-Easy Proxy for ses.block.common.step
    if nargout > 0
        h = ses.block.common.step(varargin{:});
    else
        ses.block.common.step(varargin{:});
    end
end
