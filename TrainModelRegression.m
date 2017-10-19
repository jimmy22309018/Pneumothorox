 %% Training
 %{
[label,training,whMat] = labeling2(RightFeatures);
label2 = double(cell2mat(label))-48;

%%
[fs,features] = featureSelection(training,label2,10);
[finaltrain,trainlabel] = dataBalance(features,label2);
b = regress(trainlabel,finaltrain);
%}
    %% CHENG Left Lung
[label3,~,~] = labeling(CHENGL);
label4 = double(cell2mat(label3))-48;
Nfea = getNewFea(fs,CHENGL,whMat);
result2 = Nfea *b;
figure, 

subplot(2,1,1),plot(label4),ylim([0,5]),title('CHENGL HAVE N');
lin1 = standardize(smooth(smooth(smooth(result2))));
subplot(2,1,2),plot(lin1),ylim([0,5]);

%% CHENG Right Lung
[label3,~,~] = labeling(CHENGR);
label4 = double(cell2mat(label3))-48;
Nfea = getNewFea(fs,CHENGR,whMat);
result2 = Nfea *b;
figure, 
subplot(2,1,1),plot(label4),ylim([0,5]),title('CHENGR HAVE Y');
lin2 = standardize(smooth(smooth(smooth(result2))));
subplot(2,1,2),plot(lin2,'g'),ylim([0,5]);


%% HSU Left Lung
[label3,~,~] = labeling(HSUL);
label4 = double(cell2mat(label3))-48;
Nfea = getNewFea(fs,HSUL,whMat);
result2 = Nfea *b;
figure, 
subplot(2,1,1),plot(label4),ylim([0,5]),title('HSUL HAVE N');
lin3 = standardize(smooth(smooth(smooth(result2))));
subplot(2,1,2),plot(lin3),ylim([0,5]);

    %% HSU Right Lung
[label3,~,~] = labeling(HSUR);
label4 = double(cell2mat(label3))-48;
Nfea = getNewFea(fs,HSUR,whMat);
result2 = Nfea *b;
figure, 
subplot(2,1,1),plot(label4),ylim([0,5]),title('HSUR HAVE Y');
lin4 = standardize(smooth(smooth(smooth(result2))));
subplot(2,1,2),plot(lin4,'g'),ylim([0,5]);
    %% CHU Left Lung
[label3,~,~] = labeling(CHUL);
label4 = double(cell2mat(label3))-48;
Nfea = getNewFea(fs,CHUL,whMat);
result2 = Nfea *b;
figure, 
subplot(2,1,1),plot(label4),ylim([0,5]),title('CHUL DONT');
lin5 = standardize(smooth(smooth(smooth(result2))));
subplot(2,1,2),plot(lin5),ylim([0,5]);


%% TSENG Left Lung
[label3,~,~] = labeling(TSENGL);
label4 = double(cell2mat(label3))-48;
Nfea = getNewFea(fs,TSENGL,whMat);
result2 = Nfea *b;
figure, 
subplot(2,1,1),plot(label4),ylim([0,5]),title('TSENGL HAVE N');
lin8 = standardize(smooth(smooth(smooth(result2))));
subplot(2,1,2),plot(lin8),ylim([0,5]);
%% TSENGR Right Lung
[label3,~,~] = labeling(TSENGR);
label4 = double(cell2mat(label3))-48;
Nfea = getNewFea(fs,TSENGR,whMat);
result2 = Nfea *b;
figure, 
subplot(2,1,1),plot(label4),ylim([0,5]),title('TSENGR HAVE A Little');
lin9 = standardize(smooth(smooth(smooth(result2))));
subplot(2,1,2),plot(lin9),ylim([0,5]);
%% Liu Left Lung
[label3,~,~] = labeling(LIUL);
label4 = double(cell2mat(label3))-48;
Nfea = getNewFea(fs,LIUR,whMat);
result2 = Nfea *b;
figure, 
subplot(2,1,1),plot(label4),ylim([0,5]),title('LIUL HAVE N');
lin10 = standardize(smooth(smooth(smooth(result2))));
subplot(2,1,2),plot(lin10),ylim([0,5]);
%% LIU Right Lung
[label3,~,~] = labeling(LIUR);
label4 = double(cell2mat(label3))-48;
Nfea = getNewFea(fs,LIUR,whMat);
result2 = Nfea *b;
figure, 
subplot(2,1,1),plot(label4),ylim([0,5]),title('LIUR HAVE N');
lin11 = standardize(smooth(smooth(smooth(result2))));
subplot(2,1,2),plot(lin11),ylim([0,5]);
%%
figure, 
plot(lin1,'r'),ylim([0 5]),hold on
plot(lin2,'g'),ylim([0 5]),hold on
plot(lin3,'r'),ylim([0 5]),hold on
plot(lin4,'g'),ylim([0 5]),hold on
plot(lin5,'b'),ylim([0 5]),hold on
plot(lin8,'r'),ylim([0 5]),hold on
plot(lin9,'r'),ylim([0 5]),hold on
plot(lin10,'r'),ylim([0 5]),hold on
plot(lin11,'r'),ylim([0 5]),hold on