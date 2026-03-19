function connect(varargin)
% CONNECT  Ultra-Easy Proxy for ses.connect
    if nargin > 0
        ses.connect(varargin{:});
    end
end
