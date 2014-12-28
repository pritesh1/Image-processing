%%%%%%%%%%%%% The DatabaseImage.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%Purpose:  
%     To separate the 4 ROI from the original image then to create the 
%      database of four ROI input image's features such as boundingbox, 
%      position, area, invariant moments. Using a table to present the
%      results.
%
%      Input Variables
%          f   input target 2D image
%
%      Returned Results
%          no
%
%       Processing Flow:
%      1.  Find the size of the image and initialize variables and
%          image matrices
%      2.  Loop through all of the pixels and analyze every pixel's labeled
%          number. Save pixels' information into 4 different matrices based
%          on the labeled number
%      3.  Use the function calculations.m to calculate the data we need
%      4.  Create a table that contains all the result data  
%
%  Author:      Zhenning Zhao, Kyle McCormick, Michael Mikulski
%  Date:        09/27/2012
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [im11, im21, im31] = DatabaseImage (a)

% calculate the size of input image
% a = imread ( 'shadow1scaled.bmp' );

% Transfer input image to gray level image
f = rgb2gray(a);
subplot(1,3,1);
imshow(f);
title('original input image(gray scale)');

%threshold the gray level image we obtained to get a binary image
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
title('filtered binary image of shadow1rotated');

% Obtain the color labeled image
flabel = bwlabel(ff, 4);
fRGB = label2rgb(flabel);
subplot(1,3,3)
imshow(fRGB);
title(' Color labeled match1');

% initialize image matrix
R1 = zeros(m,n);
R2 = zeros(m,n);
R3 = zeros(m,n);

% loop to analysis the labeled number of pixel
for i = 1 : m
    for j = 1:n
        if flabel(i,j) == 3
            R1(i,j) = 1;        
          else
            if flabel(i,j) == 7
                R2(i,j) = 1;
                  else
                     if flabel(i,j) == 12
                         R3(i,j) = 1;
                     end
            end
        end
    end
end
figure;
subplot(2,2,1);
imshow(R1);
title('Separated Region #1 of match1a');
subplot(2,2,2);
imshow(R2);
title('Separated Region #2 of match1a');
subplot(2,2,3);
imshow(R3);
title('Separated Region #3 of match1a')

% use the function calculations.m to calculate the data we need
[a1,b1,c1,d1,e1,f1,g1,im11,im12,im13] = calculations(R1,m,n);
[a2,b2,c2,d2,e2,f2,g2,im21,im22,im23] = calculations(R2,m,n);
[a3,b3,c3,d3,e3,f3,g3,im31,im32,im33] = calculations(R3,m,n);


% Create a table to show the calculated properties of four region
g = figure('Position',[200 200 1100 400]);

dat = {a1,b1,a1,d1,c1,b1,c1,d1,e1,f1,g1,im11,im12,im13;...
       a2,b2,a2,d2,c2,b2,c2,d2,e2,f2,g2,im21,im22,im23;...
       a3,b3,a3,d3,c3,b3,c3,d3,e3,f3,g3,im31,im32,im33;};
   
cnames = {'Bounding Box Upper left i', 'UL j','Bottom Left i', 'BL j','Upper Right i', 'UR j','Bottom Right i', 'BR j','Area/ Pixels', 'Position i', 'Position j','Invariant Moment #1','#2','#3'};
rnames = {'Region #1','Region #2','Region #3'};

t = uitable('Parent',g,'Data',dat,'ColumnName',cnames,...
            'RowName',rnames,'Position',[20 20 1050 300]); 
 
        
        

     









