function setparam(varargin)
% SETPARAM  Ultra-Easy Proxy for ses.setparam
    if nargin > 0
        ses.setparam(varargin{:});
    end
end
