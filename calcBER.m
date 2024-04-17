function BER = calcBER(X, Y)
    BER = mean(mod(X-Y));
end