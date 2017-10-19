function [output] = fillBigHoles(mask)
se = strel('disk',5);
tMri = imdilate(mask,se);
filled = imfill(tMri,'holes');
tMri = tMri | filled;
output = imerode(tMri,se);

end

