function X = receive(Y, bit_repetitions, pilot, end_pilot, tau_s, tau_0, tau_1)
% RECEIVE  Creates bitsequence from FM-Signal
%
% Syntax
%   X = receive(signal)
%   X = send(signal, bit_repetitions, pilot, end_pilot, tau_s, tau_0, tau_1)
%
% Input Arguments
%   signal - FM-Signal (likely created from send() and passed through a channel)
%   bit_repetitions = 5 - Number of repetitions in repetition-encoding
%   pilot - Pilot before the payload
%   end_pilot - Pilot after the payload
%   tau_s - length of symbol
%   tau_0 - wavelength of 1st transmission-frequency
%   tau_1 - wavelength of 2nd transmission-frequency
%
%   See also SEND

    % arguments
    %     Y (1,:)
    %     bit_repetitions
    %     pilot (1, :)
    %     end_pilot (1, :)
    %     tau_s
    %     tau_0
    %     tau_1
    % end

    if nargin == 1
        bit_repetitions = 5;
        pilot = [0 1 1 1 0 1 1 1 1 0 1 0 1 1 0 1 0 0 0 1 0 0 0 0 1 1 1 1 1 1 1 0 1 0 1 0 0 0 0 1 0 1 1 1 0 0 1 1 0 1];
        end_pilot = [1 0 1 1 0 1 0 0 0 1 0 0 1 1 1 1 0 0 0 1 1 1 0 0 0 0 0 1 1 0 0 0 0 1 1 0 0 1 1 0 0 0 1 1 1 1 0 0 1 1];
        tau_s = 80;
        tau_0 = 20;
        tau_1 = 8;
    end

    % Symbolsync
    X_synced = symbolsync(Y, tau_s, tau_0, tau_1);

    % Demodulate
    X_demodulated = demodulate(X_synced, tau_s, tau_0, tau_1);

    % Framesync
    % TODO: sometimes returns an empty vector.
    X_framesynced = framesync(X_demodulated, pilot, end_pilot);

    % Decode
    X = repdecode(X_framesynced, bit_repetitions);
    
end