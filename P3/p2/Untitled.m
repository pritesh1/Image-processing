clc;
f = imread ( 'shadow1scaled.gif' );
% [m,n]=size(f);
% ff = zeros(m,n);
% 
% for i = 1:m
%     for j = 1:n        
%         if f(i,j) > 200
%             ff(i,j) = 1;
%         end
%     end
% end

% % Label the image by region
% fff = medfilt2(ff, [5 5]);
flabel = bwlabel(f, 4);
% max=0;
imtool(flabel);
% h=largestComponentnew(flabel);
R1 = zeros(m,n);
R2 = zeros(m,n);
R3 = zeros(m,n);
% R4 = zeros(m,n);
% R5 = zeros(m,n);
% R6 = zeros(m,n);
% R7 = zeros(m,n);
% R8 = zeros(m,n);
% R9 = zeros(m,n);
% R10 = zeros(m,n);
% R11 = zeros(m,n);
% R12 = zeros(m,n);
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
%                 else
%                  if flabel(i,j) == 9
%                     R4(i,j) = 1;
%                  end
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
title('Separated Region #3 of match1a');
% subplot(2,2,4);
% imshow(R4);
% title('Separated Region #4 of match1a');
% subplot(2,3,5);
% imshow(R5);
% title('Separated Region #5 of match1a');
% subplot(2,3,6);
% imshow(R6);
% title('Separated Region #6 of match1a');