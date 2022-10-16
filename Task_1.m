I= imread('Dog.jpg');
size(I);
imshow(I);
figure;
Ig= im2bw(I);
imshow(Ig);
imshow(Ig);
imfinfo('Dog.jpg');
imwrite(Ig,'Dog1.jpg');
d= imread('Dog1.jpg');
figure;
imshow(d);
I_b= I-100;
figure;
subplot(3,1,1);
imshow(I);
subplot(3,1,2);
imshow(I_b);
subplot(3,1,3);
imshow(flipLtRt(I))


