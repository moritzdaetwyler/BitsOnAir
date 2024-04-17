function offset = signalsync(a,b)
% find b in a

plotting = false;

[r, lags] = xcorr(a, b);

% ugly fix so the offset is nonnegative
r = r .* [zeros(1, (length(r)-1)/2), ones(1, ((length(r)-1)/2 + 1))];

[~, index] = max(r);

% TODO: offset sometimes negative, does this make sense?
offset = lags(index + 1);

if plotting
    l = max(length(a), length(b));

    subplot(3,1,1);
    stem(a);
    title("a");
    xlim([1, l]);

    subplot(3,1,2);
    stem(b);
    title("b")
    xlim([1, l]);

    subplot(3, 1, 3);
    stem(a);
    hold on
    stem((offset:(offset + length(b) -1)), b);
    xlim([1, l]);
    title("b shifted by " + offset)
end