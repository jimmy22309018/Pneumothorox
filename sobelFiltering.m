function [sobMri] = sobelFiltering(Mri,len)
[x,y,z] = size(Mri);
sobMri = zeros(x,y,z);
mask = [-1 , -2 , -1 ; 0 , 0 , 0 ; 1 , 2 , 1];

for i = 1 : len
   sobMri(:,:,i) = imfilter(Mri(:,:,i),mask);
end

end

