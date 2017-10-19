function [smoWavelet,smoDensity] = smoothing(stateWavelet,stateDensity,windowSize)
%%
[a,b,c,d] = size(stateWavelet);
smoWavelet = zeros(a,b,c,d);
smoDensity = stateDensity;

%%
for  k = 1 : d
    for j = 1 : b
        for i = 1 : a
            smoWavelet(i,j,:,k) = smoothts(stateWavelet(i,j,:,k),'b',windowSize);
        end
    end
    
    smoDensity(:,k) = smoothts(stateDensity(:,k),'b',windowSize);
end


end

