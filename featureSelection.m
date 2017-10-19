function [fs,features] = featureSelection(training,label,NumFea)
%%
[a,b] = size(training);
features = zeros(a,NumFea);

c = cvpartition(label,'k',5);
opts = statset('display','iter');
%{
fun = @(XT,yT,Xt,yt)...
      (sum(abs(Xt*regress(XT,yT))));
%}

keep = false(b,1);
keep(1,1) = true();
keepout = false(b,1);
keepout(2,1) = true();

[fs,history] = sequentialfs(@regressTrain,training,label,'cv',c,'options',opts,'nfeatures', NumFea,'keepin',keep');
%%
[a,b] = size(fs);
counter = 1;

for i = 1 : b
    if(fs(1,i) ~= 0)
        features(:,counter) = training(:,i);
        counter = counter + 1;
    end
end

end

