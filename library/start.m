function start(varargin)
% START  Ultra-Easy Proxy for ses.start
    if nargin > 0
        ses.start(varargin{:});
    else
        ses.start();
    end
end
