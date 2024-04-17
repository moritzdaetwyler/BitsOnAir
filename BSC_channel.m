function channel_bit_sequence = BSC_channel(bit_sequence, q)

rand_num = rand(length(bit_sequence), 1);

bitflip = 1.*(rand_num <= q) + 0.*(rand_num > q);

channel_bit_sequence = xor(bit_sequence, bitflip);