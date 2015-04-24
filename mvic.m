function mvic = mvic(trial, fs)
%mvic:  computes the maximal voluntary isometric contraction (MVIC) of a 
%       single trialsworth of EMG data with sampling frequency fs
%   input:  one five-second trial worth of EMG data
%           its sampling frequency
%   output: the MVIC of that trial

% extract middle three seconds
span = fs * 3;  % number of samples in three seconds
% the beginning and end of the three-second interval
start = floor((length(trial) - span) / 2);
stop = length(trial) - start;
excerpt = excerpt(trial, start, stop, 1);


% filter
filtered = filteremg(excerpt, fs);

% detrend
detrended = detrend(filtered);

% RMS
mvic = rms(detrended);
