function generateImageFromSignal(signal)

lImage = signal;

lImage = reshape(lImage, 8, length(lImage)/8);
lImage = bit2int(lImage, 8);
lImage = reshape(lImage, 71, 50, 3);
size(lImage);
image(lImage);