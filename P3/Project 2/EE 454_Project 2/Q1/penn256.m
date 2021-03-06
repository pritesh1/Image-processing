%%%%%%%%%%%%% The penn256.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Purpose:  
%      To transfer the input image(penn256) to an analazable image,
%      then to separate it to 4 largest regions and calculate their features.
%
%    Input Variables
%      f                           input target 2D image 
%
%    Returned Results
%      im11, im21, im31, im41      invariant moment #1 of 4 largest regions 
%
%    Processing Flow:
%      1.  Use the function rgb2gray to transfer the original image to
%          a gray level image
%      2.  Use a threshold 200 to make gray pixels to be white. This
%          procedure can obtain a image with only white and black color,
%          which can be used for label work.
%      3.  Label the image obtained from last step. And initialize four
%          matrices to save four labeled regions.Loop through all of the 
%          pixels and analyze every pixel's labeled number. Save pixels' 
%          information into 4 different matrices based on the labeled number
%      4.  Show the four labeled regions
%      5.  Use the function calculations.m to calculate the data we need
%      6.  Create a table that contains all the result data  
%
%    Author:      Pritesh Kanani, Manjot Singh, Indrajit Murugappan
%    Date:        10/11/2013
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [im11, im21, im31,im41] = penn256(a)
% a = imread('penn256.bmp');

% Transfer input image to gray level image
f = rgb2gray(a);
figure;
subplot(1,3,1);
imshow(f);
title('Original input image(gray scale)');

% Threshold the gray level image to get a binary image
[m, n] = size(f);
ff = zeros(m,n);

for i = 1:m
    for j = 1:n        
        if f(i,j) > 200
            ff(i,j) = 1;
        end
    end
end

subplot(1,3,2);
imshow(ff);
title('Binary image of penn256');

% Label the binary image
flabel = bwlabel(ff,4);
fRGB = label2rgb(flabel);
subplot(1,3,3);
imshow(fRGB);
title('Labeled image with color'); 

% Initialize image matrices
R1 = zeros(m,n);
R2 = zeros(m,n);
R3 = zeros(m,n);
R4 = zeros(m,n);

% Loop to analyze and obtain 4 separated regions
for i = 1 : m
    for j = 1:n
        if flabel(i,j) == 1
            R1(i,j) = 1;
            else
            if flabel(i,j) == 2
                R2(i,j) = 1;
            else
                if flabel(i,j) == 3
                    R3(i,j) = 1;
                else
                    if flabel(i,j) ==4
                        R4(i,j) =1;
                    end
                end
            end
        end
    end
end

figure;
subplot(2,2,1);
imshow(R1);
title('Separated Region #1 of penn256');
subplot(2,2,2);
imshow(R2);
title('Separated Region #2 of penn256');
subplot(2,2,3);
imshow(R3);
title('Separated Region #3 of penn256');
subplot(2,2,4);
imshow(R4);
title('Separated Region #4 of penn256');


% Use the function calculations.m to calculate the properties
[a1,b1,c1,d1,e1,ff,g1,im11,im12,im13,im14] = calculations(R1,m,n);
[a2,b2,c2,d2,e2,f2,g2,im21,im22,im23,im24] = calculations(R2,m,n);
[a3,b3,c3,d3,e3,f3,g3,im31,im32,im33,im34] = calculations(R3,m,n);
[a4,b4,c4,d4,e4,f4,g4,im41,im42,im43,im44] = calculations(R4,m,n);

% Create a table to show the calculated properties
g = figure('Position',[200 200 1300 400]);

dat = {a1,b1,a1,d1,c1,b1,c1,d1,e1,ff,g1,im11,im12,im13,im14;...
       a2,b2,a2,d2,c2,b2,c2,d2,e2,f2,g2,im21,im22,im23,im24;...
       a3,b3,a3,d3,c3,b3,c3,d3,e3,f3,g3,im31,im32,im33,im34;...
       a4,b4,a4,d4,c4,b4,c4,d4,e4,f4,g4,im41,im42,im43,im44;};
   
cnames = {'Upper left i', 'UL j','Bottom Left i', 'BL j','Upper Right i', 'UR j','Bottom Right i', 'BR j','Area/ Pixels', 'Position i', 'Position j','Invariant Moment #1','#2','#3','#4'};
rnames = {'Region #1','Region #2','Region #3','Region #4'};

t = uitable('Parent',g,'Data',dat,'ColumnName',cnames,...
            'RowName',rnames,'Position',[10 200 1300 100]); 
        
        

     
        