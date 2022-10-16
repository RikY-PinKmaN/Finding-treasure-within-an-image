clear all;
I = imread('lena.gif');

% figure;

% figure;
% imshowpair(I,I2,'montage');
% [BW,threshOut] = edge(I,"canny");
% [BW1,threshOut1] = edge(I,"prewitt");
% [BW2,threshOut2] = edge(I,"sobel");

% I1 = edge(I,'sobel');
% I2 = edge(I,'canny');
% I3 = edge(I,'prewitt');
I1 = edge(I, "canny",[0.08, 0.09]);
imshowpair(I,I1,'montage');
% [Gmag, Gdir] = imgradient(I,'sobel');
% [Gmag1, Gdir1] = imgradient(I,'prewitt');
% 
% tiledlayout(3,2)
% 
% nexttile
% imshow(I)
% title('Lena')
% 
% nexttile
% imshow(I1)
% title('Sobel Filter')
% 
% nexttile
% imshow(I2)
% title('Canny Filter')
% 
% nexttile
% imshow(I3)
% title('Prewitt Filter')
% 
% nexttile
% imshowpair(Gmag,I1,'montage')
% title('Prewitt Filter')
% 


