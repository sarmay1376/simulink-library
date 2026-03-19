function h = addmux(varargin)
% ADDMUX  Ultra-Easy Proxy for ses.block.common.mux
    if nargout > 0
        h = ses.block.common.mux(varargin{:});
    else
        ses.block.common.mux(varargin{:});
    end
end
