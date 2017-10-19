
[a,b,c] = size(maskRing);

left = maskRing(:,1:round(b/2),:);
right = maskRing(:,round(b/2):b,:);

a = round(c/18)
figure, 

subplot(2,4,1),imshow(left(:,:,a));
subplot(2,4,2),imshow(left(:,:,2*a));
subplot(2,4,3),imshow(left(:,:,3*a));
subplot(2,4,4),imshow(left(:,:,4*a));
subplot(2,4,5),imshow(left(:,:,5*a));
subplot(2,4,6),imshow(left(:,:,6*a));
subplot(2,4,7),imshow(left(:,:,7*a));
subplot(2,4,8),imshow(left(:,:,8*a));
title('Left1')
drawnow

figure,
subplot(2,4,1),imshow(left(:,:,9*a));
subplot(2,4,2),imshow(left(:,:,10*a));
subplot(2,4,3),imshow(left(:,:,11*a));
subplot(2,4,4),imshow(left(:,:,12*a));
subplot(2,4,5),imshow(left(:,:,13*a));
subplot(2,4,6),imshow(left(:,:,14*a));
subplot(2,4,7),imshow(left(:,:,15*a));
subplot(2,4,8),imshow(left(:,:,16*a));
title('Left2')
drawnow


figure, 
subplot(2,4,1),imshow(right(:,:,a));
subplot(2,4,2),imshow(right(:,:,2*a));
subplot(2,4,3),imshow(right(:,:,3*a));
subplot(2,4,4),imshow(right(:,:,4*a));
subplot(2,4,5),imshow(right(:,:,5*a));
subplot(2,4,6),imshow(right(:,:,6*a));
subplot(2,4,7),imshow(right(:,:,7*a));
subplot(2,4,8),imshow(right(:,:,8*a));
title('Right1')
drawnow

figure,
subplot(2,4,1),imshow(right(:,:,9*a));
subplot(2,4,2),imshow(right(:,:,10*a));
subplot(2,4,3),imshow(right(:,:,11*a));
subplot(2,4,4),imshow(right(:,:,12*a));
subplot(2,4,5),imshow(right(:,:,13*a));
subplot(2,4,6),imshow(right(:,:,14*a));
subplot(2,4,7),imshow(right(:,:,15*a));
subplot(2,4,8),imshow(right(:,:,16*a));
title('Right2')
drawnow


