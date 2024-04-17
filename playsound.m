function playsound(bitsequence, path, outputID)

saveFile = true;

if (nargin == 1)
    saveFile = false;
end

if (nargin < 3)
    outputID = -1;
end

samplerate = 22044;
bits = 16;

% Get Audio Output Info
%info = audiodevinfo;
%info.output(1)


player = audioplayer(bitsequence, samplerate, bits, outputID);
play(player);
pause(length(bitsequence')/samplerate + 1);

if saveFile
    time = datetime;
    filename = year(time) + "-" + month(time) + "-" + day(time) + "_" + hour(time) + "-" + minute(time) + "-" + round(second(time)) + ".wav"
    audiowrite(path + "/" + filename, bitsequence, samplerate);
end