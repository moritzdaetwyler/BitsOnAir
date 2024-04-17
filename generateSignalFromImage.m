function signal = generateSignalFromImage(path)

if (nargin==0)
    path = "./Transmission_test/image1.bmp";
end

lImage = imread(path, "bmp");
size(lImage)
lImage = reshape(lImage, 1, prod(size(lImage), "all"));
lImage = int2bit(lImage, 8);
lImage = reshape(lImage, 1, 8*length(lImage));

signal = lImage;

