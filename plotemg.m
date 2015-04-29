function plotemg(emg)
%plotemg:   Plots an EMG including start and stop events
%   usage:  plotemg(emg);
%   input:  EMG struct
%   outupt: none

plot(emg.time,emg.signal,'b-'); hold on;
for i=1:emg.n,
    startt = emg.time(emg.starts(i));
    stopt = emg.time(emg.stops(i));
    plot([startt,startt],ylim,'g-');
    plot([stopt,stopt],ylim,'r-');
end %for
hold off;

end
