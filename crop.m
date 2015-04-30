function excerpt = crop(emg, n)
%exerpt:    extracts a portion of a signal based on the nth pair of limits
%           in starts and stops
%   usage:  exerpt = exerpt(emg, n);
%   input:  the EMG struct to be cropped
%           the number of the event to be extracted (n)
%   output: an EMG struct with the extracted data

if n > emg.n
    disp('n is too big');
    return
end

if emg.starts(n) >= emg.stops(n)
    disp('start/stop mismatch');
    return
end

excerpt = emg;
excerpt.signal  = emg.signal(emg.starts(n):emg.stops(n));
excerpt.time    = emg.time(emg.starts(n):emg.stops(n));
excerpt.l       = emg.stops(n) - emg.starts(n) + 1;
excerpt.starts  = [];
excerpt.stops   = [];
excerpt.n       = 0;

end
