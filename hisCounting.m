function [his1,his2] = hisCounting(rawMri,mask1,mask2,start)
[a,b,c] = size(mask1);
mini = min(rawMri(:))
maxi = max(rawMri(:));
rawMri = int16(rawMri - mini);
dataHis = zeros(1,maxi- mini+1);
count = 0;

for i = 1 : a
    for j = 1 : b
        for k = 1 : c
            if(mask2(i,j,k) >0)
                count = count + 1;
                s = rawMri(i,j,k)+1;
                dataHis(s) = dataHis(s) +1;
            end
        end
    end
end

figure, plot(dataHis), title('Total His');

c = 150;
his1 = zeros(1,c);
his2 = zeros(1,c);

for i = 1 : c
    his1(1,i) = sum(sum(mask1(:,:,i)));
    his2(1,i) = sum(sum(mask2(:,:,i)));
end
figure, plot(his1),title('Top 150 His1 MaskAll');
figure, plot(his2),title('Top 150 His2 MaskRing');

pdataHis = zeros(1,maxi- mini+1);
count = 0;
for i = 1 : a
    for j = 1 : b
        for k = 1 : 300
            if(mask2(i,j,k) >0)
                count = count + 1;
                s = rawMri(i,j,k)+1;
                pdataHis(s) = pdataHis(s) +1;
            end
        end
    end
end

figure, plot(pdataHis), title('Partial His');


end

