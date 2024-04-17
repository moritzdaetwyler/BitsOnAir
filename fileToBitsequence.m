function bitsequence = fileToBitsequence(filename)

fid = fopen(filename, 'r');
bitsequence = fread(fid, 'ubit1')'
fclose(fid);