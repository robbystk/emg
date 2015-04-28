function [ mrms ] = movingRMS(emg, n);
%movingRMS: calculates the RMS of every n samples
%   usage:  [RMS] = movingRMS(emg, n);
%   input:  the emg struct, 
%           number of samples to average for each step
%   output: an emgstruct with RMS values for the signal

lenRMS = floor(emg.l) - 1 % how many RMSs will be calculated
emg.starts = 1:n:(n * lenRMS - 1);
emg.stops = n:n:emg.l;

for i=1:lenRMS,
    part = crop(emg, i);
    sRMS(i) = rms(part.signal);
    tRMS(i) = part.time(1);
    % ^ bojankety because MATLAB DOESN'T INDEX FROM ZERO >:|
end % for

mrms.signal = sRMS;
mrms.time   = tRMS;
mrms.l      = lenRMS;
mrms.starts = [];
mrms.stops  = [];
mrms.n      = 0;
mrms.fs     = emg.fs / n;

end
