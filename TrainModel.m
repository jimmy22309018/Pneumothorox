%{
filename = 'RightFeatures.xlsx';
RightFeatures = xlsread(filename);
filename = 'LeftFeatures.xlsx';
LeftFeatures = xlsread(filename);
%}
%% Label 1 Mean value -based
%{
    %% Training
[label,training,whMat] = labeling(RightFeatures);
label2 = double(cell2mat(label))-48;
[fs,features] = featureSelection2(training,label2,5);
[finaltrain,trainlabel] = dataBalance(features,label2);
    %% Right Lung
Nfea = getNewFea(fs,RightFeatures,whMat);
result = multisvm(finaltrain,trainlabel,Nfea);
figure, plot(label2);
figure, plot(result),ylim([0,5]);
    %% Left Lung
[label,training,whMat] = labeling(LeftFeatures);
label2 = double(cell2mat(label))-48;
Nfea = getNewFea(fs,LeftFeatures,whMat);
result2 = multisvm(finaltrain,trainlabel,Nfea);
figure, plot(label2);
figure, plot(result2),ylim([0,5]);
%}
%% Label 2 Index-based

    %% Training
[label,training,whMat] = labeling(RightFeatures);
label2 = double(cell2mat(label))-48;
count1 = sum(label2==1)
count2 = sum(label2==2)
count3 = sum(label2==3)
count4 = sum(label2==4)
figure, plot(label2),ylim([0,5]);
[fs,features] = featureSelection2(training,label2,10);
[finaltrain,trainlabel] = dataBalance(features,label2);
    %% Testing for right lung
Nfea = getNewFea(fs,RightFeatures,whMat);
result1 = multisvm(finaltrain,trainlabel,Nfea);

figure, plot(result1),ylim([0,5]);
    %% Testing for the left lung
[label3,training,whMat] = labeling(LeftFeatures);
label4 = double(cell2mat(label3))-48;
figure, plot(label4),ylim([0,5]);
Nfea = getNewFea(fs,LeftFeatures,whMat);
result2 = multisvm(finaltrain,trainlabel,Nfea);

figure, plot(result2),ylim([0,5]);





