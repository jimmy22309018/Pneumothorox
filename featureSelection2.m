function [fs,features] = featureSelection2(training,label,NumFea)
%%
[a,b] = size(training);
features = zeros(a,NumFea);

c = cvpartition(label,'k',2);
opts = statset('display','iter');

fun = @(XT,yT,Xt,yt)...
      (sum(abs((yt-multisvm(XT,yT,Xt))).*abs((yt-multisvm(XT,yT,Xt)))));
  
keep = false(b,1);
keep(1,1) = true();
[fs,history] = sequentialfs(fun,training,label,'cv',c,'options',opts,'nfeatures', NumFea);
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

