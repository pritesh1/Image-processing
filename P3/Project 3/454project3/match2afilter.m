%%%%%%%%%%%%% The match2afilter.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%Purpose:  
%     To cancel the streak noise in the input image(match2a.bmp) with the 
%      method of opening (firstly erosion then dilation), and to try best to 
%      retain the shape of the objects in the images.
%
%      Input Variables
%          f                         input target 2D image (with noise) 
%
%      Returned Results
%          fff                       output 2D image (with noise canceled) 
%
%       Processing Flow:
%      1.  Firstly obtain the size of input image then initial 2 same size 
%          image matrices to save gray level information
%      2.  Then loop for examine pixels in the input image. We use the 3*1
%          vertical mask, and considering the border effect, the first and 
%          last row of the input image will not be examinedand. Use '&&' for 
%          erosion judgement, then obtain the erosion image ff
%      3.  Do process of dilation with same mask and use '||' for dilation
%          judgement. Border effect should also be considered. Finally we
%          obtain the image fff which has no streak noise in it.
%     
%
%  Author:     Zhenning Zhao, Michael Mikulski, Kyle McCormick
%  Date:        10/25/2012
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function fff = match2afilter(f)

% obtain the size of the input image
[m, n] = size(f);

% initialize image matrices
ff = zeros(m,n);
fff = zeros(m,n);

% loop for erosion process (considering the border effect)
for i = 2:(m-1)
    for j = 1:n
        
        if f(i,j)>0 && f(i+1, j)> 0 && f(i-1,j)>0 
           
            ff(i,j) = 1;
        end
    end
end

% show the image after erosion
figure;
subplot(1,2,1);
imshow(ff);
title('image match2a after erosion');

% loop for dilation process (considering the border effect)
for i = 2:(m-1)
    for j = 1:n
       
            if ff(i,j)>0 || ff(i+1, j)> 0 || ff(i-1,j)>0
            
            fff(i,j) = 1;
            end
          
    end
end

% show the final image
subplot(1,2,2);
imshow(fff);
title('final result');


            