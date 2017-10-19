function [ output ] = standardize( input )
a = size(input);
output = input;
for i = 1 : a
    if(input(i,1)> 4)
        output(i,1) = 4;
    end
    if(input(i,1) < 1)
        output(i,1) = 1;
    end
end


end

