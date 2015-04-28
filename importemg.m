function [delt,tri] = importemg(filename, fs)
%importemg: imports emg data from a csv file
%   usage:  [delt, tri] = importemg(filename);
%   input:  the filename of the csv you wish to import
%           columns: deltoid, tricep, start events, stop events
%           the sampling frequency fs
%   output: two EMG structs, one for each muscle

M = csvread(filename,1,0); % import whole csv

% extract columns
delt  = M(:,1); % deltoid data (first column)
tri   = M(:,2); % tricep data (second column)
start = M(:,3); % start data (third column)
stop  = M(:,4); % stop data (fourth column)

% extract start and stop breakpoints
starts = find(start);
stops  = find(stop);
n = min(length(starts),length(stops));

% generate time basis and length
t = timebasis(delt, fs);
l = length(delt);

% pack it all into a struct
delt = struct('emg',delt,'time',t,'l',l,'starts',starts,'stops',stops,'n',n,'fs',fs);
tri = struct('emg',tri,'time',t,'l',l,'starts',starts,'stops',stops,'n',n,'fs',fs);

end
