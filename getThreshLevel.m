function [level] = getThreshLevel(mri)
[Gmag, Gdir] = imgradient(mri,'prewitt');
%BW = edge(mri,'canny');
new = Gmag.*mri;
level = graythresh(new);
end
%https://www.mathworks.com/help/images/ref/imgradient.html
