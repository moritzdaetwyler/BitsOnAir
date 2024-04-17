% send and receive parameters
bit_repetitions = 1;
pilot = [0 1 1 1 0 1 1 1 1 0 1 0 1 1 0 1 0 0 0 1 0 0 0 0 1 1 1 1 1 1 1 0 1 0 1 0 0 0 0 1 0 1 1 1 0 0 1 1 0 1];
end_pilot = [1 0 1 1 0 1 0 0 0 1 0 0 1 1 1 1 0 0 0 1 1 1 0 0 0 0 0 1 1 0 0 0 0 1 1 0 0 1 1 0 0 0 1 1 1 1 0 0 1 1];
tau_s = 80;
tau_0 = 20;
tau_1 = 8;


% Genererate random bitsequence

    % Length of the bitsequence
    sequence_length = 50;
    b = Source(sequence_length)


% Custom Sequence
%b = [1, 0, 1, 1, 0, 1, 0, 0];


y = send(b, bit_repetitions, pilot, end_pilot, tau_s, tau_0, tau_1);

% Channel-Model
    % Perfect channel
    %r = y; 

    % AWGN Channel
    %r = awgn(y, 20); 

    % AWGN Channel + leading and trailing noise
    leading_length = 200;
    trailing_length = 250;
    Z = 4 .* randn(1, leading_length + length(y) + trailing_length);
    r = [zeros(1, leading_length), y, zeros(1, trailing_length)];
    r = Z+r;

bhat = receive(r, bit_repetitions, pilot, end_pilot, tau_s, tau_0, tau_1)