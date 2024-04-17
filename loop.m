% Length of the bitsequence
sequence_length = 5;
% propability of 0s and 1s
p = 0.5;

% send and receive parameters
bit_repetitions = 5;
pilot = [0 1 1 1 0 1 1 1 1 0 1 0 1 1 0 1 0 0 0 1 0 0 0 0 1 1 1 1 1 1 1 0 1 0 1 0 0 0 0 1 0 1 1 1 0 0 1 1 0 1];
end_pilot = [1 0 1 1 0 1 0 0 0 1 0 0 1 1 1 1 0 0 0 1 1 1 0 0 0 0 0 1 1 0 0 0 0 1 1 0 0 1 1 0 0 0 1 1 1 1 0 0 1 1];
tau_s = 80;
tau_0 = 20;
tau_1 = 8;

BER = false;
SNRs = (-50:10);

% Genererate Bitsequence
%b = Source(sequence_length, p)

% Custom Sequence
b = [1 0 1 1 0 1 0 0];


y = send(b, bit_repetitions, pilot, end_pilot, tau_s, tau_0, tau_1);

% Channel-Model
%r = y; % Perfect channel
%r = awgn(y, 20); % AWGN Channel

% AWGN Channel + leading and trailing noise
leading_length = 200;
trailing_length = 250;
Z = 2 .* randn(1, leading_length + length(y) + trailing_length);
r = [zeros(1, leading_length), y, zeros(1, trailing_length)];
r = Z+r;

bhat = receive(r, bit_repetitions, pilot, end_pilot, tau_s, tau_0, tau_1)

% Drain
[mu_N, sigma_N] = Drain(bhat);



for i=[1:loopsize]
    bitsequence = Source(sequence_length, p);
    [mu_Ns(i), std_Ns(i)] = Drain(bitsequence);
end

h = figure(1)
subplot(1, 2, 1);

hist(mu_Ns, 200);

title("p=0.8, sequence length=1000")

mu = mean(mu_Ns);
std = sqrt(mean((mu_Ns-mu).^2)); % = std(mu_Ns)

x = 0:0.01:1;
y = gaussmf(x, [std, mu]);

subplot(1, 2, 2);
plot(x,y);