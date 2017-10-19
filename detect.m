function [startP,endP] = detect(threshold,mask)
[a,b,c] = size(mask);
%figure(21),imshow(mask(:,:,50));
%{
a = round(901/18);
figure(100), 
subplot(2,4,1),imshow(mask(:,:,a));
subplot(2,4,2),imshow(mask(:,:,2*a));
subplot(2,4,3),imshow(mask(:,:,3*a));
subplot(2,4,4),imshow(mask(:,:,4*a));
subplot(2,4,5),imshow(mask(:,:,5*a));
subplot(2,4,6),imshow(mask(:,:,6*a));
subplot(2,4,7),imshow(mask(:,:,7*a));
subplot(2,4,8),imshow(mask(:,:,8*a));

figure(101), 
subplot(2,4,1),imshow(data(:,:,a));
subplot(2,4,2),imshow(data(:,:,2*a));
subplot(2,4,3),imshow(data(:,:,3*a));
subplot(2,4,4),imshow(data(:,:,4*a));
subplot(2,4,5),imshow(data(:,:,5*a));
subplot(2,4,6),imshow(data(:,:,6*a));
subplot(2,4,7),imshow(data(:,:,7*a));
subplot(2,4,8),imshow(data(:,:,8*a));
%}
%mask(:,:,5*a)
his = zeros(1,c);

for x = 1 : c
    
    
    his(1,x) = sum(sum(mask(:,:,x)));
    if (his(1,x) > threshold && sum(sum(mask(:,:,x+3)))>threshold && sum(sum(mask(:,:,x+5)))>threshold && sum(sum(mask(:,:,x+7)))>threshold && sum(sum(mask(:,:,x+10)))>threshold)
        startP = x;
        endP = round(startP + (c - startP)*3/5);
        %figure, plot(his),title('detect'),drawnow;
        return;
    end
end

%figure(10), plot(his);


end

