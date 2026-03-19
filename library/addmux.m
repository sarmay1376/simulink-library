function h = addmux(varargin)
% ADDMUX  Ultra-Easy Proxy for ses.block.common.mux
    if nargin > 0
        h = ses.block.common.mux(varargin{:});
    else
        h = [];
    end
end
