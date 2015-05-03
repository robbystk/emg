fs = 960;

for subject = 1:5,
    for exercise = 1:2,
        if exercise == 1
            exstr = 'dumbbellpress';
        else
            exstr = 'perfectpushup';
        end %if
        filename = sprintf('../data/%s.sub%d.csv',exstr,subject)
        [tri,delt] = importemg(filename,fs)
        for rep = 1:5,
            
        end %for rep
    end %for exercise
end %for subject
