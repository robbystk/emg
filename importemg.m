function [ delt tri starts stops ] = importemg( filename )
%importemg: imports emg data from a csv file
%   usage:  [delt tri starts stops] = importemg(filename);
%   input:  the filename of the csv you wish to import
%           columns: deltoid, tricep, start events, stop events
%   output: deltoid emg data (first column in csv)
%           tricep emg data (second column)
%           list of indexes of 'start' event markers (third column)
%           list of indexes of 'stop' markers (fourth)

M = csvread(filename,1,0); % import whole csv

% extract columns
delt  = M(:,1); % deltoid data (first column)
tri   = M(:,2); % tricep data (second column)
start = M(:,3); % start data (third column)
stop  = M(:,4); % stop data (fourth column)

% extract start and stop breakpoints
starts = find(start);
stops  = find(stop);

end
