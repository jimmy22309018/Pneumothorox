function outputState(stateGLCM,stateWavelet,stateDensity,stateScan,stateMiss,stateM,stateV,stateR,slice)
%[a,slice,b] = size(stateGLCM);
fileID = fopen('Right1.txt','w');
x1 = ones(slice,4);
x2 = ones(slice,4);
x3 = ones(slice,4);
x4 = ones(slice,4);
x5 = ones(slice,4);
x6 = ones(slice,4);
x7 = ones(slice,4);
x8 = ones(slice,4);
x9 = ones(slice,4);
x10 = ones(slice,4);
energy = ones(15,slice,4);
entrophy = ones(15,slice,4);
stateGLCM(isnan(stateGLCM(:))) = 0 ;
stateWavelet(isnan(stateWavelet(:))) = 0;
stateM(isnan(stateM(:))) = 0;
stateV(isnan(stateV(:))) = 0;
stateR(isnan(stateR(:))) = 0;
%%

%[stateWavelet,stateDensity] = smoothing(stateWavelet,stateDensity,5);
%[stateWavelet,stateDensity] = differential(stateWavelet,stateDensity);



%%
for j = 1 : slice
    for partial = 1 : 4
        
        x1(j,partial) = stateGLCM(1,j,partial);
        x2(j,partial) = stateGLCM(2,j,partial);
        x3(j,partial) = stateGLCM(3,j,partial);
        x4(j,partial) = stateGLCM(4,j,partial);
        
        x5(j,partial) = stateM(j,partial);
        x6(j,partial) = stateV(j,partial);
        x7(j,partial) = stateR(j,partial);
        
        x8(j,partial) = stateScan(1,j,partial);
        x9(j,partial) = stateScan(2,j,partial);
        
        x10(j,partial) = stateDensity(j,partial);
        fprintf(fileID,' %f %f %f %f %f %f',x5(j,partial),x6(j,partial),x7(j,partial),x8(j,partial),x9(j,partial),x10(j,partial));
        
        for i = 1 : 15
            energy(i,j,partial) = stateWavelet(1,i,j,partial);
            entrophy(i,j,partial) = stateWavelet(2,i,j,partial);
            fprintf(fileID,'%f %f ',energy(i,j,partial),entrophy(i,j,partial));
        end
        fprintf(fileID,'\r\n');

    end
    fprintf(fileID,'\r\n');
end

%%
%{
figure(30),
subplot(2,2,1)
plot(x1(:,1))
title('1 Contrast')
subplot(2,2,2)
plot(x1(:,2))
title('2 Contrast')
subplot(2,2,3)
plot(x1(:,3))
title('3 Contrast')
subplot(2,2,4)
plot(x1(:,4))
title('4 Contrast')

figure(31),
subplot(2,2,1)
plot(x2(:,1))
title('1 Correlation')
subplot(2,2,2)
plot(x2(:,2))
title('2 Correlation')
subplot(2,2,3)
plot(x2(:,3))
title('3 Correaltion')
subplot(2,2,4)
plot(x2(:,4))
title('4 Correlation')

figure(32),
subplot(2,2,1)
plot(x3(:,1))
title('1 Homogeneity')
subplot(2,2,2)
plot(x3(:,2))
title('2 Homogeneity')
subplot(2,2,3)
plot(x3(:,3))
title('3 Homogeneity')
subplot(2,2,4)
plot(x3(:,4))
title('4 Homogeneity')

figure(33),
subplot(2,2,1)
plot(x4(:,1))
title('1 Energy')
subplot(2,2,2)
plot(x4(:,2))
title('2 Energy')
subplot(2,2,3)
plot(x4(:,3))
title('3 Energy')
subplot(2,2,4)
plot(x4(:,4))
title('4 Energy')
%}
%%    
%{
figure,
subplot(2,2,1)
plot(energy(1,1:slice,1))
title('energy LLL 1')
subplot(2,2,2)
plot(energy(1,1:slice,2))
title('energy LLL 2')
subplot(2,2,3)
plot(energy(1,1:slice,3))
title('energy LLL 3')
subplot(2,2,4)
plot(energy(1,1:slice,4))
title('energy LLL 4')

figure,
subplot(2,2,1)
plot(energy(2,1:slice,1))
title('energy 2 1')
subplot(2,2,2)
plot(energy(2,1:slice,2))
title('energy 2 2')
subplot(2,2,3)
plot(energy(2,1:slice,3))
title('energy 2 3')
subplot(2,2,4)
plot(energy(2,1:slice,4))
title('energy 2 4')

figure,
subplot(2,2,1)
plot(energy(3,1:slice,1))
title('energy 3 1')
subplot(2,2,2)
plot(energy(3,1:slice,2))
title('energy 3 2')
subplot(2,2,3)
plot(energy(3,1:slice,3))
title('energy 3 3')
subplot(2,2,4)
plot(energy(3,1:slice,4))
title('energy 3 4')

figure,
subplot(2,2,1)
plot(energy(4,1:slice,1))
title('energy 4 1')
subplot(2,2,2)
plot(energy(4,1:slice,2))
title('energy 4 2')
subplot(2,2,3)
plot(energy(4,1:slice,3))
title('energy 4 3')
subplot(2,2,4)
plot(energy(4,1:slice,4))
title('energy 4 4')

figure,
subplot(2,2,1)
plot(energy(5,1:slice,1))
title('energy 5 1')
subplot(2,2,2)
plot(energy(5,1:slice,2))
title('energy 5 2')
subplot(2,2,3)
plot(energy(5,1:slice,3))
title('energy 5 3')
subplot(2,2,4)
plot(energy(5,1:slice,4))
title('energy 5 4')

figure,
subplot(2,2,1)
plot(energy(6,1:slice,1))
title('energy 6 1')
subplot(2,2,2)
plot(energy(6,1:slice,2))
title('energy 6 2')
subplot(2,2,3)
plot(energy(6,1:slice,3))
title('energy 6 3')
subplot(2,2,4)
plot(energy(6,1:slice,4))
title('energy 6 4')

figure,
subplot(2,2,1)
plot(energy(7,1:slice,1))
title('energy 7 1')
subplot(2,2,2)
plot(energy(7,1:slice,2))
title('energy 7 2')
subplot(2,2,3)
plot(energy(7,1:slice,3))
title('energy 7 3')
subplot(2,2,4)
plot(energy(7,1:slice,4))
title('energy 7 4')

figure,
subplot(2,2,1)
plot(energy(8,1:slice,1))
title('energy Level2 HHH 1')
subplot(2,2,2)
plot(energy(8,1:slice,2))
title('energy Level2 HHH 2')
subplot(2,2,3)
plot(energy(8,1:slice,3))
title('energy Level2 HHH 3')
subplot(2,2,4)
plot(energy(8,1:slice,4))
title('energy Level2 HHH 4')

figure,
subplot(2,2,1)
plot(energy(9,1:slice,1))
title('energy 9 1')
subplot(2,2,2)
plot(energy(9,1:slice,2))
title('energy 9 2')
subplot(2,2,3)
plot(energy(9,1:slice,3))
title('energy 9 3')
subplot(2,2,4)
plot(energy(9,1:slice,4))
title('energy 9 4')

figure,
subplot(2,2,1)
plot(energy(10,1:slice,1))
title('energy 10 1')
subplot(2,2,2)
plot(energy(10,1:slice,2))
title('energy 10 2')
subplot(2,2,3)
plot(energy(10,1:slice,3))
title('energy 10 3')
subplot(2,2,4)
plot(energy(10,1:slice,4))
title('energy 10 4')

figure,
subplot(2,2,1)
plot(energy(11,1:slice,1))
title('energy 11 1')
subplot(2,2,2)
plot(energy(11,1:slice,2))
title('energy 11 2')
subplot(2,2,3)
plot(energy(11,1:slice,3))
title('energy 11 3')
subplot(2,2,4)
plot(energy(11,1:slice,4))
title('energy 11 4')

figure,
subplot(2,2,1)
plot(energy(12,1:slice,1))
title('energy 12 1')
subplot(2,2,2)
plot(energy(12,1:slice,2))
title('energy 12 2')
subplot(2,2,3)
plot(energy(12,1:slice,3))
title('energy 12 3')
subplot(2,2,4)
plot(energy(12,1:slice,4))
title('energy 12 4')

figure,
subplot(2,2,1)
plot(energy(13,1:slice,1))
title('energy 13 1')
subplot(2,2,2)
plot(energy(13,1:slice,2))
title('energy 13 2')
subplot(2,2,3)
plot(energy(13,1:slice,3))
title('energy 12 3')
subplot(2,2,4)
plot(energy(13,1:slice,4))
title('energy 13 4')

figure,
subplot(2,2,1)
plot(energy(14,1:slice,1))
title('energy 14 1')
subplot(2,2,2)
plot(energy(14,1:slice,2))
title('energy 14 2')
subplot(2,2,3)
plot(energy(14,1:slice,3))
title('energy 14 3')
subplot(2,2,4)
plot(energy(14,1:slice,4))
title('energy 14 4')

figure,
subplot(2,2,1)
plot(energy(15,1:slice,1))
title('energy Level1 HHH 1')
subplot(2,2,2)
plot(energy(15,1:slice,2))
title('energy Level1 HHH 2')
subplot(2,2,3)
plot(energy(15,1:slice,3))
title('energy Level1 HHH 3')
subplot(2,2,4)
plot(energy(15,1:slice,4))
title('energy Level1 HHH 4')



figure,
subplot(2,2,1)
plot(stateDensity(1:slice,1))
title('Density 1')
subplot(2,2,2)
plot(stateDensity(1:slice,2))
title('Density 2')
subplot(2,2,3)
plot(stateDensity(1:slice,3))
title('Density 3')
subplot(2,2,4)
plot(stateDensity(1:slice,4))
title('Density 4')



figure,
subplot(2,2,1)
plot(entrophy(1,1:slice,1))
title('entrophy LLL 1')
subplot(2,2,2)
plot(entrophy(1,1:slice,2))
title('entrophy LLL 2')
subplot(2,2,3)
plot(entrophy(1,1:slice,3))
title('entrophy LLL 3')
subplot(2,2,4)
plot(entrophy(1,1:slice,4))
title('entrophy LLL 4')

figure,
subplot(2,2,1)
plot(entrophy(2,1:slice,1))
title('entrophy 2 1')
subplot(2,2,2)
plot(entrophy(2,1:slice,2))
title('entrophy 2 2')
subplot(2,2,3)
plot(entrophy(2,1:slice,3))
title('entrophy 2 3')
subplot(2,2,4)
plot(entrophy(2,1:slice,4))
title('entrophy 2 4')

figure,
subplot(2,2,1)
plot(entrophy(3,1:slice,1))
title('entrophy 3 1')
subplot(2,2,2)
plot(entrophy(3,1:slice,2))
title('entrophy 3 2')
subplot(2,2,3)
plot(entrophy(3,1:slice,3))
title('entrophy 3 3')
subplot(2,2,4)
plot(entrophy(3,1:slice,4))
title('entrophy 3 4')

figure,
subplot(2,2,1)
plot(entrophy(4,1:slice,1))
title('entrophy 4 1')
subplot(2,2,2)
plot(entrophy(4,1:slice,2))
title('entrophy 4 2')
subplot(2,2,3)
plot(entrophy(4,1:slice,3))
title('entrophy 4 3')
subplot(2,2,4)
plot(entrophy(4,1:slice,4))
title('entrophy 4 4')

figure,
subplot(2,2,1)
plot(entrophy(5,1:slice,1))
title('entrophy 5 1')
subplot(2,2,2)
plot(entrophy(5,1:slice,2))
title('entrophy 5 2')
subplot(2,2,3)
plot(entrophy(5,1:slice,3))
title('entrophy 5 3')
subplot(2,2,4)
plot(entrophy(5,1:slice,4))
title('entrophy 5 4')

figure,
subplot(2,2,1)
plot(entrophy(6,1:slice,1))
title('entrophy 6 1')
subplot(2,2,2)
plot(entrophy(6,1:slice,2))
title('entrophy 6 2')
subplot(2,2,3)
plot(entrophy(6,1:slice,3))
title('entrophy 6 3')
subplot(2,2,4)
plot(entrophy(6,1:slice,4))
title('entrophy 6 4')

figure,
subplot(2,2,1)
plot(entrophy(7,1:slice,1))
title('entrophy 7 1')
subplot(2,2,2)
plot(entrophy(7,1:slice,2))
title('entrophy 7 2')
subplot(2,2,3)
plot(entrophy(7,1:slice,3))
title('entrophy 7 3')
subplot(2,2,4)
plot(entrophy(7,1:slice,4))
title('entrophy 7 4')

figure,
subplot(2,2,1)
plot(entrophy(8,1:slice,1))
title('entrophy Level2 HHH 1')
subplot(2,2,2)
plot(entrophy(8,1:slice,2))
title('entrophy Level2 HHH 2')
subplot(2,2,3)
plot(entrophy(8,1:slice,3))
title('entrophy Level2 HHH 3')
subplot(2,2,4)
plot(entrophy(8,1:slice,4))
title('entrophy Level2 HHH 4')

figure,
subplot(2,2,1)
plot(entrophy(9,1:slice,1))
title('entrophy 9 1')
subplot(2,2,2)
plot(entrophy(9,1:slice,2))
title('entrophy 9 2')
subplot(2,2,3)
plot(entrophy(9,1:slice,3))
title('entrophy 9 3')
subplot(2,2,4)
plot(entrophy(9,1:slice,4))
title('entrophy 9 4')

figure,
subplot(2,2,1)
plot(entrophy(10,1:slice,1))
title('entrophy 10 1')
subplot(2,2,2)
plot(entrophy(10,1:slice,2))
title('entrophy 10 2')
subplot(2,2,3)
plot(entrophy(10,1:slice,3))
title('entrophy 10 3')
subplot(2,2,4)
plot(entrophy(10,1:slice,4))
title('entrophy 10 4')

figure,
subplot(2,2,1)
plot(entrophy(11,1:slice,1))
title('entrophy 11 1')
subplot(2,2,2)
plot(entrophy(11,1:slice,2))
title('entrophy 11 2')
subplot(2,2,3)
plot(entrophy(11,1:slice,3))
title('entrophy 11 3')
subplot(2,2,4)
plot(entrophy(11,1:slice,4))
title('entrophy 11 4')

figure,
subplot(2,2,1)
plot(entrophy(12,1:slice,1))
title('entrophy 12 1')
subplot(2,2,2)
plot(entrophy(12,1:slice,2))
title('entrophy 12 2')
subplot(2,2,3)
plot(entrophy(12,1:slice,3))
title('entrophy 12 3')
subplot(2,2,4)
plot(entrophy(12,1:slice,4))
title('entrophy 12 4')

figure,
subplot(2,2,1)
plot(entrophy(13,1:slice,1))
title('entrophy 13 1')
subplot(2,2,2)
plot(entrophy(13,1:slice,2))
title('entrophy 13 2')
subplot(2,2,3)
plot(entrophy(13,1:slice,3))
title('entrophy 12 3')
subplot(2,2,4)
plot(entrophy(13,1:slice,4))
title('entrophy 13 4')

figure,
subplot(2,2,1)
plot(entrophy(14,1:slice,1))
title('entrophy 14 1')
subplot(2,2,2)
plot(entrophy(14,1:slice,2))
title('entrophy 14 2')
subplot(2,2,3)
plot(entrophy(14,1:slice,3))
title('entrophy 14 3')
subplot(2,2,4)
plot(entrophy(14,1:slice,4))
title('entrophy 14 4')

figure,
subplot(2,2,1)
plot(entrophy(15,1:slice,1))
title('entrophy Level1 HHH 1')
subplot(2,2,2)
plot(entrophy(15,1:slice,2))
title('entrophy Level1 HHH 2')
subplot(2,2,3)
plot(entrophy(15,1:slice,3))
title('entrophy Level1 HHH 3')
subplot(2,2,4)
plot(entrophy(15,1:slice,4))
title('entrophy Level1 HHH 4')
%}



figure(50),
subplot(2,2,1)
plot(x5(:,1))
ylim([-900 -700])
title('1 M')
subplot(2,2,2)
plot(x5(:,2))
ylim([-900 -700])
title('2 M')
subplot(2,2,3)
plot(x5(:,3))
ylim([-900 -700])
title('3 M')
subplot(2,2,4)
plot(x5(:,4))
ylim([-900 -700])
title('4 M')

%{
figure(51),
subplot(2,2,1)
plot(x6(:,1))
title('1 V')
subplot(2,2,2)
plot(x6(:,2))
title('2 V')
subplot(2,2,3)
plot(x6(:,3))
title('3 V')
subplot(2,2,4)
plot(x6(:,4))
title('4 V')
%}
%{
figure(52),
subplot(2,2,1)
plot(x7(:,1))
title('1 R')
subplot(2,2,2)
plot(x7(:,2))
title('2 R')
subplot(2,2,3)
plot(x7(:,3))
title('3 R')
subplot(2,2,4)
plot(x7(:,4))
title('4 R')
%}
%{
figure, 
subplot(2,2,1)
plot(stateScan(1,1:slice,1))
title('Row Scan Part 1')
subplot(2,2,2)
plot(stateScan(1,1:slice,2))
title('Row Scan Part 2')
subplot(2,2,3)
plot(stateScan(1,1:slice,3))
title('Row Scan Part 3')
subplot(2,2,4)
plot(stateScan(1,1:slice,4))
title('Row Scan Part 4')

figure, 
subplot(2,2,1)
plot(stateScan(2,1:slice,1))
title('Column Scan Part 1')
subplot(2,2,2)
plot(stateScan(2,1:slice,2))
title('Column Scan Part 2')
subplot(2,2,3)
plot(stateScan(2,1:slice,3))
title('Column Scan Part 3')
subplot(2,2,4)
plot(stateScan(2,1:slice,4))
title('Column Scan Part 4')
%}
X = 0;
Y = 0.5;
figure,
subplot(2,2,1)
plot(stateMiss(1,1:slice,1))
ylim([X Y])
title('AIR Miss 1')
subplot(2,2,2)
plot(stateMiss(1,1:slice,2))
ylim([X Y])
title('AIR Miss 2')
subplot(2,2,3)
plot(stateMiss(1,1:slice,3))
ylim([X Y])
title('AIR Miss 3')
subplot(2,2,4)
plot(stateMiss(1,1:slice,4))
ylim([X Y])
title('AIR Miss 4')

X = 0;
Y = 0.08;
figure,
subplot(2,2,1)
plot(stateMiss(2,1:slice,1))
ylim([X Y])
title('outside Miss 1')
subplot(2,2,2)
plot(stateMiss(2,1:slice,2))
ylim([X Y])
title('outside Miss 2')
subplot(2,2,3)
plot(stateMiss(2,1:slice,3))
ylim([X Y])
title('outside Miss 3')
subplot(2,2,4)
plot(stateMiss(2,1:slice,4))
ylim([X Y])
title('outside Miss 4')

fclose(fileID);
end

