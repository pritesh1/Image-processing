%function PryamidDecomp(I)
I = imread('lenna.gif');
imshow(I);

I1 = impyramid(I, 'reduce');
figure;
imshow(I1);
I1e = impyramid(I1,'expand');
figure;
imshow(I1e);

I2 = impyramid(I1, 'reduce');
figure;
imshow(I2);
I2e = impyramid(I2,'expand');
I2e = impyramid(I2e,'expand');
figure;
imshow(I2e);


I3 = impyramid(I2, 'reduce');
figure;
imshow(I3);
I3e = impyramid(I3,'expand');
I3e = impyramid(I3e,'expand');
I3e = impyramid(I3e,'expand');
figure;
imshow(I3e);

ISobel = edge(I1e,'sobel');
figure;
imshow(ISobel);



