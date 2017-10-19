function outputXLSX(Density,Wavelet,M,V,R,Scan,Miss,stateGLCM,part,slice)
%% Parameters setteing

if(part ==1)
    filename = 'LeftFeatures.xlsx';
else
    filename = 'RightFeatures.xlsx';
end
%%
label = zeros(slice,1);
for i = 1 : slice
    
    if(Density(i,1)>=-780)
        label(i,1) = 0;
    elseif(Density(i,1)<-780 && Density(i,1) >= -800)
        label(i,1) = 1;
    elseif(Density(i,1)<-800 && Density(i,1) >= -840)
        label(i,1) = 2;
    else
        label(i,1) = 3;
    end

end
%% 
Energy = Wavelet(1,:,:);
Energy = reshape(Energy,[15,300]);
Entropy = Wavelet(2,:,:);
Entropy = reshape(Entropy,[15,300]);
row = Scan(1,:);
row = reshape(row,[300,1]);
column = Scan(2,:);
column = reshape(column,[300,1]);
Air = Miss(1,:);
Air = reshape(Air,[300,1]);
%%
Con = stateGLCM(1,:);
Con = reshape(Con,[300,1]);
Corr = stateGLCM(2,:);
Corr = reshape(Corr,[300,1]);
Homo = stateGLCM(3,:);
Homo = reshape(Homo,[300,1]);
Ener = stateGLCM(4,:);
Ener = reshape(Ener,[300,1]);
%%

vector = [Air(1:slice,1),M(1:slice,1),V(1:slice,1),row(1:slice,1),column(1:slice,1),Con(1:slice,1),Corr(1:slice,1),Homo(1:slice,1),Ener(1:slice,1)];


for i = 1 : 15
   vector = [vector, Energy(i,1:slice)']; 
end
for i = 1 : 15
   vector = [vector, Entropy(i,1:slice)']; 
end
%%
xlswrite(filename,vector);
end

