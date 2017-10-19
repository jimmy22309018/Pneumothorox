function [difWavelet,difDen] = differential(stateWavelet,stateDensity)
%%
%{
[a,b,c] = size(stateGLCM);
difGLCM = zeros(a,b-1,c);
%}
[a,b,c,d] = size(stateWavelet);
difWavelet = zeros(a,b,c,d);
[a,b] = size(stateDensity);
difDen = zeros(a,b);
%{
[a,b] = size(stateM);
difM = zeros(a-1,b);
difV = zeros(a-1,b);
difR = zeros(a-1,b);
%}
%%
for partial = 1 : 4
        %{
        difGLCM(1,:,partial) = diff(stateGLCM(1,:,partial));
        difGLCM(2,:,partial) = diff(stateGLCM(2,:,partial));
        difGLCM(3,:,partial) = diff(stateGLCM(3,:,partial));
        difGLCM(4,:,partial) = diff(stateGLCM(4,:,partial));
        
        difM(:,partial) = diff(stateM(:,partial));
        difV(:,partial) = diff(stateV(:,partial));
        difR(:,partial) = diff(stateR(:,partial));
        %}
       difDen(:,partial) = gradient(difDen(:,partial));
        for i = 1 : 15
            difWavelet(1,i,:,partial) = gradient(stateWavelet(1,i,:,partial));
            difWavelet(2,i,:,partial) = gradient(stateWavelet(2,i,:,partial));
            
        end
        
end    


end

