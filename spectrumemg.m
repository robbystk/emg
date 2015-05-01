function spectrumemg(emg)
%spectrumemg: Plots the frequency spectrum of an EMG signal
%   usage:  spectrumemg(emg);
%   input:  an EMG struct
%   output: none

Nfft = 2^ceil(log2(emg.l)); % length rounded up to nearest power of two

spectrum = fft(emg.signal,Nfft)/emg.l;
f = emg.fs / 2 * linspace(0, 1, Nfft / 2 + 1);

plot(f, abs(spectrum(1:Nfft / 2 + 1)));

end % function
