%%%%%%%%%%%%% The main.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%     To construct model database and to finish the shape recognition 
%      of four test images (shadow1, shadow1rotated, shadow1streaks, penn256) by
%      computing invariant moments. 
%
%      Processing Flow:
%      1.  Read and label the input image
%      2.  Compute the feature of labeled image, and create the database
%      3.  Read the test image needed
%      4.  Filter the input test image, and compute its ROIs' features
%      5.  Use invariant moments for shape recognition and state the 
%          conclusion 
%
%  The following functions are called:
%      shadow1scaled()
%      shadow1()
%      shadow1rotated()
%      shadow1streaks()
%      penn256()
%      calculations()
%      Shaperecog()
%
%  Author:      Pritesh Kanani, Manjot Singh, Indrajit Murugappan
%  Date:        10/11/2013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Read the database image
f = imread ( 'shadow1scaled.bmp' );

% Use the function shadow1scaled.m to compute features of ROIs 
[a,b,c] = shadow1scaled(f);

% Read the 'shadow1' image 
f1 = imread('shadow1.bmp');

% Use the function shadow1.m to compute features of ROIs 
[e,f,g,h] = shadow1(f1);

% Read the 'shadow1rotated' image
f2 = imread('shadow1rotated.bmp');

% Use the function shadow1rotated.m to compute features of ROIs 
[i,j,k,l] = shadow1rotated(f2);

% Read the 'shadow1streaks' image
f3 = imread('shadow1streaks.bmp');

% Use the function shadow1streaks.m to compute features of ROIs 
[m,n,o,p] = shadow1streaks(f3);

% Read the 'penn256' image
f4 = imread('penn256.bmp');

% Use the function penn256.m to compute features of ROIs 
[q,r,s,t] = penn256(f4);

% Perform shape recognition for all test images
Shaperecog(a,b,c,e,f,g,h,1);
Shaperecog(a,b,c,i,j,k,l,2);
Shaperecog(a,b,c,m,n,o,p,3);
Shaperecog(a,b,c,q,r,s,t,4);

