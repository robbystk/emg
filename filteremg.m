function [ filtered ] = filteremg( unfiltered, fs )
%filteremg: band-pass filters a signal with passband 20--400 Hz
%   input:  signal to be filtered, sampling frequency
%   output: filtered signal

% calculate FIR coefficients
[a,b] = butter(4,[20,400] * 2 / fs);

% filter signal
filtered = filter(b,a,unfiltered);

end
