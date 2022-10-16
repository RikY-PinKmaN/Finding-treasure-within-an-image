I = imread('lena.gif');
subplot(5,2,1)
imshow(I)

I_h= imhist(I);
subplot(5,2,2)
plot(I_h')
hold on
imhist(I)

I_a= imadjust(I,[0.2 0.6],[]);
subplot(5,2,3)
imshow(I_a)
I_h1= imhist(I_a);
subplot(5,2,4)
plot(I_h1')
hold on
imhist(I_a)

I_e= histeq(I,128);
subplot(5,2,5)
imshow(I_e)
I_h2= imhist(I_e);
subplot(5,2,6)
plot(I_h2')
hold on
imhist(I_e)

I_ng= imnoise(I,'gaussian',0,0.02);
subplot(5,2,7)
imshow(I_ng)
I_ng_d= imgaussfilt(I_ng,2);
subplot(5,2,8)
imshow(I_ng_d)

I_nsp= imnoise(I,'salt & pepper',0.03);
subplot(5,2,9)
imshow(I_nsp)
I_nsp_d= imgaussfilt(I_ng,2);
subplot(5,2,10)
imshow(I_nsp_d)
