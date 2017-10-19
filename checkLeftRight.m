
partial = zeros(300,430,901,4);
partial2 = zeros(300,430,901,4);

partial(1:90,216:228,1) = maskRing(1:90,216:228,137);
partial(1:90,229:430,2) = maskRing(1:90,229:430,137);
partial(91:300,216:228,3) = maskRing(91:300,216:228,137);
partial(91:300,229:430,4) = maskRing(91:300,229:430,137);

figure,

subplot(2,2,1)
imshow(partial(:,:,1))
title('1')
subplot(2,2,2)
imshow(partial(:,:,2))
title('2')
subplot(2,2,3)
imshow(partial(:,:,3))
title('3')
subplot(2,2,4)
imshow(partial(:,:,4))
title('4')
title('Right 37');

partial2(1:163,1:165,1) = maskRing(1:163,1:165,138);
partial2(1:163,166:215,2) = maskRing(1:163,166:215,138);
partial2(164:300,1:165,3) = maskRing(164:300,1:165,138);
partial2(164:300,166:215,4) = maskRing(164:300,166:215,138);

figure,

subplot(2,2,1)
imshow(partial2(:,:,1))
title('1')
subplot(2,2,2)
imshow(partial2(:,:,2))
title('2')
subplot(2,2,3)
imshow(partial2(:,:,3))
title('3')
subplot(2,2,4)
imshow(partial2(:,:,4))
title('4')
title('Left 138');

