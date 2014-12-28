%%%%%%%%%%%%% The main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      To use the mathmatical morphology method cancel the noise pixels in 
%      image match2a and match3a ( commonly using the opening process). 
%      Then for the image of lenna, to obtain the four-level pyamid of it
%      by using the MATLAB function impyramid. Also, to use different 
%      operators and sigmas to get the edge of original lenna images and 
%      expanded images.
%
%      Processing Flow:
%      1.  Read and transform the input image
%      2.  Use the opening method to cancel the noise in match2a and
%      match3a( with different masks) 
%      3.  Read the image lenna
%      4.  Obtain the four-level image pyramid 
%      5.  Obtain the edge of original and expanded images 
%         
%
%  The following functions are called:
%      match2afilter()
%      match3afilter()
%      PryamidDecomp()
%      EdgeDetection()
%
%  Author:      Zhenning Zhao, Michael Mikulski, Kyle McCormick
%  Date:        10/25/2012
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Read image match2a.bmp 
f1 = imread('match2a.bmp');

% Transfer input image to gray level image
f11 = rgb2gray(f1);

% Show the original image
imshow(f11);
title('original match2a');

% Use mathematical morphology method to cancel the streak noise
f111 = match2afilter(f11);

% Read image match3a.bmp 
f2 = imread('match3a.bmp');

% Transfer input image to gray level image
f22 = rgb2gray(f2);

% Show the original image
figure;
imshow(f22);
title('original match3a');

% Use mathematical morphology method to cancel the salt and pepper noise
f222 = match3afilter(f22);

% Read image lenna.gif
I0 = imread('lenna.gif');

% Obtain the four-level pyramid for the lenna image
[I1e, I2e, I3e, I4e] = PryamidDecomp(I0);

% Obtain the eges of original image and expanded image
%EdgeDetection(I0, I1e, I2e, I3e, I4e); 