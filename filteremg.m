function [filtered] = filteremg(unfiltered,varargin)
%filteremg: band-pass filters a signal with passband 20--400 Hz unless specified
%   usage:  [filtered] = filteremg(unfiltered);
%       or: [filtered] = filteremg(unfiltered,fl,fh); 
%   input:  EMG struct to be filtered
%           high and low cutoff frequencies in Hz (optional)
%   output: filtered EMG struct

% unpack everything
fs      = unfiltered.fs;
signal  = unfiltered.signal;

% normalized cutoff frequencies
fn = fs / 2;    % nyquist frequency

switch nargin 
    case 1
        fl = 20 / fn;   % normalize to nyquist because MATLAB
        fh = 400 / fn;
    case 3
        fl = varargin{1} / fn;
        fh = varargin{2} / fn;
    otherwise
        disp('must specify either zero or two frequencies');
        return
end % switch

% calculate FIR coefficients
[b,a] = butter(4,[fl,fh],'bandpass');

% filter signal
filtsig = filter(b,a,signal);

% transfer
filtered = unfiltered;

% update signal
filtered.signal = filtsig;

end
