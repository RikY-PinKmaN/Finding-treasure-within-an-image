
% Display the original image.
rgbImage = imread("Dog.jpg");
subplot(2, 4, 1);
imshow(rgbImage);
title('Original RGB image');
% Convert to HSV color space
hsvimage = rgb2hsv(rgbImage);
% Extract out the individual channels.
hueImage = hsvimage(:,:,1);
satImage = hsvimage(:,:,2);
valueImage = hsvimage(:,:,3);
% Display the individual channels.
subplot(2, 4, 2);
imshow(hueImage);
title('Hue Image');
subplot(2, 4, 3);
imshow(satImage);
title('Saturation Image');
subplot(2, 4, 4);
imshow(valueImage);
title('Value Image');
% Take histograms
[hCount, hValues] = imhist(hueImage(:), 18);
[sCount, sValues] = imhist(satImage(:), 3);
[vCount, vValues] = imhist(valueImage(:), 3);
% Plot histograms.
subplot(2, 4, 6);
bar(hValues, hCount);
title('Hue Histogram');
subplot(2, 4, 7);
bar(sValues, sCount);
title('Saturation Histogram');
subplot(2, 4, 8);
bar(vValues, vCount);
title('Value Histogram');
% Alert user that we're done.
message = sprintf('Done processing this image.\n Maximize and check out the figure window.');
msgbox(message);