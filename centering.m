function [cx,cy] = centering(mask)
[a,b,c] = size(mask);
x = 0;
y = 0;
counter = 0;

for k = 1 : c
    for i = 1 : a
        for j = 1 : b
            if(mask(i,j,k) >0)
                counter = counter + 1;
                x = x + i;
                y = y + j;
            end
        end
    end
end

if (counter ==0)
    counter = 1;
end
cx = round(x/counter);
cy = round(y/counter);

end

