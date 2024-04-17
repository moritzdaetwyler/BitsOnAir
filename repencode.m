function rep_bitsequence = repencode(bitsequence, n)

bitsequence_rep = repmat(bitsequence,n, 1);
rep_bitsequence = reshape(bitsequence_rep, n*length(bitsequence), 1)';