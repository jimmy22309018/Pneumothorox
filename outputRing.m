function [maskMri] = outputRing(mask,Mri)
[a,b,c] = size(Mri);

maskMri = mask.*Mri;


a = round(c/18)
figure(87), 
subplot(2,4,1),imshow(mask(:,:,a));
subplot(2,4,2),imshow(mask(:,:,2*a));
subplot(2,4,3),imshow(mask(:,:,3*a));
subplot(2,4,4),imshow(mask(:,:,4*a));
subplot(2,4,5),imshow(mask(:,:,5*a));
subplot(2,4,6),imshow(mask(:,:,6*a));
subplot(2,4,7),imshow(mask(:,:,7*a));
subplot(2,4,8),imshow(mask(:,:,8*a));
drawnow

figure(88), 
subplot(2,4,1),imshow(mask(:,:,9*a));
subplot(2,4,2),imshow(mask(:,:,10*a));
subplot(2,4,3),imshow(mask(:,:,11*a));
subplot(2,4,4),imshow(mask(:,:,12*a));
subplot(2,4,5),imshow(mask(:,:,13*a));
subplot(2,4,6),imshow(mask(:,:,14*a));
subplot(2,4,7),imshow(mask(:,:,15*a));
subplot(2,4,8),imshow(mask(:,:,16*a));
drawnow
figure(89), 
subplot(2,4,1),imshow(maskMri(:,:,a));
subplot(2,4,2),imshow(maskMri(:,:,2*a));
subplot(2,4,3),imshow(maskMri(:,:,3*a));
subplot(2,4,4),imshow(maskMri(:,:,4*a));
subplot(2,4,5),imshow(maskMri(:,:,5*a));
subplot(2,4,6),imshow(maskMri(:,:,6*a));
subplot(2,4,7),imshow(maskMri(:,:,7*a));
subplot(2,4,8),imshow(maskMri(:,:,8*a));
drawnow

figure(90), 
subplot(2,4,1),imshow(maskMri(:,:,9*a));
subplot(2,4,2),imshow(maskMri(:,:,10*a));
subplot(2,4,3),imshow(maskMri(:,:,11*a));
subplot(2,4,4),imshow(maskMri(:,:,12*a));
subplot(2,4,5),imshow(maskMri(:,:,13*a));
subplot(2,4,6),imshow(maskMri(:,:,14*a));
subplot(2,4,7),imshow(maskMri(:,:,15*a));
subplot(2,4,8),imshow(maskMri(:,:,16*a));
drawnow


his = zeros(1,c);
for x = 1 : c
   
    his(1,x) = sum(sum(maskMri(:,:,x)));
    
end


figure(27),plot(his);



end

