function EdgeDetection(I0, I1e, I2e, I3e, I4e, I5e, I6e, I7e, I8e)

% Sobel edge detection of all the expanded images

ISobel1 = edge(I1e, 'sobel');
figure;
subplot(4,2,1);
imshow(ISobel1);
title('Sobel edge detection of I1e');
ISobel2 = edge(I2e, 'sobel');
subplot(4,2,2);
imshow(ISobel2);
title('Sobel edge detection of I2e');
ISobel3 = edge(I3e, 'sobel');
subplot(4,2,3);
imshow(ISobel3);
title('Sobel edge detection of I3e');
ISobel4 = edge(I4e, 'sobel');
subplot(4,2,4);
imshow(ISobel4);
title('Sobel edge detection of I4e');
ISobel5 = edge(I5e, 'sobel');
subplot(4,2,5);
imshow(ISobel5);
title('Sobel edge detection of I5e');
ISobel5 = edge(I6e, 'sobel');
subplot(4,2,6);
imshow(ISobel5);
title('Sobel edge detection of I6e');
ISobel5 = edge(I7e, 'sobel');
subplot(4,2,7);
imshow(ISobel5);
title('Sobel edge detection of I7e');
ISobel5 = edge(I8e, 'sobel');
subplot(4,2,8);
imshow(ISobel5);
title('Sobel edge detection of I8e');
 
% Canny edge detection of the original image  with different sigma values
% to closely match the Sobel edge detection of the expanded images

I0=imread('lake.bmp');
 
Iedges1 = edge(I0, 'canny', [], 6);
figure;
subplot(4,2,1);
imshow(Iedges1);
title('Canny edge detection for sigma=8');

Iedges2 = edge(I0, 'canny', [], 10); 
subplot(4,2,2);
imshow(Iedges2);
title('Canny edge detection for sigma=12');

Iedges3 = edge(I0, 'canny', [], 16);
subplot(4,2,3);
imshow(Iedges3);
title('Canny edge detection for sigma=17');

Iedges4 = edge(I0, 'canny', [], 22);
subplot(4,2,4);
imshow(Iedges4);
title('Canny edge detection for sigma=22');

Iedges5 = edge(I0, 'canny', [], 27);
subplot(4,2,5);
imshow(Iedges5);
title('Canny edge detection for sigma=27');

Iedges6 = edge(I0, 'canny', [], 32);
subplot(4,2,6);
imshow(Iedges6);
title('Canny edge detection for sigma=32');

Iedges7 = edge(I0, 'canny', [], 38);
subplot(4,2,7);
imshow(Iedges7);
title('Canny edge detection for sigma=38');

Iedges8 = edge(I0, 'canny', [], 45);
subplot(4,2,8);
imshow(Iedges8);
title('Canny edge detection for sigma=45');


% For L=0 Canny edge detection and finding the 50 largest edge components

canny0 = edge(I0, 'canny', [], 6);
f1=bwlabel(canny0);
figure;subplot(2,2,1);
imshow(f1);title('Canny edge detection for L=0');

g1=zero(1,123);        
[m,n]=size(f1);

for i=1:m
    for j=1:n
        for k=1:123
            if f1(i,j)==k
               g1(k)=g1(k)+1;
            end
        end
    end
end

M1 = (f1==1)|(f1==5)|(f1==6)|(f1==7)|(f1==9)|(f1==10)|(f1==11)|(f1==15)|(f1==16)|(f1==17)|(f1==18)|(f1==21)|(f1==23)|(f1==25)|(f1==27)|(f1==29)|(f1==31)|(f1==32)|(f1==33)|(f1==36)|(f1==39)|(f1==43)|(f1==45)|(f1==50)|(f1==53)|(f1==56)|(f1==59)|(f1==60)|(f1==61)|(f1==70)|(f1==72)|(f1==76)|(f1==79)|(f1==84)|(f1==86)|(f1==88)|(f1==90)|(f1==96)|(f1==97)|(f1==100)|(f1==101)|(f1==103)|(f1==107)|(f1==108)|(f1==109)|(f1==110)|(f1==115)|(f1==117)|(f1==118)|(f1==71);
subplot(2,2,2);
imshow(M1);title('50 largest edge components for L=0');
    
% For L=2 Canny edge detection and finding the 50 largest edge components

canny2 = edge(I2e, 'canny', [], 6);
f2=bwlabel(canny2);
subplot(2,2,3);
imshow(f2);title('Canny edge detection for L=2');

g2=zero(1,100);        
[m,n]=size(f2);

for i=1:m
    for j=1:n
        for k=1:100
            if f2(i,j)==k
               g2(k)=g2(k)+1;
            end
        end
    end
end

M2 = (f2==1)|(f2==2)|(f2==4)|(f2==5)|(f2==6)|(f2==7)|(f2==8)|(f2==10)|(f2==11)|(f2==13)|(f2==15)|(f2==17)|(f2==18)|(f2==20)|(f2==21)|(f2==22)|(f2==24)|(f2==27)|(f2==28)|(f2==29)|(f2==30)|(f2==33)|(f2==38)|(f2==45)|(f2==46)|(f2==47)|(f2==49)|(f2==50)|(f2==51)|(f2==57)|(f2==60)|(f2==65)|(f2==66)|(f2==68)|(f2==70)|(f2==72)|(f2==73)|(f2==77)|(f2==78)|(f2==81)|(f2==82)|(f2==84)|(f2==86)|(f2==87)|(f2==88)|(f2==91)|(f2==93)|(f2==58)|(f2==59)|(f2==3);
subplot(2,2,4);
imshow(M2);title('50 largest edge components for L=2');


