function [maskAll] = masking( hisMri,len,esophagus,width)
[a,b,c] = size(hisMri);
maskAll = zeros(a,b,c);
se = strel('disk',7);
seN = strel('disk',width);
%%
for i = 1 : len
    binaryImage = hisMri(:,:,i);
    %figure,imshow(binaryImage),title('Begin');
%% Border adding
    binaryImage(:,1:3) = 1;
    binaryImage(:,end-2:end) = 1;
    binaryImage(1:3,:) = 1;
    binaryImage(end-2:end,:) = 1;
    %figure,imshow(binaryImage),title('border');
%% Clean
    binaryImage = imdilate(binaryImage,se);
    %figure,imshow(binaryImage),title('Dialte');
    
    binaryImage = imclearborder(binaryImage,8);
    %figure,imshow(binaryImage),title('Imclearborder');
    
    binaryImage = imerode(binaryImage,se);
    %figure,imshow(binaryImage),title('Erode');

    binaryImage = binaryImage & hisMri(:,:,i);
%%
    %%binaryImage = fillSmallHoles(binaryImage);

%% 
   
    maskAll(:,:,i) = binaryImage;
    %figure,imshow(maskAll(:,:,i)),title('Final');
 
end
%%
[maskAll] = detectingEsophagus(esophagus,maskAll);

%%

a = round(len/60);
figure, 
subplot(2,4,1),imshow(maskAll(:,:,a));
subplot(2,4,2),imshow(maskAll(:,:,2*a));
subplot(2,4,3),imshow(maskAll(:,:,3*a));
subplot(2,4,4),imshow(maskAll(:,:,4*a));
subplot(2,4,5),imshow(maskAll(:,:,5*a));
subplot(2,4,6),imshow(maskAll(:,:,6*a));
subplot(2,4,7),imshow(maskAll(:,:,7*a));
subplot(2,4,8),imshow(maskAll(:,:,8*a));

figure, 
subplot(2,4,1),imshow(maskAll(:,:,9*a));
subplot(2,4,2),imshow(maskAll(:,:,10*a));
subplot(2,4,3),imshow(maskAll(:,:,11*a));
subplot(2,4,4),imshow(maskAll(:,:,12*a));
subplot(2,4,5),imshow(maskAll(:,:,13*a));
subplot(2,4,6),imshow(maskAll(:,:,14*a));
subplot(2,4,7),imshow(maskAll(:,:,15*a));
subplot(2,4,8),imshow(maskAll(:,:,16*a));


figure, 
subplot(2,4,1),imshow(maskAll(:,:,17*a));
subplot(2,4,2),imshow(maskAll(:,:,18*a));
subplot(2,4,3),imshow(maskAll(:,:,19*a));
subplot(2,4,4),imshow(maskAll(:,:,20*a));
subplot(2,4,5),imshow(maskAll(:,:,21*a));
subplot(2,4,6),imshow(maskAll(:,:,22*a));
subplot(2,4,7),imshow(maskAll(:,:,23*a));
subplot(2,4,8),imshow(maskAll(:,:,24*a));

figure, 
subplot(2,4,1),imshow(maskAll(:,:,25*a));
subplot(2,4,2),imshow(maskAll(:,:,26*a));
subplot(2,4,3),imshow(maskAll(:,:,27*a));
subplot(2,4,4),imshow(maskAll(:,:,28*a));
subplot(2,4,5),imshow(maskAll(:,:,29*a));
subplot(2,4,6),imshow(maskAll(:,:,30*a));
subplot(2,4,7),imshow(maskAll(:,:,31*a));
subplot(2,4,8),imshow(maskAll(:,:,32*a));

figure, 
subplot(2,4,1),imshow(maskAll(:,:,33*a));
subplot(2,4,2),imshow(maskAll(:,:,34*a));
subplot(2,4,3),imshow(maskAll(:,:,35*a));
subplot(2,4,4),imshow(maskAll(:,:,36*a));
subplot(2,4,5),imshow(maskAll(:,:,37*a));
subplot(2,4,6),imshow(maskAll(:,:,38*a));
subplot(2,4,7),imshow(maskAll(:,:,39*a));
subplot(2,4,8),imshow(maskAll(:,:,40*a));

figure, 
subplot(2,4,1),imshow(maskAll(:,:,41*a));
subplot(2,4,2),imshow(maskAll(:,:,42*a));
subplot(2,4,3),imshow(maskAll(:,:,43*a));
subplot(2,4,4),imshow(maskAll(:,:,44*a));
subplot(2,4,5),imshow(maskAll(:,:,45*a));
subplot(2,4,6),imshow(maskAll(:,:,46*a));
subplot(2,4,7),imshow(maskAll(:,:,47*a));
subplot(2,4,8),imshow(maskAll(:,:,48*a));

end