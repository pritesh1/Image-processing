%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function for a opening
% getting the image first
% giving m and n the same size as f
% Using the given 'One' function
% function out of it for creating a dilation
% Reference- Lecture 8.class notes


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc;
% f = imread ( 'shadow1.gif' );
%  imshow('shadow1.gif');



function dilation(f)
[m,n]= size(f);

% define a g with one x dimension co-ordinate and 256 y co ordinates
h= One(m,n);

%two loops scanning the entire image and calculating the count of g 
% Border effects
len=2;
wid=3;
 for i = (len+1):m-len-1 
     for j= wid+1:n-wid-1
         for k = -len:len
             for l = -wid:wid                 
                 if  ( f(i+k,j+l) == 1 )
                 h(i,j)=1 ;
                 end
             end
         end
     end
end
figure;
imshow(h);
