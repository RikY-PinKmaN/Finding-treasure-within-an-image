% Color the duck yellow!
im= imread('duckMallardDrake.jpg');
imshow(im);
[nr,nc,np]= size(im);
newIm= zeros(nr,nc,np);
newIm= uint8(newIm);
for r= 1:nr
 for c= 1:nc
  for p= 1:np
       if ( im(r,c,p)<180 && im(r,c,np)>180 )
% white feather of the duck; now change it to yellow
newIm(r,c,1)= 0;
newIm(r,c,2)= 225;
newIm(r,c,3)= 0;
else % the rest of the picture; no change
newIm(r,c,p)= im(r,c,p);
end
end
end
end
figure
imshow(newIm)