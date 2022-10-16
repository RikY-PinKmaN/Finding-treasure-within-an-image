clear all;
% Reading the image
I = imread('lena.gif');
% Adding noise
I_ng= imnoise(I,'gaussian',0,0.02);
I_nsp= imnoise(I,'salt & pepper',0.03);

% Getting threshold
[BW1,threshOut1] = edge(I,"canny");
[BW2,threshOut2] = edge(I,"prewitt");
[BW3,threshOut3] = edge(I,"sobel");
% Getting gradient
[Gmag1, Gdir1] = imgradient(I,'sobel');
[Gmag2, Gdir2] = imgradient(I,'prewitt');

%% Canny
% Edge Detection
I1 = edge(I, "canny",threshOut1);
I2 = edge(I, "canny",(threshOut1 + 0.02));
I3 = edge(I, "canny",(threshOut1 - 0.02));
In_1 = edge(I_ng, "canny",threshOut1);
In_2 = edge(I_ng, "canny",(threshOut1 + 0.2));
In_3 = edge(I_ng, "canny",(threshOut1 - 0.02));
% Plotting
figure;
subplot(3,2,1)
imshowpair(I,I1,'montage');
title('Default Threshold')
subplot(3,2,2)
imshowpair(I,I2,'montage');
title('Increased Threshold')
subplot(3,2,3)
imshowpair(I,I3,'montage');
title('Decreased Threshold')
subplot(3,2,4)
imshowpair(I_ng,In_1,'montage');
title('Noisy with Default Threshold')
subplot(3,2,5)
imshowpair(I_ng,In_2,'montage');
title('Noisy with Increased Threshold')
subplot(3,2,6)
imshowpair(I_ng,In_3,'montage');
title('Noisy with Decreased Threshold')

%% Sobel
% Edge Detection
I1 = edge(I, "sobel",threshOut2);
I2 = edge(I, "sobel",(threshOut2 + 0.02));
I3 = edge(I, "sobel",(threshOut2 - 0.02));
In_1 = edge(I_ng, "sobel",threshOut2);
In_2 = edge(I_ng, "sobel",(threshOut2 + 0.1));
In_3 = edge(I_ng, "sobel",(threshOut2 - 0.02));
% Plotting
figure;
subplot(4,2,1)
imshowpair(I,I1,'montage');
title('Default Threshold')
subplot(4,2,2)
imshowpair(I,I2,'montage');
title('Increased Threshold')
subplot(4,2,3)
imshowpair(I,I3,'montage');
title('Decreased Threshold')
subplot(4,2,4)
imshowpair(I_ng,In_1,'montage');
title('Noisy with Default Threshold')
subplot(4,2,5)
imshowpair(I_ng,In_2,'montage');
title('Noisy with Increased Threshold')
subplot(4,2,6)
imshowpair(I_ng,In_3,'montage');
title('Noisy with Decreased Threshold')
subplot(4,2,7)
imshowpair(I,Gmag1,'montage');
title('Gradient magnitude')
subplot(4,2,8)
imshowpair(I,Gdir1,'montage');
title('Gradient direction')

%% Prewitt
% Edge Detection
I1 = edge(I, "prewitt",threshOut3);
I2 = edge(I, "prewitt",(threshOut3 + 0.02));
I3 = edge(I, "prewitt",(threshOut3 - 0.02));
In_1 = edge(I_nsp, "prewitt",threshOut3);
In_2 = edge(I_nsp, "prewitt",(threshOut3 + 0.1));
In_3 = edge(I_nsp, "prewitt",(threshOut3 - 0.02));
% Plotting
figure;
subplot(4,2,1)
imshowpair(I,I1,'montage');
title('Default Threshold')
subplot(4,2,2)
imshowpair(I,I2,'montage');
title('Increased Threshold')
subplot(4,2,3)
imshowpair(I,I3,'montage');
title('Decreased Threshold')
subplot(4,2,4)
imshowpair(I_nsp,In_1,'montage');
title('Noisy with Default Threshold')
subplot(4,2,5)
imshowpair(I_nsp,In_2,'montage');
title('Noisy with Increased Threshold')
subplot(4,2,6)
imshowpair(I_nsp,In_3,'montage');
title('Noisy with Decreased Threshold')
subplot(4,2,7)
imshowpair(I,Gmag2,'montage');
title('Gradient magnitude')
subplot(4,2,8)
imshowpair(I,Gdir2,'montage');
title('Gradient direction')




