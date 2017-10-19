function [maxR,maxC] = linearScan(mask)
%%
[a,b,c] = size(mask);
row = zeros(1,a);
column = zeros(1,b);
%%
%{
se = strel('disk',3);
for i = 1 : c
    mask(:,:,i) = imdilate(mask(:,:,i),se);
end
%}

%%
rcount = 0;
for x = 1 : a
   temp = mask(x,:,:);
   temp = reshape(temp,[b ,c]);
   cc = bwconncomp(temp);
   row(1,x) = cc.NumObjects;
   if(row(1,x) >0)
       rcount = rcount + 1;
   end
end
ccount = 0;
for y = 1 : b
   temp = mask(:,y,:);
   temp = reshape(temp,[a ,c]);
   cc = bwconncomp(temp);
   column(1,y) = cc.NumObjects;
   if(column(1,y)>0)
       ccount = ccount + 1;
   end
end


maxR = sum(sum(row(:)))/rcount;
maxC = sum(sum(column(:)))/ccount;

if(rcount ==0)
    maxR = 0;
end
if(ccount ==0)
    maxC = 0;
end

end

