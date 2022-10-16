im = imread('Two_colour.jpg'); % read the image
imshow(im);
% extract RGB channels separatelly
red_channel = im(:, :, 1);
green_channel = im(:, :, 2);
blue_channel = im(:, :, 3);
% label pixels of yellow colour
yellow_map = green_channel < 150 & red_channel > 150 & blue_channel < 50;
% extract pixels indexes
[i_yellow, j_yellow] = find(yellow_map);
% visualise the results
figure;
imshow(im); % plot the image
hold on;
scatter(j_yellow, i_yellow,'magenta') % highlighted the yellow pixels
