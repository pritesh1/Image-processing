%%%%%%%%%%%%% The calculations.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%       To find the bounding box, area, position and the invariant moments 
%       of the input images
%
%      Input Variables
%          f   input target 2D image 
%          m,n input image's size
%
%      Returned Results
%          xmin   i coordinate of uppermost pixel
%          ymin   j coordinate of leftmost pixel
%          xmax   i coordinate of leftmost pixel 
%          ymax   j coordinate of lowermost pixel
%          area   area of input region
%          posi   i coordinate of the position
%          posj   j coordinate of the position
%          im1    invariant moment 1
%          im2    invariant moment 2
%          im3    invariant moment 3
%          im4    invariant moment 4
%
%      Processing Flow:
%      1.  Find the size of the image and initialize variables
%      2.  Loop through all of the pixels and analyze only the pixels 
%          that has a value of 1(white)
%      3.  Find the Bounding Box
%      4.  Find the Area
%      5.  Find the Position
%      6.  Calculate the four invariant moments of input region 
%
%      
%
%  Author:      Pritesh Kanani, Manjot Singh, Indrajit Murugappan
%  Date:        10/11/2013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




function [ymin, xmin, ymax, xmax, area, posi, posj, im1, im2, im3, im4] = calculations(f,m,n)


% Initialize the variables
xmin = m;
xmax = 0;
ymin = n;
ymax = 0;

area = 0;

m10 = 0;
m01 = 0;

% Loop through the pixels
for i = 1:m
    for j = 1:n
        
        % Only analyze those pixels that are part of the largest component
        if(f(i,j) == 1)
        
        % Calculate the Bounding Box
        
        if(i < xmin)
            xmin = i;
        end
        if(i > xmax)
            xmax = i;
        end
        if(j < ymin)
            ymin = j;
        end
        if(j > ymax)
            ymax = j;
        end
        
        % Calculate the Area
        
        area = area+1;

        % Calculate the Position
        
        m10 = m10 + i;
        m01 = m01 + j;
            
        end
    end
end


posi = (m10 / area);
posj = (m01 / area);


% Calculate the invariant moment
x20 = 0;
x02 = 0;
x11 = 0;
x30 = 0;
x12 = 0;
x21 = 0;
x03 = 0;

y20 = 0;
y02 = 0;
y11 = 0;
y30 = 0;
y12 = 0;
y21 = 0;
y03 = 0;

im1 = 0;
im2 = 0;
im3 = 0;
im4 = 0;

for i = 1:m
    for j = 1:n
        if (f(i,j)==1)
            x20 = x20 + (i-posi) * (i-posi);
            x02 = x02 + (j-posj) * (j-posj);
            x11 = x11 + (i-posi) * (j-posj);
            x30 = x30 + (i-posi) * (i-posi) * (i-posi);
            x12 = x12 + (i-posi) * (j-posj) * (j-posj);
            x21 = x21 + (i-posi) * (i-posi) * (j-posj);
            x03 = x03 + (j-posj) * (j-posj) * (j-posj);
        end
    end
end

y20 = x20/(area * area);
y02 = x02/(area * area);
y11 = x11/(area * area);
y30 = x30/(area^2.5);
y12 = x12/(area^2.5);
y21 = x21/(area^2.5);
y03 = x03/(area^2.5);

im1 = y20 + y02;
im2 = (y20-y02)^2 + 4*(y11^2);
im3 = (y30-3*y12)^2 + (3*y21-y03)^2;
im4 = (y30+y12)^2 + (y21+y03)^2;




            



