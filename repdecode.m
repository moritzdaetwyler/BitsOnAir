function bitsequence = repdecode(bitsequence_rep, n)
    % arguments
    %     bitsequence_rep (1, :)
    %     n
    % end

    %bitsequence_rep = bitsequence_rep(1:-mod(bitsequence_rep, n))

    if nargin == 1
        n = 5;
    end

    reshaped = reshape(bitsequence_rep, n, length(bitsequence_rep)/n);
    
    bitsequence = round(mean(reshaped, 1));
end