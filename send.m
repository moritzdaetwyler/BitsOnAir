function X = send(bitsequence, bit_repetitions, pilot, end_pilot, tau_s, tau_0, tau_1)
% SEND  Creates FM-Signal from bitsequence
%
% Syntax
%   X = send(bitsequence)
%   X = send(bitsequence, bit_repetitions, pilot, end_pilot, tau_s, tau_0, tau_1)
%
% Input Arguments
%   bitsequence - Sequence of bits to modulate
%   bit_repetitions = 5 - Number of repetitions in repetition-encoding
%   pilot - Pilot before the payload
%   end_pilot - Pilot after the payload
%   tau_s - length of symbol
%   tau_0 - wavelength of 1st transmission-frequency
%   tau_1 - wavelength of 2nd transmission-frequency
%
%   See also RECEIVE

    % arguments
    %     bitsequence (1, :)
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
    
    % Repetition-Encoding
    X_encoded = repencode(bitsequence, bit_repetitions);

    % Add Pilots
    X_pilot = [pilot, X_encoded, end_pilot];

    % Modulate
    X = modulate(X_pilot, tau_s, tau_0, tau_1);
end