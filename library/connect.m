function h = connect(varargin)
% CONNECT  Ultra-Easy Proxy for ses.connect
% Supports command syntax: connect sine.1 mux.1
    if nargin > 0
        h = ses.connect(varargin{:});
    else
        h = [];
    end
end
