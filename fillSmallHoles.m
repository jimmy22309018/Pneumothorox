function [output] = fillSmallHoles(inMri)

tMri = inMri;
holeSize = 100;
filled = imfill(tMri,'holes');
holes = filled & ~ tMri;
bigholes = bwareaopen(holes, holeSize);
smallholes = holes & ~bigholes;
tMri = tMri | smallholes;
output = tMri | inMri;

end

