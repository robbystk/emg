function compareplot(array, subject, drep, prep)
%compareplot: plots a comparison between exercises and muscles
%   usage:  compareplot(array, subject, rep);
%   input:  the array to get the data from 
%           the number of the subject
%           the rep number to use for dumbbell press
%           the rep number to use for perfect pushup
%   output: none

% get emgs out of array
dpdelt  = array(subject,1,drep,1);
dptri   = array(subject,1,drep,2);
pudelt  = array(subject,2,prep,1);
putri   = array(subject,2,prep,2);

figure

% plot Dumbbell Press
subplot(2,1,1); hold on;
plot(dpdelt.time,dpdelt.signal,'b-');
plot(dptri.time,dptri.signal,'r-');
ylim([0 2.5]);
title(sprintf('Subject %d Dumbbell Press rep %d',subject,drep));
xlabel('Time (ms)');
ylabel('RMS EMG activity (mV)');
legend('Deltoid','Tricep','Location','NorthWest');
hold off;

% plot Perfect Pushup
subplot(2,1,2); hold on;
plot(pudelt.time,pudelt.signal,'b-');
plot(putri.time,putri.signal,'r-');
ylim([0 2.5]);
title(sprintf('Subject %d Perfect Pushup rep %d',subject,prep));
xlabel('Time (ms)');
xlabel('Time (ms)');
ylabel('RMS EMG activity (mV)');
legend('Deltoid','Tricep','Location','NorthWest');
hold off;

end %function
