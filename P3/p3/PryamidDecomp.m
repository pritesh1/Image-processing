function [I1e, I2e ,I3e, I4e, I5e, I6e, I7e, I8e] = PryamidDecomp(I)
% I=imread('lake.bmp');
figure;
imshow(I);title('Level 0 Image');

I1 = impyramid(I, 'reduce');
figure;
imshow(I1);title('Level 1 Pyramid Image');
I1e = impyramid(I1,'expand');
figure;
imshow(I1e);title('Level 1 Expanded Image');

I2 = impyramid(I1, 'reduce');
figure;
imshow(I2);title('Level 2 Pyramid Image');
I2e = impyramid(I2,'expand');
I2e = impyramid(I2e,'expand');
figure;
imshow(I2e);title('Level 2 Expanded Image');


I3 = impyramid(I2, 'reduce');
figure;
imshow(I3);title('Level 3 Pyramid Image');
I3e = impyramid(I3,'expand');
I3e = impyramid(I3e,'expand');
I3e = impyramid(I3e,'expand');
figure;
imshow(I3e);title('Level 3 Expanded Image');

I4 = impyramid(I3, 'reduce');
figure;
imshow(I4);title('Level 4 Pyramid Image');
I4e = impyramid(I4,'expand');
I4e = impyramid(I4e,'expand');
I4e = impyramid(I4e,'expand');
I4e = impyramid(I4e,'expand');
figure;
imshow(I4e);title('Level 4 Expanded Image');

I5 = impyramid(I4, 'reduce');
figure;
imshow(I5);title('Level 5 Pyramid Image');
I5e = impyramid(I5,'expand');
I5e = impyramid(I5e,'expand');
I5e = impyramid(I5e,'expand');
I5e = impyramid(I5e,'expand');
I5e = impyramid(I5e,'expand');
figure;
imshow(I5e);title('Level 5 Expanded Image');

I6 = impyramid(I5, 'reduce');
figure;
imshow(I6);title('Level 6 Pyramid Image');
I6e = impyramid(I6,'expand');
I6e = impyramid(I6e,'expand');
I6e = impyramid(I6e,'expand');
I6e = impyramid(I6e,'expand');
I6e = impyramid(I6e,'expand');
I6e = impyramid(I6e,'expand');
figure;
imshow(I6e);title('Level 6 Expanded Image');

I7 = impyramid(I6, 'reduce');
figure;
imshow(I7);title('Level 7 Pyramid Image');
I7e = impyramid(I7,'expand');
I7e = impyramid(I7e,'expand');
I7e = impyramid(I7e,'expand');
I7e = impyramid(I7e,'expand');
I7e = impyramid(I7e,'expand');
I7e = impyramid(I7e,'expand');
I7e = impyramid(I7e,'expand');
figure;
imshow(I7e);title('Level 7 Expanded Image');

I8 = impyramid(I7, 'reduce');
figure;
imshow(I8);title('Level 8 Pyramid Image');
I8e = impyramid(I8,'expand');
I8e = impyramid(I8e,'expand');
I8e = impyramid(I8e,'expand');
I8e = impyramid(I8e,'expand');
I8e = impyramid(I8e,'expand');
I8e = impyramid(I8e,'expand');
I8e = impyramid(I8e,'expand');
I8e = impyramid(I8e,'expand');
figure;
imshow(I8e);title('Level 8 Expanded Image');

