function normalized = normalizeemg(emgsignal, mvic)
%normalizeemg: normalizes an EMG signal to an MVIC measurement
%   usage:  normalized = normalizeemg(emgsignal, mvic);
%   input:  the signal to be normalized
%           the value to normalize it to
%   output: the normalized signal

normalized = emgsignal / mvic;
