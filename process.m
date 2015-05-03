fs = 960;

for subject = 1:5,
    for exercise = 1:2,
        if exercise == 1
            exstr = 'dumbbellpress';
        else
            exstr = 'perfectpushup';
        end %if
        filename = sprintf('../data/%s.sub%d.csv',exstr,subject);
        [muscles(1),muscles(2)] = importemg(filename,fs);
        for muscle = 1:2,
            filtered = filteremg(deMainsEMG(muscles(muscle)));
            trials(subject,exercise,muscle) = filtered;
            for rep = 1:5,
%               disp(sprintf('s: %d; e: %d; r: %d; m: %d',subject,exercise,rep,muscle));
                part = crop(filtered,rep);
                part.signal = detrend(part.signal);
                reps(subject,exercise,rep,muscle) = part;
                movingrms(subject,exercise,rep,muscle) = movingRMS(part,20);
                totalrms(subject,exercise,rep,muscle) = rms(part.signal);
            end %for rep
        end %for muscle       
    end %for exercise
end %for subject
