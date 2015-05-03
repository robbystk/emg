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
            for rep = 1:5,
                part = crop(filtered,rep);
                part.signal = detrend(part.signal);
                trials(subject,exercise,rep,muscle) = part;
                movingrms(subject,exercise,rep,muscle) = movingRMS(part,75);
                totalrms(subject,exercise,rep,muscle) = rms(part.signal);
            end %for rep
        end %for muscle       
    end %for exercise
end %for subject
