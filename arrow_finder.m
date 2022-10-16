function [t_ind, arrow_ind]= arrow_finder(props)
n_obj=numel(props);
t_ind=[];arrow_ind=[];
hold on;
for i = 1 : n_obj
    if  props(i).Area<2000
    arrow_ind = [arrow_ind; i];
    elseif props(i).Area>2000
    t_ind = [t_ind; i];
    end
end
hold off;
end