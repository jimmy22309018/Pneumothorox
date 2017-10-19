function [outMri] = getRingMask(Mri,width,mode,dia,ero)
%%
[a,b,c] = size(Mri);
outMri = zeros(a,b,c);
notBor = strel('disk',4);
se = strel('disk',7);
se1 = strel('disk',round(width/2));
se2 = strel('disk',width);
seN = strel('disk',2);
seN2 = strel('disk', width-2);

seD = strel('disk',round(width*dia));
seE = strel('disk',round(width*ero));


%%
for i = 1 : c
    Mri(:,:,i) = bwareaopen(Mri(:,:,i),200);
    Mri(:,:,i) = imerode(Mri(:,:,i),notBor);
    if(mode ==0)
        outMri(:,:,i) = imdilate(Mri(:,:,i),se2) - Mri(:,:,i);
    elseif(mode ==1)
        outMri(:,:,i) = imdilate(Mri(:,:,i),se1) - imerode(Mri(:,:,i),se1);
    elseif(mode ==2)
        outMri(:,:,i) = Mri(:,:,i)-imerode(Mri(:,:,i),se2);
    elseif(mode ==3)
        outMri(:,:,i) = imdilate(Mri(:,:,i),seN)-imerode(Mri(:,:,i),seN2);
    else
        outMri(:,:,i) = imdilate(Mri(:,:,i),seD)-imerode(Mri(:,:,i),seE);
    end
end
%%
a = round(c/60);
figure, 
subplot(2,4,1),imshow(outMri(:,:,a));
subplot(2,4,2),imshow(outMri(:,:,2*a));
subplot(2,4,3),imshow(outMri(:,:,3*a));
subplot(2,4,4),imshow(outMri(:,:,4*a));
subplot(2,4,5),imshow(outMri(:,:,5*a));
subplot(2,4,6),imshow(outMri(:,:,6*a));
subplot(2,4,7),imshow(outMri(:,:,7*a));
subplot(2,4,8),imshow(outMri(:,:,8*a));

figure, 
subplot(2,4,1),imshow(outMri(:,:,9*a));
subplot(2,4,2),imshow(outMri(:,:,10*a));
subplot(2,4,3),imshow(outMri(:,:,11*a));
subplot(2,4,4),imshow(outMri(:,:,12*a));
subplot(2,4,5),imshow(outMri(:,:,13*a));
subplot(2,4,6),imshow(outMri(:,:,14*a));
subplot(2,4,7),imshow(outMri(:,:,15*a));
subplot(2,4,8),imshow(outMri(:,:,16*a));


figure, 
subplot(2,4,1),imshow(outMri(:,:,17*a));
subplot(2,4,2),imshow(outMri(:,:,18*a));
subplot(2,4,3),imshow(outMri(:,:,19*a));
subplot(2,4,4),imshow(outMri(:,:,20*a));
subplot(2,4,5),imshow(outMri(:,:,21*a));
subplot(2,4,6),imshow(outMri(:,:,22*a));
subplot(2,4,7),imshow(outMri(:,:,23*a));
subplot(2,4,8),imshow(outMri(:,:,24*a));

figure, 
subplot(2,4,1),imshow(outMri(:,:,25*a));
subplot(2,4,2),imshow(outMri(:,:,26*a));
subplot(2,4,3),imshow(outMri(:,:,27*a));
subplot(2,4,4),imshow(outMri(:,:,28*a));
subplot(2,4,5),imshow(outMri(:,:,29*a));
subplot(2,4,6),imshow(outMri(:,:,30*a));
subplot(2,4,7),imshow(outMri(:,:,31*a));
subplot(2,4,8),imshow(outMri(:,:,32*a));




end

