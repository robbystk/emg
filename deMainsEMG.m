function [filtered] = deMainsEMG(emg)
%deMainsEMG: removes 60 Hz mains hum from an emg signal
%   usage:  [filtered] = deMainsEMG(unfiltered);
%       or: [filtered] = deMainsEMG(unfiltered,fl,fh); 
%   input:  EMG struct to be filtered
%   output: notch-filtered EMG struct

% unpack everything
fs      = unfiltered.fs;
signal  = unfiltered.signal;

% normalized frequencies
fn = fs / 2;    % nyquist frequency
wc = 60 / fn    % center frequency 60 Hz 
bw = 1 / fn     % -3 dB bandwidth 1 Hz

% calculate FIR coefficients
[b,a] = iirnotch(wc, bw);

% filter signal
filtsig = filter(b,a,signal);

% transfer
filtered = unfiltered;

% update signal
filtered.signal = filtsig;

end
