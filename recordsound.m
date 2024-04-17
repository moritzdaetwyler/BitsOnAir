function recording = recordsound(duration)

samplerate = 22044;
bits = 16;

% Get Audio Output Info
%info = audiodevinfo;
%info.input(1)

recorder = audiorecorder(samplerate, bits, 1);

record(recorder);
pause(duration);
stop(recorder);

recording = getaudiodata(recorder)';

% Plotting
close all;
plot(recording);