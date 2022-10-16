clear all;
%% RGB histogram of image
% Reading the image
I = imread('ct.jpg');
% Getting each RGB channel
r= (I(:,:,1));
g =(I(:,:,2));
b = (I(:,:,3));
% Plottinhg each histogram
figure;
subplot(4,1,1)
imshow(I)
title ('Original image')
subplot(4,1,2)
imhist(r)
xlabel('Intensity')
ylabel('No of Pixels')
title('Histogram of the red colour')
subplot(4,1,3)
imhist(g)
xlabel('Intensity')
ylabel('No of Pixels')
title('Histogram of the green colour')
subplot(4,1,4)
imhist(b)
xlabel('Intensity')
ylabel('No of Pixels')
title('Histogram of the blue colour')

%% Difference between one and two colours
% Reading the image
I1 = imread('One_colour.jpg');
I2 = imread('Two_colour.jpg');
% Greyscale
I1_g = rgb2gray(I1);
I2_g = rgb2gray(I2);
% Plottinhg each histogram
figure;
subplot(2,2,1)
imshow(I1)
title ('One Colour image')
subplot(2,2,3)
imhist(I1_g)
xlabel('Intensity')
ylabel('No of Pixels')
title ('One Colour Histogram')
subplot(2,2,2)
imshow(I2)
title ('Two Colour image')
subplot(2,2,4)
imhist(I2_g)
xlabel('Intensity')
ylabel('No of Pixels')
title ('Two Colour Histogram')


