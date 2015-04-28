function mvic = mvic(emg)
%mvic:  computes the maximal voluntary isometric contraction (MVIC) of a 
%       single trialsworth of EMG data with sampling frequency fs
%   usage:  mvic = mvic(emg);
%   input:  one five-second EMG struct
%   output: the MVIC of that trial

% extract middle three seconds
span = emg.fs * 3;  % number of samples in three seconds
% the beginning and end of the three-second interval
emg.start = floor((emg.l - span) / 2);
emg.stop = emg.l - emg.start;

middle3 = crop(emg, 1);

% filter
filtered = filteremg(middle3);

% detrend
emg.signal = detrend(emg.signal);

% RMS
mvic = rms(emg.signal);
