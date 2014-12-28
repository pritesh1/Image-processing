%%%%%%%%%%%%%%%%%%%%%%%%%%

% Matlab Project 2
%
% Authors Pritesh Kanani
%         Indrajit Murugappan
%         Manjot Singh
%
% The purpose of this project is to perform
% opening of an image to remove outlined features

% % % % % % % % % % % % % % 



clc;
f = imread ( 'shadow1.gif' );
figure;
imshow('shadow1.gif');

% Do opening of the image
erosion(f);


