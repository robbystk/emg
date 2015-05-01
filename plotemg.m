function plotemg(emg)
%plotemg:   Plots an EMG including start and stop events
%   usage:  plotemg(emg);
%   input:  EMG struct
%   outupt: none

plot(emg.time,emg.signal,'b-'); hold on;
for i=emg.starts,
    startt = emg.time(i);
    plot([startt,startt],ylim,'g-');
end % for
for i=emg.stops,
    stopt = emg.time(i);
    plot([stopt,stopt],ylim,'r-');
end %for
hold off;

end %function
