function framesynced_bitsequence = framesync(demodulated_bitsequence, pilot, end_pilot)
    % arguments
    %     demodulated_bitsequence (1, :)
    %     pilot (1, :)
    %     end_pilot (1, :)
    % end

    if nargin == 1
        pilot = [0 1 1 1 0 1 1 1 1 0 1 0 1 1 0 1 0 0 0 1 0 0 0 0 1 1 1 1 1 1 1 0 1 0 1 0 0 0 0 1 0 1 1 1 0 0 1 1 0 1];
        end_pilot = [1 0 1 1 0 1 0 0 0 1 0 0 1 1 1 1 0 0 0 1 1 1 0 0 0 0 0 1 1 0 0 0 0 1 1 0 0 1 1 0 0 0 1 1 1 1 0 0 1 1];
    end

    demodulated_bitsequence_shifted = demodulated_bitsequence .* 2 - 1;
    
    pilot = 2 .* pilot - 1;
    pilot_offset = signalsync(demodulated_bitsequence_shifted, pilot);
    
    end_pilot = 2 .* end_pilot - 1;

    % TODO: end_pilot_offset is sometimes negative
    end_pilot_offset = signalsync(demodulated_bitsequence_shifted, end_pilot);
    
    
    framesynced_bitsequence = demodulated_bitsequence( (pilot_offset + length(pilot)):(end_pilot_offset - 1));
end