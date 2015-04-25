function [ RMS tRMS ] = movingRMS(signal, timebasis, n)
%movingRMS: calculates the RMS of every n samples
%   usage:  [RMS tRMS] = movingRMS(signal, timebasis, n);
%   input:  the signal, 
%           its corresponding time basis, 
%           number of samples to average for each step
%   output: array the RMS values of every n samples,
%           array of the corresponding time for each RMS value

lenRMS = floor(length(signal) / n) - 1; % how many RMSs will be calculated
starts = 1:n:(n * lenRMS - 1);
stops = n:n:length(signal);

for i=1:lenRMS,
    RMS(i) = rms(excerpt(signal, starts, stops, i));
    tRMS(i) = timebasis(n * (i - 1) + 1);
    % ^ bojankety because MATLAB DOESN'T INDEX FROM ZERO >:|
end % for

end
