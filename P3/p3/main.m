%%%%%%%%%%%%% The main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Purpose:  
%      To obtain the gaussian pyramid of the image 'lake.bmp' 
%      by using the MATLAB function impyramid. Also, to use different 
%      operators and sigmas to get the edge of original lake image and 
%      expanded images. Finally to find the 50 largest edge components 
%      using Canny opearator for two levels(L=0 & L=2)
% 
%   Processing Flow:
%      1.  Read the image 'lake.bmp'
%      2.  Obtain all levels of gaussian pyramid for input image  
%      3.  Obtain the edges using sobel operator for the expanded images 
%      4.  Obtain the edges using Canny operator for the original image   
%          with different sigma values
%      5.  For L=0 and L=2, obtain the 50 largest edge components using
%          Cannny operator 
%  
%   The following functions are called:
%      PryamidDecomp()
%      EdgeDetection()
%
%   Author:      Pritesh Kanani, Manjot Singh, Indrajit Murugappan
%   Date:        10/25/2013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% Read image input image
I0 = imread('lake.bmp');

% Obtain the gaussian pyramid for the input image
[I1e, I2e, I3e, I4e, I5e, I6e, I7e, I8e] = PryamidDecomp(I0);

% Obtain the eges of original image and expanded image
EdgeDetection(I0, I1e, I2e, I3e, I4e, I5e, I6e, I7e, I8e); 