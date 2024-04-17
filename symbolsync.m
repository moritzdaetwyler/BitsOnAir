function synced_signal = symbolsync(signal, tau_s, tau_0, tau_1)
    % arguments
    %     signal (1, :)
    %     tau_s
    %     tau_0
    %     tau_1
    % end

    if nargin == 1
        tau_s = 80;
        tau_0 = 20;
        tau_1 = 8;
    end

plotting = false;

% for testing purposes
% signal = [zeros(1, 200), signal, 0 0 0 0 0];

% generate test signal that contains both carriers
test_signal = modulate([0, 1], tau_s, tau_0, tau_1);

% find offset
offset = signalsync(signal, test_signal);
% offset might be out of [0, tau_s], we use modulo to fix that
offset = mod(offset, tau_s);

% offset is like matlab indexes (starting at 1), subtract 1 for the delta
delta_s = offset - 1;

synced_signal = signal(offset:end);

trailing_zeros = mod(length(synced_signal), tau_s);

synced_signal = synced_signal(1:(end - trailing_zeros));

if plotting
    close all;

    subplot(3, 1, 1);
    plot(signal);
    title("received signal")

    subplot(3, 1, 2);
    plot(test_signal);
    title("test\_signal")

    subplot(3, 1, 3);
    plot(synced_signal);
    title("Synced signal, "+delta_s+" leading zeros, "+trailing_zeros+" trailing zeros")
end