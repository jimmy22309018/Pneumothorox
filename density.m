function [d] = density( data,mask)
[a,b,c] = size(data);
count = 0;
sum = 0;


for i = 1 : a
    for j = 1 : b
        for k = 1 : c
            if(mask(i,j,k)>0)
                sum = sum + data(i,j,k);
                count = count + 1;
            end
        end
    end
end
if(count~=0)
    d = sum/count;
else
    d = 0;
end
%[sum,count]
end

