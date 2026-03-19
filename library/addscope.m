function h = addscope(varargin)
% ADDSCOPE  Ultra-Easy Proxy for ses.block.common.scope
    if nargout > 0
        h = ses.block.common.scope(varargin{:});
    else
        ses.block.common.scope(varargin{:});
    end
end
