function [hisMri,rawMri] = cutMri(inMri,len,lowerBound )
%%
rawMri = zeros(300,430,len);
hisMri = zeros(300,430,len);


%%

for row = 1 : 300
    for column = 1 : 430
        for height = 1 : len
            
            temp = inMri(row+110,column+40,height);
            %{
            if(temp>-500)
                rawMri(row,column,height) = -500;
           
            elseif (temp<lowerBound)
                rawMri(row,column,height) = lowerBound;
            else
                rawMri(row,column,height) = inMri(row+110,column+40,height);
            end
            %}
            rawMri(row,column,height) = inMri(row+110,column+40,height);
        end
    end
end


%%


[a,b,c] = size(rawMri);
for temp = 1 : len
    for i = 1 : a
        for j = 1 : b
            if(rawMri(i,j,temp) <-500 && rawMri(i,j,temp)>-1000)
                hisMri(i,j,temp) = 1;
            else
                hisMri(i,j,temp) = 0;
            end
        end
    end
end
%%

a = round(len/60);
figure, 
subplot(2,4,1),imshow(hisMri(:,:,a));
subplot(2,4,2),imshow(hisMri(:,:,2*a));
subplot(2,4,3),imshow(hisMri(:,:,3*a));
subplot(2,4,4),imshow(hisMri(:,:,4*a));
subplot(2,4,5),imshow(hisMri(:,:,5*a));
subplot(2,4,6),imshow(hisMri(:,:,6*a));
subplot(2,4,7),imshow(hisMri(:,:,7*a));
subplot(2,4,8),imshow(hisMri(:,:,8*a));

figure, 
subplot(2,4,1),imshow(hisMri(:,:,9*a));
subplot(2,4,2),imshow(hisMri(:,:,10*a));
subplot(2,4,3),imshow(hisMri(:,:,11*a));
subplot(2,4,4),imshow(hisMri(:,:,12*a));
subplot(2,4,5),imshow(hisMri(:,:,13*a));
subplot(2,4,6),imshow(hisMri(:,:,14*a));
subplot(2,4,7),imshow(hisMri(:,:,15*a));
subplot(2,4,8),imshow(hisMri(:,:,16*a));

figure, 
subplot(2,4,1),imshow(hisMri(:,:,17*a));
subplot(2,4,2),imshow(hisMri(:,:,18*a));
subplot(2,4,3),imshow(hisMri(:,:,19*a));
subplot(2,4,4),imshow(hisMri(:,:,20*a));
subplot(2,4,5),imshow(hisMri(:,:,21*a));
subplot(2,4,6),imshow(hisMri(:,:,22*a));
subplot(2,4,7),imshow(hisMri(:,:,23*a));
subplot(2,4,8),imshow(hisMri(:,:,24*a));

figure, 
subplot(2,4,1),imshow(hisMri(:,:,25*a));
subplot(2,4,2),imshow(hisMri(:,:,26*a));
subplot(2,4,3),imshow(hisMri(:,:,27*a));
subplot(2,4,4),imshow(hisMri(:,:,28*a));
subplot(2,4,5),imshow(hisMri(:,:,29*a));
subplot(2,4,6),imshow(hisMri(:,:,30*a));
subplot(2,4,7),imshow(hisMri(:,:,31*a));
subplot(2,4,8),imshow(hisMri(:,:,32*a));

figure, 
subplot(2,4,1),imshow(hisMri(:,:,33*a));
subplot(2,4,2),imshow(hisMri(:,:,34*a));
subplot(2,4,3),imshow(hisMri(:,:,35*a));
subplot(2,4,4),imshow(hisMri(:,:,36*a));
subplot(2,4,5),imshow(hisMri(:,:,37*a));
subplot(2,4,6),imshow(hisMri(:,:,38*a));
subplot(2,4,7),imshow(hisMri(:,:,39*a));
subplot(2,4,8),imshow(hisMri(:,:,40*a));

figure, 
subplot(2,4,1),imshow(hisMri(:,:,41*a));
subplot(2,4,2),imshow(hisMri(:,:,42*a));
subplot(2,4,3),imshow(hisMri(:,:,43*a));
subplot(2,4,4),imshow(hisMri(:,:,44*a));
subplot(2,4,5),imshow(hisMri(:,:,45*a));
subplot(2,4,6),imshow(hisMri(:,:,46*a));
subplot(2,4,7),imshow(hisMri(:,:,47*a));
subplot(2,4,8),imshow(hisMri(:,:,48*a));

end

