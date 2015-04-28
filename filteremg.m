function [ filtered ] = filteremg(unfiltered)
%filteremg: band-pass filters a signal with passband 20--400 Hz
%   usage:  [filtered] = filteremg(unfiltered);
%   input:  EMG struct to be filtered
%   output: filtered EMG struct

% unpack everything
fs      = unfiltered.fs;
signal  = unfiltered.signal;

% normalized cutoff frequencies
fn = fs / 2;    % nyquist rate
fl = 20 / fn;   % normalize to nyquist because MATLAB
fh = 400 / fn;

% calculate FIR coefficients
[b,a] = butter(4,[fl,fh],'bandpass');

% filter signal
filtsig = filter(b,a,signal);

% transfer
filtered = unfiltered;

% update signal
filtered.signal = filtsig;

end
