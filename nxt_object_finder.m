function [n_id] = nxt_object_finder(cur_object, im)
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
[~,C] = kmeans([y x],length(arrow_ind));
Cent = round(C);
b = [];
for i=1:length(props)
    b=[b;bbox2points(props(i).BoundingBox)];
    for j=1:length(Cent)
        d(j)=norm(props(i).Centroid-Cent(j,:));
    end
    [~, idx] = min(d);
    Cent_Cor(i,:)=Cent(idx,:);
end
% while the current object is an arrow, continue 
    p = Cent_Cor(cur_object,:);
    dir_vec = Cent_Cor(cur_object,:)-props(cur_object).Centroid;
    p = p + 3*dir_vec; 
    p_x = p(1);
    p_y = p(2);
    for n=1:length(props)

        %Obtain the bounding box
        bounding_box=props(n).BoundingBox;

        if p_x>bounding_box(1) && p_x<(bounding_box(1)+bounding_box(3))
            if p_y>bounding_box(2)&& p_y<(bounding_box(2)+bounding_box(4))
                n_id=n;
                return;
            end
        end
    end
    n_id=0;