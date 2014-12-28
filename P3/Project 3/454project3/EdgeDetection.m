function EdgeDetection(I0, I1e, I2e, I3e, I4e)

Iedges1 = edge(I0, 'canny', [], 2);
figure;
subplot(2,2,1);
imshow(Iedges1);
title('edge of original lenna of canny sigma 2');

Iedges2 = edge(I0, 'canny', [], 4); 
subplot(2,2,2);
imshow(Iedges2);
title('edge of original lenna of canny sigma 4');

Iedges4 = edge(I0, 'canny', [], 7);
subplot(2,2,3);
imshow(Iedges4);
title('edge of original lenna of canny sigma 7');

Iedges8 = edge(I0, 'canny', [], 14);
subplot(2,2,4);
imshow(Iedges8);
title('edge of original lenna of canny sigma 14');

ISobel1 = edge(I1e, 'sobel');
figure;
subplot(2,2,1);
imshow(ISobel1);
title('edge of expanded image I1e edge by Sobel ');
ISobel2 = edge(I2e, 'sobel');
subplot(2,2,2);
imshow(ISobel2);
title('edge of expanded image I2e edge by Sobel ');
ISobel3 = edge(I3e, 'sobel');
subplot(2,2,3);
imshow(ISobel3);
title('edge of expanded image I3e edge by Sobel ');
ISobel4 = edge(I4e, 'sobel');
subplot(2,2,4);
imshow(ISobel4);
title('edge of expanded image I4e edge by Sobel ');


ICanny1 = edge(I1e, 'canny');
figure;
subplot(2,2,1);
imshow(ICanny1);
title('edge of expanded image I1e edge by Canny ');
ICanny2 = edge(I2e, 'canny');
subplot(2,2,2);
imshow(ICanny2);
title('edge of expanded image I2e edge by Canny ');
ICanny3 = edge(I3e, 'canny');
subplot(2,2,3);
imshow(ICanny3);
title('edge of expanded image I3e edge by Canny ');
ICanny4 = edge(I4e, 'canny');
subplot(2,2,4);
imshow(ICanny4);
title('edge of expanded image I4e edge by Canny ');



