function [newFea] = getNewFea(fs,oldFea,whMat)
[a,b] = size(oldFea);
NumFea = sum(fs(:));
newFea = zeros(a,NumFea);
[a,b] = size(fs);
counter = 1;

oldFea = oldFea * whMat;
for i = 1 : b
    if(fs(1,i) ~= 0)
        newFea(:,counter) = oldFea(:,i);
        counter = counter + 1;
    end
end

end

