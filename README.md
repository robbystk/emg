# EMG
MATLAB functions and scripts for processing electromyography (EMG) signals.  Originally
written for data from a CleveMed BioRadio comparing the tricep and deltoid during
dumbbell press and perfect pushup, so some things (such as the `process` script) 
are specific to that, but most things will work for any EMG application.  

## Data Structures
### EMG Structs
These scripts make use of structs to store and pass EMG data between functions. 
An EMG struct has the following elements:  

|:--------|:-------|
|`signal`|A list of the EMG samples|
|`time`|A list of time values corresponding to the samples, starting from 0|
|`l`|the length (number of samples) of the signal|
|`starts`|A list of the indexes of 'start' event markers|
|`stops`|A list of the indexes of 'stop' event markers|
|`n`|The number of pairs of 'start' and 'stop' event markers|
|`fs`|The sampling frequency in Hz|

### 4-dimensional array of all subjects, exercises, reps, and muscles

## Signal Processing Functions
### importemg
imports emg data from a csv file with the following columns:  
deltoid, tricep, start events, stop events

e.g.: 
```
deltoid,            tricep,             Start,  End,
-0.035858154296875, 0.444793701171875,  0,      0,
0,                  0.428009033203125,  0,      0,
-0.018310546875,    0.516510009765625,  0,      0,
...
```

Usage: `[delt, tri] = importemg(filename, fs);` where `filename` is the name of the 
file from which the data is to be imported and `fs` is the sampling frequency.  

`delt` and `tri` are EMG structs

### timebasis

### filteremg

### deMainsEMG

### crop

### movingRMS

## process

## Plotting Functions
### plotemg

### colorplotemg

### compareplot

### spectrumemg

