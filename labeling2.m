function [label,training,whMat] = labeling2(training)
[a,~] = size(training);
label = cell(a,1);

for i = 1 : a
    if(training(i,1) < 0.01)
        label{i,1} = '1';
   
    elseif(training(i,1) >= 0.01 && training(i,1) < 0.015)
        label{i,1} = '2';
         
    elseif(training(i,1) >= 0.015 && training(i,1) < 0.04)
        label{i,1} = '3';
    
    else
        label{i,1} = '4';
    end

end

[training, mu, invMat, whMat] = whiten(training);




end

