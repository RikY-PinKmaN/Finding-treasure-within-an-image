
clear all;

%% Reading image
im = imread('Treasure_medium.jpg'); % process images
imshow(im);

%% Binarisation
bin_threshold = 0.09; % threshold
bin_im = im2bw(im, bin_threshold);
imshow(bin_im);

%% Extracting connected components
con_com = bwlabel(bin_im);
imshow(label2rgb(con_com));

%% Computing objects properties
props = regionprops(con_com);

%% Drawing bounding boxes
n_objects = numel(props);
imshow(im);
hold on;
for object_id = 1 : n_objects
    rectangle('Position', props(object_id).BoundingBox, 'EdgeColor', 'r');
end
hold off;

%% Arrow/treasure determination

[t_ind, arrow_ind]= arrow_finder(props);

%% Finding red arrow
n_arrows = numel(arrow_ind);
start_arrow_id = 0;
% check each arrow until find the red one
for arrow_num = 1 : n_arrows
    object_id = arrow_ind(arrow_num);    % determine the arrow id

    % extract colour of the centroid point of the current arrow
    centroid_colour = im(round(props(object_id).Centroid(2)), round(props(object_id).Centroid(1)), :);
    if centroid_colour(:, :, 1) > 240 && centroid_colour(:, :, 2) < 10 && centroid_colour(:, :, 3) < 10
        % the centroid point is red, memorise its id and break the loop
        start_arrow_id = object_id;
        break;
    end
end

%% Hunting
cur_object = start_arrow_id; % start from the red arrow
path = cur_object;
% While the current object is arrow
while ismember(cur_object, arrow_ind)
    cur_object = nxt_object_finder(cur_object, im);
    path(end + 1) = cur_object;
end


%% visualisation of the path
imshow(im);
hold on;
for path_element = 1 : numel(path) - 1
    object_id = path(path_element); % determine the object id
    rectangle('Position', props(object_id).BoundingBox, 'EdgeColor', 'y');
    str = num2str(path_element);
    text(props(object_id).BoundingBox(1), props(object_id).BoundingBox(2), str, 'Color', 'r', 'FontWeight', 'bold', 'FontSize', 14);
end

% visualisation of the treasure
treasure_id = path(end);
rectangle('Position', props(treasure_id).BoundingBox, 'EdgeColor', 'g');

