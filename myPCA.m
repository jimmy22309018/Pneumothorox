%M = importdata('Right.txt');
M = R1(:,2:34);
fileID =  'pca.xlsx';
K = 10;

[coeff,score,latent]  = pca(M,'NumComponents',K);
[a,b] = size(M);
newM = zeros(a,K);

for i = 1 : a
    t = M(i,:);
    newM(i,:) = (t*coeff);
end

xlswrite(fileID,newM);
%fclose(fileID);
    