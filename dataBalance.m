function [ outT,outL ] = dataBalance(train,label)
%%
[a,b] = size(train);

count1 = sum(label==1)
count2 = sum(label==2)
count3 = sum(label==3)
count4 = sum(label==4)

num = min([count1,count2,count3,count4]);

outL = zeros(4*num,1);
%%
temp = [label, train];
temp = sortrows(temp);
class1 = temp(1:count1,2:end);
class2 = temp(count1:count1+count2+1,2:end);
class3 = temp(count1+count2+1:count1+count2+count3,2:end);
class4 = temp(count1+count2+count3+1:end,2:end);

%%
k = randperm(count4);
c4 = class4(k(1:num),:);

k = randperm(count1);
c1 = class1(k(1:num),:);

k = randperm(count2);
c2 = class2(k(1:num),:);

k = randperm(count3);
c3 = class3(k(1:num),:);

outT = [c1;c2;c3;c4];
outL(1:num,1) = 1;
outL(num+1:2*num,1) = 2;
outL(2*num+1:3*num,1) = 3;
outL(3*num+1:4*num,1) = 4;
%{
filename = 'finaltrain.xlsx';
xlswrite(filename,outT);
m = rand(14,10);
filename = 'trainlabel.xlsx';
xlswrite(filename,outL);
%}
end




