function [X] = pcaData(data,coeff,K)
%%
y = data(:,1);
tempX = data(:,2:37);
%%
[a,b] = size(tempX);
X = zeros(a,K);


for i = 1 : a
    X(i,:) = tempX(a,:)*coeff;
end
end

