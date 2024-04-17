function [mu_N, sigma_N] = Drain(bitsequence)

% bitsequence = Source(50, 0.5);

mu_N = mean(bitsequence);
sigma_N = std(bitsequence);