%%%%%%%%%%%%% The match1afilter.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%Purpose:  
%     To transfer the input image(match1a.bmp) to an analazable image,
%      then to separate it to 4 ROIs and calculate their features.
%
%      Input Variables
%          f                         input target 2D image 
%
%      Returned Results
%          im11, im21, im31, im41    invariant moment #1 of 4 ROIs 
%
%       Processing Flow:
%      1.  Use the function rgb2gray to transfer the original bmp image to
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
%  Author:      Zhenning Zhao, Kyle McCormick, Michael Mikulski
%  Date:        09/27/2012
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [im11, im21, im31, im41] = match1afilter(f)

% transfer input image to gray level image
ff = rgb2gray(f);
% ff = imread ( 'shadow1.gif' );
% ff = imread('shadow1.gif');

figure;
subplot(1,3,1);
imshow(ff);
title('original input image(gray scale) of match1a');

%threshold the gray level image we obtained to get a binary image
[m, n] = size(ff);
fff = zeros(m,n);

for i = 1:m
    for j = 1:n        
        if ff(i,j) > 200
            fff(i,j) = 1;
        end
    end
end

subplot(1,3,2);
imshow(fff);
title('filtered binary image of match1a');

% label the binary image
ffff = bwlabel(fff,4);
fRGB = label2rgb(ffff);
subplot(1,3,3);
imshow(fRGB);
title('filtered image with color label of match1a'); 

% initialize four image matrices to save ROI information
R1 = zeros(m,n);
R2 = zeros(m,n);
R3 = zeros(m,n);
R4 = zeros(m,n);

% loop to judge and to obtain 4 separated ROIs
for i = 1 : m
    for j = 1:n
        if ffff(i,j) == 1
            R1(i,j) = 1;
            else
            if ffff(i,j) == 2
                R2(i,j) = 1;
            else
                if ffff(i,j) == 3
                    R3(i,j) = 1;
                else
                    if ffff(i,j) ==4
                        R4(i,j) =1;
                    end
                end
            end
        end
    end
end

% display the 4 ROIs we obtained
figure;
subplot(2,2,1);
imshow(R1);
title('Separated Region #1 of match1a');
subplot(2,2,2);
imshow(R2);
title('Separated Region #2 of match1a');
subplot(2,2,3);
imshow(R3);
title('Separated Region #3 of match1a');
subplot(2,2,4);
imshow(R4);
title('Separated Region #4 of match1a');


% use the function calculate to calculate for features of ROIs
[a1,b1,c1,d1,e1,f1,g1,im11,im12,im13,im14] = calculations(R1,m,n);
[a2,b2,c2,d2,e2,f2,g2,im21,im22,im23,im24] = calculations(R2,m,n);
[a3,b3,c3,d3,e3,f3,g3,im31,im32,im33,im34] = calculations(R3,m,n);
[a4,b4,c4,d4,e4,f4,g4,im41,im42,im43,im44] = calculations(R4,m,n);

% Create a table to show the calculated properties of 4 ROIs
g = figure('Position',[200 200 1100 400]);

dat = {a1,b1,a1,d1,c1,b1,c1,d1,e1,f1,g1,im11,im12,im13,im14;...
       a2,b2,a2,d2,c2,b2,c2,d2,e2,f2,g2,im21,im22,im23,im24;...
       a3,b3,a3,d3,c3,b3,c3,d3,e3,f3,g3,im31,im32,im33,im34;...
       a4,b4,a4,d4,c4,b4,c4,d4,e4,f4,g4,im41,im42,im43,im44;};
   
cnames = {'Bounding Box Upper left i', 'UL j','Upper Right i', 'UR j','Bottom Left i', 'BL j','Bottom Right i', 'BR j','Area/ Pixels', 'Position i', 'Position j','Invariant Moment #1','#2','#3','#4'};
rnames = {'1A Region #1','1A Region #2','1A Region #3', '1A Region #4'};

t = uitable('Parent',g,'Data',dat,'ColumnName',cnames,...
            'RowName',rnames,'Position',[20 20 1050 300]); 
        
        

     
        