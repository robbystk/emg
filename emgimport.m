function [ t delt tri starts stops ] = emgimport( filename )
%emgimport: imports emg data from a csv file
%   [ t delt tri starts stops ] = emgimport( filename )
%   input:  the filename of the csv you wish to import
%           columns: deltoid, tricep, start events, stop events
%   output: list of time values in ms
%           deltoid emg data (first column in csv)
%           tricep emg data (second column)
%           list of indexes of 'start' event markers (third column)
%           list of indexes of 'stop' markers (fourth)

fs = 960;   % sample frequency
ts = 1000/fs;  

M = csvread(filename,1,0); % import whole csv

% extract columns
delt  = M(:,1); % deltoid data (first column)
tri   = M(:,2); % tricep data (second column)
start = M(:,3); % start data (third column)
stop  = M(:,4); % stop data (fourth column)

% create time basis
t = [0:ts:ts * (length(delt) - 1)]; % fucking off-by-one errors

% extract start and stop breakpoints
starts = find(start);
stops  = find(stop);

end

