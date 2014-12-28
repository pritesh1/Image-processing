%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function for a opening
% getting the image first
% giving m and n the same size as f
% Use the given 'zero1' function
% function out of it for creating an erosion
% Reference- Lecture 8.class notes


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function erosion(f)
[m,n]= size(f);

% define a g with one x dimension co-ordinate and 256 y co ordinates
g= zero1(m,n);

%two loops scanning the entire image and calculating the count of g 
% Border effects
len=2;
wid=3;
 for i = (len+1):m-len-1 
     for j= wid+1:n-wid-1
         for k = -len:len
             for l = -wid:wid                 
                 if  ( f(i+k,j+l) == 0 )
                 g(i,j)=0 ;
                 end
             end
         end
     end
 end
figure;
imshow(g)
dilation(g);
%  imshow(g);
