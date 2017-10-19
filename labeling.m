function [label,training,whMat] = labeling(training)
[a,b] = size(training);
label = cell(a,1);
for i = 1 : a
    if(training(i,2) > -800)
        label{i,1} = '1';
   
    elseif(training(i,2) <= -800 && training(i,2) > -830)
        label{i,1} = '2';
         
    elseif(training(i,2) <= -830 && training(i,2) > -880)
        label{i,1} = '3';
    
    else
        label{i,1} = '4';
    end

end

[training, mu, invMat, whMat] = whiten(training);




end

