function [lapMri] = laplacianFiltering(Mri,len)
[a,b,c] = size(Mri);
lapMri = zeros(a,b,c);
mask = [ 0 , -1 , 0 ; -1 , 4 , -1 ; 0 , -1 , 0];

for i = 1 : len
   lapMri(:,:,i) = imfilter(Mri(:,:,i),mask); 
end

end

