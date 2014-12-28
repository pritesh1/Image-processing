%%%%%%%%%%%%% The match3afilter.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%Purpose:  
%     To filter the input image(match3a.bmp) to an analazable image,
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
%      2.  First filtering: Use a 3*2 size median filter to cancel most of 
%          the salt and pepper noise in the image
%      3.  Second filtering: Loop to make gray pixels to be white, which
%          can make the image to a binary one and meke good preparation 
%          for next filtering
%      4.  Third filtering: Use a 3*3 size median filter to cancel the rest
%          noise pixels
%      5.  Label the filtered image obtained  and then initialize four
%          matrices to save four labeled regions.Loop through all of the 
%          pixels and analyze every pixel's labeled number. Save pixels' 
%          information into 4 different matrices based on the labeled number
%      6.  Show the four labeled regions
%      7.  Use the function calculations.m to calculate the data we need
%      8.  Create a table that contains all the result data  
%
%  Author:      Zhenning Zhao, Kyle McCormick, Michael Mikulski
%  Date:        09/27/2012
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [im11, im21, im31] = match3afilter(f)
% f = imread('shadow1streaks.gif');

% Transfer input image to gray level image
% f = rgb2gray(f);
[m,n]=size(f);
figure;
subplot(1,2,1);
imshow(f);
title(' original input image (gray scale) of match3a');

% First time filtering: use median filter to cancel the most pixel of 
% salt and pepper noise

fff = medfilt2(f, [9 9]);% the size of median filter is determined after several times attempts
subplot(1,2,2);
imshow(fff);
title('image after 1st time filtering of match3a');

% % Second time filtering: loop to examine all the pixels and make the
% % gray pixels to be white
% [m, n] = size(fff);
% ffff = zeros(m,n);
% for i = 1:m
%     for j = 1:n
%         if fff(i,j) > 0
%             ffff(i,j) = 1;
%         end
%     end
% end
% subplot(3,2,3);
% imshow(ffff);
% title('image after 2nd time filtering of match3a');
% 
% % Third time filtering: use median filter again to cancel the rest salt
% % noise pixels
% fffff = medfilt2(ffff, [5 5]);   % the size of median filter is determined after several times attempts
% subplot(3,2,4);
% imshow(fffff);
% title('image after 3rd time filtering of match3a');

% Lable the filtered image, and show it by color labeled method 
fffflabel = bwlabel(fff,4);
fRGB = label2rgb(fffflabel);
% subplot(3,2,5);
imtool(fffflabel);
title('filtered image with color label of match2a'); 

% initialize four image matrices to save ROI information
R1 = zeros(m,n);
R2 = zeros(m,n);
R3 = zeros(m,n);


% loop to judge and to obtain 4 separated ROIs
for i = 1 : m
    for j = 1:n
        if fffflabel(i,j) == 1
            R1(i,j) = 1;
            else
            if fffflabel(i,j) == 3
                R2(i,j) = 1;
            else
                if fffflabel(i,j) == 9
                    R3(i,j) = 1;
                
                end
            end
        end
    end
end

% display the 4 ROIs we obtained
figure;
subplot(2,2,1);
imshow(R1);
title('Separated Region #1 of match3a');

subplot(2,2,2);
imshow(R2);
title('Separated Region #2 of match3a');

subplot(2,2,3);
imshow(R3);
title('Separated Region #3 of match3a');

% subplot(2,2,4);
% imshow(R4);
% title('Separated Region #4 of match3a');

% use the function calculate to calculate for features of ROIs
[a1,b1,c1,d1,e1,f1,g1,im11,im12,im13] = calculations(R1,m,n);
[a2,b2,c2,d2,e2,f2,g2,im21,im22,im23] = calculations(R2,m,n);
[a3,b3,c3,d3,e3,f3,g3,im31,im32,im33] = calculations(R3,m,n);
% [a4,b4,c4,d4,e4,f4,g4,im41,im42,im43] = calculations(R4,m,n);

% Create a table to show the calculated properties of 4 ROIs
g = figure('Position',[200 200 1100 400]);

dat = {a1,b1,a1,d1,c1,b1,c1,d1,e1,f1,g1,im11,im12,im13;...
       a2,b2,a2,d2,c2,b2,c2,d2,e2,f2,g2,im21,im22,im23;...
       a3,b3,a3,d3,c3,b3,c3,d3,e3,f3,g3,im31,im32,im33;};
   
cnames = {'Bounding Box Upper left i', 'UL j','Upper Right i', 'UR j','Bottom Left i', 'BL j','Bottom Right i', 'BR j','Area/ Pixels', 'Position i', 'Position j','Invariant Moment #1','#2','#3'};
rnames = {'3A Region #1','3A Region #2','3A Region #3'};

t = uitable('Parent',g,'Data',dat,'ColumnName',cnames,...
            'RowName',rnames,'Position',[20 20 1050 300]); 
        
        

     