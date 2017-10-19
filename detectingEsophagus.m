function [outMask] = detectingEsophagus(threshold,mask)
[a,b,c] = size(mask);
se = strel('disk',3);
outMask = mask;
%%
for i = 1 : c
    mask(:,:,i) = bwareaopen(mask(:,:,i), 200);
    mask(:,round(b/2),i) = 0;
    mask(:,round(b/2)+5,i) = 0;
    mask(:,round(b/2)+10,i) = 0;
    outMask(:,:,i) = imdilate(mask(:,:,i),se);
    outMask(:,round(b*0.4) : round(b*0.6),i) = bwareaopen(mask(:,round(b*0.4) : round(b*0.6),i),threshold);
    outMask(:,:,i) = imerode(mask(:,:,i),se);
    %outMask(:,round(b/2):round(b/2)+2,i) = 1;
end




end