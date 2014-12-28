%%%%%%%%%%%%% The ShapeReco.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%Purpose:  
%     To recognize the ROIs' shapes of input test image by using invariant 
%     moments, which has been calculated before
%
%      Input Variables
%          a, b, c, d             invariant moment #1 of original image 
%          e, f, g, h             invariant moment #1 of input test image
%          x                      serial number of input test image
%      
%      Returned Results
%          no 
%
%      Recognition Strategy
%           We can do recognition by calculating and comparing the variance  
%          of invatiant moments of image model database and input test 
%          image database. The smallest variance means the particular
%          region in test image is same as one known region of model image.
%           While observing the invatiant moments in database, we can find 
%          out that  no matter which region the invariant moments #2,#3 and 
%          #4 are always too small to affect the final variance result.
%          So we can make the strategy simpler by just calculating the  
%          invariant moment #1.
%           That also explain why the returned results of function
%          match1afilter.m,  match2afilter.m,  match3afilter.m are just
%          invariant moment #1
%
%       Processing Flow:
%      1.  Initialize the array to save the invariant moment of input test 
%          image. 
%      2.  Use min to save the smallest variance of invariant moment #1, and 
%          use minnum to save the number of region that has the smallest variance 
%      3.  To a particular region of model,loop to calculate the variance and find out the region number  
%          which has the smaillest variance
%      4.  Display the conclusion that the region that has the smallest 
%          variance is same as the particular region of model in step 3
%      5.  Reinitialize the min, and repeat step 3 and 4 for a new
%          particular region of model image
%          
%
%  Author:      Pritesh Kanani, Manjot Singh, Indrajit Murugappan
%  Date:        10/11/2013
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function ShapeReco(a,b,c,e,f,g,h,x)
im(1) = e;
im(2) = f;
im(3) = g;
im(4) = h;
min = 1;
minnum = 0;

for i = 1:4
    o(i) = (im(i)-a)^2;
    if o(i) < min
        min = o(i);
        minnum = i;
    end      
end
display(sprintf('The A ROI is in region #%d in the Image %d \n', minnum,x));

min = 1;
for i = 1:4
    p(i) = (im(i)-b)^2;
    if p(i) < min
        min = p(i);
        minnum = i;
    end      
end

display(sprintf('The B ROI is in region #%d in the Image %d \n', minnum,x));

min = 1;
for i = 1:4
    q(i) = (im(i)-c)^2;
    if q(i) < min
        min = q(i);
        minnum = i;
    end      
end

display(sprintf('The C ROI is in region #%d in the Image %d \n', minnum,x));
