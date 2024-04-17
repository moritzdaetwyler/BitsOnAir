function bhat = demodulate(Y, tau_s, tau_0, tau_1)
    % arguments
    %     Y (1, :)
    %     tau_s
    %     tau_0
    %     tau_1
    % end

    if nargin == 1
        tau_s = 80;
        tau_0 = 20;
        tau_1 = 8;
    end

% Toggle Plotting
plotting = false;

extended_N = length(Y);
N = extended_N / tau_s;

% Generate Carrier-oscillators
x1 = cos(2*pi/tau_0.*(1:extended_N));
x2 = cos(2*pi/tau_1.*(1:extended_N));

multi_x1 = Y.*x1;
multi_x2 = Y.*x2;

z1 = reshape (multi_x1', tau_s, N)';
z1 = sum(z1, 2);

z2 = reshape (multi_x2', tau_s, N)';
z2 = sum(z2, 2);

diff = z2 - z1;

% MLE
bhat = (0 .* (diff<0) + (diff>=0))';

if plotting
    close all;

    subplot(7,1,1);
    plot(Y);
    title('Received Signal');

    subplot(7,1,2);
    plot(multi_x1);
    title('Multiplication with x_1(t)');

    subplot(7,1,3);
    plot(multi_x2);
    title('Multiplication with x_2(t)');

    subplot(7,1,4);
    stem(z1);
    xlim([1, N+1]);
    title('Correlation with x_1(t)');

    subplot(7,1,5);
    stem(z2);
    xlim([1, N+1]);
    title('Correlation with x_2(t)');

    subplot(7,1,6);
    stem(diff);
    xlim([1, N+1]);
    title('z_2(t) - z_1(t)')

    subplot(7,1,7);
    stem(bhat);
    xlim([1, N+1]);
    title('Detected bitsequence');
end
