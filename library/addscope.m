function h = addscope(varargin)
% ADDSCOPE  Ultra-Easy Proxy for ses.block.common.scope
    if nargin > 0
        h = ses.block.common.scope(varargin{:});
    else
        h = [];
    end
end
