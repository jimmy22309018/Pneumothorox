function [air,avg] = missCount(data,mask)
[a,b,c] = size(data);
count = 0;
count2 = 0;
avg = 0;
air = 0;

total = 0;

for i = 1 : a
    for j = 1 : b
        for k = 1 : c
            if(mask(i,j,k) > 0 && data(i,j,k)>0)
                count = count + 1;
            end
            if(mask(i,j,k) > 0 && data(i,j,k)<-950)
                count2 = count2 + 1;
            end
            if(mask(i,j,k)>0)
                total = total + 1;
            end
        end
    end
end
if(total ~= 0)
    avg = count/total;
    air = count2/total;
end
end

