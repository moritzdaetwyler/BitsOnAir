function bitsequenceToFile(bitsequence, filename)

fid = fopen(filename, 'w');
fwrite(fid, bitsequence, 'ubit1');
fclose(fid);