function [ filtered ] = filteremg( unfiltered, fs )
%filteremg: band-pass filters a signal with passband 20--400 Hz
%   usage:  [filtered] = filteremg(unfiltered, fs);
%   input:  signal to be filtered, sampling frequency
%   output: filtered signal

% normalized cutoff frequencies
fn = fs / 2;    % nyquist rate
fl = 20 / fn;   % normalize to nyquist because MATLAB
fh = 400 / fn;

% calculate FIR coefficients
[b,a] = butter(4,[fl,fh],'bandpass');

% filter signal
filtered = filter(b,a,unfiltered);

end
