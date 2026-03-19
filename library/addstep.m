function h = addstep(varargin)
% ADDSTEP  Ultra-Easy Proxy for ses.block.common.step
    if nargin > 0
        h = ses.block.common.step(varargin{:});
    else
        h = [];
    end
end
