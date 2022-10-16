function [cur_object] = nxt_object_finder(cur_object, im)
% Binarisation
bin_threshold = 0.09;
bin_im = im2bw(im, bin_threshold);
% Extracting connected components
con_com = logical(bin_im);
% Computing objects properties
props = regionprops(con_com);
% Arrow/non-arrow determination
[~, arrow_ind]= arrow_finder(props);
% Getting yellow pixels
yellow = im(:, :, 1) > 210 & im(:, :, 2) > 210 & im(:, :, 3) < 100;
[x, y] = find(yellow> 0);
% K-means to get centroid of the yellow pixel
[~,C] = kmeans([y x],length(arrow_ind));
Cent = round(C);
% To get the nearest point in order to arange the yellow pixel centroid
% according to centroid of the arrow
for i=1:length(props)
    for j=1:length(Cent)
        d(j)=norm(props(i).Centroid-Cent(j,:));
    end
    [~, idx] = min(d);
    Cent_Cor(i,:)=Cent(idx,:);
end
% Calculating the direction vector  and the next point
p = Cent_Cor(cur_object,:);
dir_vec = Cent_Cor(cur_object,:)-props(cur_object).Centroid;
p = p + 2*dir_vec;
h = 0;
% To check if its in the bouding box of the next component
while(h==0)
    for i = 1:length(props)
        % Decision Rule for the bounding box
        b = props(i).BoundingBox;
        if p(1)>b(1) && p(1)<(b(1)+b(3))
            if p(2)>b(2)&& p(2)<(b(2)+b(4))
                h= 1;
            end
        end
        if h==1
            break
        end
    end
    p= p + 0.5*dir_vec;
end
cur_object=i;
end