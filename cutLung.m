function [left,right] = cutLung(mask,width,leftmode,rightmode,leftBorder,rightBorder,l,r,threshold)
%%
[a,b,c] = size(mask);

left = mask(:,1: round(b/2)+8,:);
right = mask(:,round(b/2)+9:end,:);
%%
seL = strel('disk',leftBorder);
seR = strel('disk',rightBorder);
for i = 1 : c
    L = imerode(left(:,:,i),seL);
    L = fillBigHoles(L);
    left(:,:,i) = imdilate(L,seL);
    
    R = imerode(right(:,:,i),seR);
    R = fillBigHoles(R);
    right(:,:,i) = imdilate(R,seR);
end

%%
D = ceil(width * leftmode);
[D width-D]
leftD = strel('disk',D);
leftE = strel('disk',width-D);


D2 = ceil(width * rightmode);
[D2 width-D2]
rightD = strel('disk',D2);
rightE = strel('disk',width-D2);

for i = 1 : c
    left(:,:,i) = imdilate(left(:,:,i),leftD) - imerode(left(:,:,i),leftE);
    right(:,:,i) = imdilate(right(:,:,i),rightD) - imerode(right(:,:,i),rightE);
end

%%

for i = 1 : c
    if(l==1)
        left(:,:,i) = convexBorder(left(:,:,i),threshold);
        left(:,:,i) = bwareaopen(left(:,:,i),round(sum(sum((left(:,:,i))))/3));
    end
    if(r==1)
        right(:,:,i) = convexBorder(right(:,:,i),threshold);
        right(:,:,i) = bwareaopen(right(:,:,i),round(sum(sum((right(:,:,i))))/3));
    end
end

%%
a = round(c/60)

figure, 
subplot(2,4,1),imshow(left(:,:,a));
subplot(2,4,2),imshow(left(:,:,2*a));
subplot(2,4,3),imshow(left(:,:,3*a));
subplot(2,4,4),imshow(left(:,:,4*a));
subplot(2,4,5),imshow(left(:,:,5*a));
subplot(2,4,6),imshow(left(:,:,6*a));
subplot(2,4,7),imshow(left(:,:,7*a));
subplot(2,4,8),imshow(left(:,:,8*a));

figure, 
subplot(2,4,1),imshow(left(:,:,9*a));
subplot(2,4,2),imshow(left(:,:,10*a));
subplot(2,4,3),imshow(left(:,:,11*a));
subplot(2,4,4),imshow(left(:,:,12*a));
subplot(2,4,5),imshow(left(:,:,13*a));
subplot(2,4,6),imshow(left(:,:,14*a));
subplot(2,4,7),imshow(left(:,:,15*a));
subplot(2,4,8),imshow(left(:,:,16*a));


figure, 
subplot(2,4,1),imshow(left(:,:,17*a));
subplot(2,4,2),imshow(left(:,:,18*a));
subplot(2,4,3),imshow(left(:,:,19*a));
subplot(2,4,4),imshow(left(:,:,20*a));
subplot(2,4,5),imshow(left(:,:,21*a));
subplot(2,4,6),imshow(left(:,:,22*a));
subplot(2,4,7),imshow(left(:,:,23*a));
subplot(2,4,8),imshow(left(:,:,24*a));

figure, 
subplot(2,4,1),imshow(left(:,:,25*a));
subplot(2,4,2),imshow(left(:,:,26*a));
subplot(2,4,3),imshow(left(:,:,27*a));
subplot(2,4,4),imshow(left(:,:,28*a));
subplot(2,4,5),imshow(left(:,:,29*a));
subplot(2,4,6),imshow(left(:,:,30*a));
subplot(2,4,7),imshow(left(:,:,31*a));
subplot(2,4,8),imshow(left(:,:,32*a));

figure, 
subplot(2,4,1),imshow(left(:,:,33*a));
subplot(2,4,2),imshow(left(:,:,34*a));
subplot(2,4,3),imshow(left(:,:,35*a));
subplot(2,4,4),imshow(left(:,:,36*a));
subplot(2,4,5),imshow(left(:,:,37*a));
subplot(2,4,6),imshow(left(:,:,38*a));
subplot(2,4,7),imshow(left(:,:,39*a));
subplot(2,4,8),imshow(left(:,:,40*a));
figure, 
subplot(2,4,1),imshow(left(:,:,41*a));
subplot(2,4,2),imshow(left(:,:,42*a));
subplot(2,4,3),imshow(left(:,:,43*a));
subplot(2,4,4),imshow(left(:,:,44*a));
subplot(2,4,5),imshow(left(:,:,45*a));
subplot(2,4,6),imshow(left(:,:,46*a));
subplot(2,4,7),imshow(left(:,:,47*a));
subplot(2,4,8),imshow(left(:,:,48*a));
%%

figure, 
subplot(2,4,1),imshow(right(:,:,a));
subplot(2,4,2),imshow(right(:,:,2*a));
subplot(2,4,3),imshow(right(:,:,3*a));
subplot(2,4,4),imshow(right(:,:,4*a));
subplot(2,4,5),imshow(right(:,:,5*a));
subplot(2,4,6),imshow(right(:,:,6*a));
subplot(2,4,7),imshow(right(:,:,7*a));
subplot(2,4,8),imshow(right(:,:,8*a));

figure, 
subplot(2,4,1),imshow(right(:,:,9*a));
subplot(2,4,2),imshow(right(:,:,10*a));
subplot(2,4,3),imshow(right(:,:,11*a));
subplot(2,4,4),imshow(right(:,:,12*a));
subplot(2,4,5),imshow(right(:,:,13*a));
subplot(2,4,6),imshow(right(:,:,14*a));
subplot(2,4,7),imshow(right(:,:,15*a));
subplot(2,4,8),imshow(right(:,:,16*a));


figure, 
subplot(2,4,1),imshow(right(:,:,17*a));
subplot(2,4,2),imshow(right(:,:,18*a));
subplot(2,4,3),imshow(right(:,:,19*a));
subplot(2,4,4),imshow(right(:,:,20*a));
subplot(2,4,5),imshow(right(:,:,21*a));
subplot(2,4,6),imshow(right(:,:,22*a));
subplot(2,4,7),imshow(right(:,:,23*a));
subplot(2,4,8),imshow(right(:,:,24*a));

figure, 
subplot(2,4,1),imshow(right(:,:,25*a));
subplot(2,4,2),imshow(right(:,:,26*a));
subplot(2,4,3),imshow(right(:,:,27*a));
subplot(2,4,4),imshow(right(:,:,28*a));
subplot(2,4,5),imshow(right(:,:,29*a));
subplot(2,4,6),imshow(right(:,:,30*a));
subplot(2,4,7),imshow(right(:,:,31*a));
subplot(2,4,8),imshow(right(:,:,32*a));

figure, 
subplot(2,4,1),imshow(right(:,:,33*a));
subplot(2,4,2),imshow(right(:,:,34*a));
subplot(2,4,3),imshow(right(:,:,35*a));
subplot(2,4,4),imshow(right(:,:,36*a));
subplot(2,4,5),imshow(right(:,:,37*a));
subplot(2,4,6),imshow(right(:,:,38*a));
subplot(2,4,7),imshow(right(:,:,39*a));
subplot(2,4,8),imshow(right(:,:,40*a));
figure, 
subplot(2,4,1),imshow(right(:,:,41*a));
subplot(2,4,2),imshow(right(:,:,42*a));
subplot(2,4,3),imshow(right(:,:,43*a));
subplot(2,4,4),imshow(right(:,:,44*a));
subplot(2,4,5),imshow(right(:,:,45*a));
subplot(2,4,6),imshow(right(:,:,46*a));
subplot(2,4,7),imshow(right(:,:,47*a));
subplot(2,4,8),imshow(right(:,:,48*a));

end

