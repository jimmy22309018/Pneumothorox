function [newMask] = esophagus(mask)
[len,wid,hei] = size(mask);
newMask = zeros(len,wid,hei);
%{
for i = 1 : hei
    counter = sum(sum(mask(:,:,i)));
    if counter > 180 && counter < 250
        tar = i
        break
    end
end

counterx = 0;
countery = 0;
for i = 1 : len
    for j = 1 : wid
        if(mask(i,j,tar)==1)
            counterx = counterx + i;
            countery = countery + j;
        end
    end
end

avgx = round(counterx / sum(sum(mask(:,:,tar))))
avgy = round(countery / sum(sum(mask(:,:,tar))))
%}
avgx = 92;
avgy = 240;
a = ones(len,wid);
a(avgx-30:avgx+30,avgy-20:avgy+20) = 0;

for i = 1 : hei
    newMask(:,:,i) = mask(:,:,i).*a;
end



end

