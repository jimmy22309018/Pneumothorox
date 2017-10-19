function [stateGLCM,stateWavelet,stateDensity,stateScan,stateMiss,textureM,textureV,textureR,hisSum] = sliding(data, slice,mask,dis,upperBound,lowerBound,overlap,startP,endP)
[a,b,c] = size(data);

%% Slice length calculating temp: overlapping 1/2
if(overlap ==1)
    sliceLen = ceil(2*(endP-startP)/(slice+1))
else
    sliceLen = ceil((endP-startP)/(slice))
end
%%
textureV = zeros(slice,1);
textureM = zeros(slice,1);
textureR = zeros(slice,1);

%%
stateGLCM = ones(4,slice)*10;
stateDensity = zeros(slice,1);
stateWavelet = ones(2,15,slice)*10;
hisSum = zeros(sliceLen,1);
stateScan = zeros(2,slice);
stateMiss = zeros(2,slice);
%%
for i = 1 : slice
    if(overlap==1)
        s = round((i-1)*(sliceLen/2)+startP);
        t = s + sliceLen;
    else
        s = round((i-1)*(sliceLen)+startP);
        t = s + sliceLen;
    end

    partialData = data(50:150,:,s:t);
    partialMask = mask(50:150,:,s:t);
    

    [d] = density(partialData,partialMask);
    stateDensity(i,1) = d;
    
    [s1] = AllGLCM(partialData,partialMask,sliceLen,dis,upperBound,lowerBound);
    stateGLCM(1,i) = s1.Contrast;
    if(~isnan(s1.Correlation)) 
        stateGLCM(2,i) = s1.Correlation;
    else
        stateGLCM(2,i) = 0;
    end
    stateGLCM(3,i) = s1.Homogeneity;
    stateGLCM(4,i) = s1.Energy;
    
    hisSum(i,1) = sum(sum(sum(partialMask)));
    
    [s] = waveletFeature(partialData,partialMask);
    stateWavelet(:,:,i) = s;
    
    [stateMiss(1,i), stateMiss(2,i)]= missCount(partialData,partialMask);
    
    [v,m,r] = textureAnalyze(partialData,partialMask);
    textureV(i,1) = v;
    textureM(i,1) = m;
    textureR(i,1) = r;
    
    [stateScan(1,i), stateScan(2,i)] = linearScan(partialMask);
    

end

end

