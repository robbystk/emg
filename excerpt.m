function excerpt = excerpt(signal, starts, stops, n)
%exerpt:    extracts a portion of a signal based on the nth pair of limits
%           in starts and stops
%   usage:  exerpt = exerpt(signal, starts, stops, n);
%   input:  the signal from which the excerp will be taken (signal)
%           an array of start markers (starts)
%           an array of stop markers (stops)
%           the number of the event to be extracted (n)
%   output: excerpt of the signal between the two markers

if n > min(length(starts),length(stops))
    disp('n is too big');
    return
end

if starts(n) >= stops(n)
    disp('start/stop mismatch');
    return
end

excerpt = signal(starts(n):stops(n));

end
