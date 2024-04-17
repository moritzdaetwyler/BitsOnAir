function bitsequence = Source(sequence_length,p)

if nargin == 1
    p = 0.5;
end

rand_num = rand(1, sequence_length);

bitsequence = (rand_num <= p).*0 + (rand_num>p).*1;