%%%%%%%%%%%%% The match2afilter.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%Purpose:  
%     To filter the input image(match2a.bmp) to an analazable image,
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
%      2.  First filtering: Use a judgement of gray level 255 to delete most pixels in
%          the streaks, and obtain a image with only white and black color,
%          and has little noise pixels(white).
%      3.  Second filtering:  Use median filter to cancel rest noise pixels
%      4.  Label the image obtained from last step. And initialize four
%          matrices to save four labeled regions.Loop through all of the 
%          pixels and analyze every pixel's labeled number. Save pixels' 
%          information into 4 different matrices based on the labeled number
%      5.  Show the four labeled regions
%      6.  Use the function calculations.m to calculate the data we need
%      7.  Create a table that contains all the result data  
%
%  Author:      Zhenning Zhao, Kyle McCormick, Michael Mikulski
%  Date:        09/27/2012
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [im11, im21, im31, im41] = match2afilter(f)

% Transfer input image to gray level image
ff = rgb2gray(f);

% Show the input gray level image
figure;
subplot(2,2,1);
imshow(ff);
title(' original input image (gray scale) of match2a');

% First time filtering: to cancel the most pixels in streaks
[m,n] = size(ff);
fff=zeros(m,n);

for i = 1:m
    for j = 1:n
        if ff(i,j)==255
            fff(i,j) = 1;
        end
    end
end

subplot(2,2,2);
imshow(fff);
title('image after 1st time filtering of match2a');

% Second time filtering: use median filter to cancel the rest pixel in
% the streaks 
ffff = medfilt2(fff,[3 1]);  % the size of median filter is determined after several times attempts
subplot(2,2,3);
imshow(ffff);
title('image after 2nd time fitering of match2a');

% Lable the filtered image, and show it by color labeled method  
flabel = bwlabel(ffff,4);
fRGB = label2rgb(flabel);
subplot(2,2,4);
imshow(fRGB);
title('filtered image with color label of match2a'); 

% initialize four image matrices to save ROI information
R1 = zeros(m,n);
R2 = zeros(m,n);
R3 = zeros(m,n);
R4 = zeros(m,n);

% loop to judge and to obtain 4 separated ROIs
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

% display the 4 ROIs we obtained

figure;
subplot(2,2,1);
imshow(R1);
title('Separated Region #1 of match2a');

subplot(2,2,2);
imshow(R2);
title('Separated Region #2 of match2a');

subplot(2,2,3);
imshow(R3);
title('Separated Region #3 of match2a');

subplot(2,2,4);
imshow(R4);
title('Separated Region #4 of match2a');

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
rnames = {'2A Region #1','2A Region #2','2A Region #3', '2A Region #4'};

t = uitable('Parent',g,'Data',dat,'ColumnName',cnames,...
            'RowName',rnames,'Position',[20 20 1050 300]); 
        
        

     