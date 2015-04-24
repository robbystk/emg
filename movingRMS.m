function [ RMS tRMS ] = movingRMS(signal, timebasis, n)
%movingRMS: calculates the RMS of every n samples
%   input:  the signal, 
%           its corresponding time basis, 
%           number of samples to average for each step
%   output: array the RMS values of every n samples,
%           array of the corresponding time for each RMS value

lenRMS = floor(length(signal) / n);    % how many RMSs will be calculated
starts = [0:n:n * lenRMS];      
stops = [n:n:length(signal);

for i=1:lenRMS,
    RMS(i) = rms(excerpt(signal, starts, stops, i);
    tRMS(i) = timebasis(n * (i - 1) + 1);
    % ^ bojankety because MATLAB DOESN'T INDEX FROM ZERO >:|
end
