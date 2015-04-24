function t = timebasis(signal, fs)
%timebasis: creates time basis in ms for a signal with sample rate fs
%   input:  the signal, its sample frequency fs
%   output: array of t-values the same length as the sample

ts = 1000/fs;   % sampling interval in ms
tl = ts * (length(signal) - 1); % time of the last sample
t = [0:ts:ti];  % time basis

end
