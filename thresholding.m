function [Mri] = thresholding(Mri)
[a,b,c] = size(Mri);

figure, 
h = histogram(Mri);
%% FIrst time
I = graythresh(Mri(:,:,round(c/2)));

for i = 1 : c
    Mri(:,:,c) = im2bw(Mri(:,:,c));
end
figure, 
h = histogram(Mri);






end

