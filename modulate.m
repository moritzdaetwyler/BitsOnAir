function y = modulate(b, tau_s, tau_0, tau_1)
    % arguments
    %     b (1,:)
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

N = length(b);
extended_N = tau_s*N;

extended_bitsequence = reshape(repmat(b, tau_s, 1), 1, []);

carrier_0 = cos(2*pi/tau_0.*(1:extended_N)).*(1-extended_bitsequence);
carrier_1 = cos(2*pi/tau_1.*(1:extended_N)).*(extended_bitsequence);
y = carrier_0 + carrier_1;

if plotting
    close all;
    subplot(4,1,1);
    plot(extended_bitsequence);
    title('Extended bitsequence');
    subplot(4,1,2);
    plot(carrier_0);
    title('Carrier 1');
    subplot(4,1,3);
    plot(carrier_1);
    title('Carrier 2');
    subplot(4,1,4);
    plot(y);
    title('Carrier y');
end
