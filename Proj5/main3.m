clc;
a = imread('random1.gif');
b = imread('random2.gif');
 Threshold = input('Enter the threshold value:');
 e = input('Enter the epsilon value:');
 N = input('Enter the iterations :');

%  figure,imshow('random1.gif');

% Define e , Define Threshold, Define N


[m,n] = size(b);

C= zero3d(m,n,8);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Disparity one-seven
for l= 1:8    
for i=1+l-1:m-l+1
    for j=1:n
          if ((a(i,j)==0) && (b(i+l-1,j))== 0)
%         if (a(i,j)== b(i+l-1,j))
       C(i,j,l)= 0;
          end
    end
end
end

I=zero(m,n);


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% l corresponds disparity
for u = 1:N

G= zero3d(m,n,8);

for l= 3:6
for i=3:m-2
    for j=3:n-2
       if ( C(i,j-2,l)+C(i-1,j-2,l)+C(i-2,j-2,l)+C(i+1,j-2,l)+C(i+2,j-2,l)+C(i,j+2,l)+C(i-1,j+2,l)+C(i-2,j+2,l)+C(i+1,j+2,l)+C(i+2,j+2,l)+C(i+2,j,l)+C(i+2,j-1,l)+C(i+2,j+1,l)+C(i-2,j,l)+C(i-2,j-1,l)+C(i-2,j+1,l)+ C(i+1,j,l)+ C(i+1,j+1,l)+ C(i,j+1,l)+ C(i-1,j,l)+ C(i-1,j-1,l)+ C(i,j-1,l)+ C(i+1,j-1,l)+ C(i-1,j+1,l) - e*(C(i,j-2,l+2)+C(i-1,j-2,l+2)+C(i-2,j-2,l+2)+C(i+1,j-2,l+2)+C(i+2,j-2,l+2)+C(i,j+2,l+2)+C(i-1,j+2,l+2)+C(i-2,j+2,l+2)+C(i+1,j+2,l+2)+C(i+2,j+2,l+2)+C(i+2,j,l+2)+C(i+2,j-1,l+2)+C(i+2,j+1,l+2)+C(i-2,j,l+2)+C(i-2,j-1,l+2)+C(i-2,j+1,l+2)+C(i,j,l+2)+ C(i+1,j,l+2)+ C(i+1,j+1,l+2)+ C(i,j+1,l+2)+ C(i-1,j,l+2)+ C(i-1,j-1,l+2)+ C(i,j-1,l+2)+ C(i+1,j-1,l+2)+ C(i-1,j+1,l+2)     +       C(i,j-2,l+1)+C(i-1,j-2,l+1)+C(i-2,j-2,l+1)+C(i+1,j-2,l+1)+C(i+2,j-2,l+1)+C(i,j+2,l+1)+C(i-1,j+2,l+1)+C(i-2,j+2,l+1)+C(i+1,j+2,l+1)+C(i+2,j+2,l+1)+C(i+2,j,l+1)+C(i+2,j-1,l+1)+C(i+2,j+1,l+1)+C(i-2,j,l+1)+C(i-2,j-1,l+1)+C(i-2,j+1,l+1)+C(i,j,l+1)+ C(i+1,j,l+1)+ C(i+1,j+1,l+1)+ C(i,j+1,l+1)+ C(i-1,j,l+1)+ C(i-1,j-1,l+1)+ C(i,j-1,l+1)+ C(i+1,j-1,l+1)+ C(i-1,j+1,l+1)     +       C(i,j-2,l-1)+C(i-1,j-2,l-1)+C(i-2,j-2,l-1)+C(i+1,j-2,l-1)+C(i+2,j-2,l-1)+C(i,j+2,l-1)+C(i-1,j+2,l-1)+C(i-2,j+2,l-1)+C(i+1,j+2,l-1)+C(i+2,j+2,l-1)+C(i+2,j,l-1)+C(i+2,j-1,l-1)+C(i+2,j+1,l-1)+C(i-2,j,l-1)+C(i-2,j-1,l-1)+C(i-2,j+1,l-1)+C(i,j,l-1)+ C(i+1,j,l-1)+ C(i+1,j+1,l-1)+ C(i,j+1,l-1)+ C(i-1,j,l-1)+ C(i-1,j-1,l-1)+ C(i,j-1,l-1)+ C(i+1,j-1,l-1)+ C(i-1,j+1,l-1)   +      C(i,j-2,l-2)+C(i-1,j-2,l-2)+C(i-2,j-2,l-2)+C(i+1,j-2,l-2)+C(i+2,j-2,l-2)+C(i,j+2,l-2)+C(i-1,j+2,l-2)+C(i-2,j+2,l-2)+C(i+1,j+2,l-2)+C(i+2,j+2,l-2)+C(i+2,j,l-2)+C(i+2,j-1,l-2)+C(i+2,j+1,l-2)+C(i-2,j,l-2)+C(i-2,j-1,l-2)+C(i-2,j+1,l-2)+C(i,j,l-2)+ C(i+1,j,l-2)+ C(i+1,j+1,l-2)+ C(i,j+1,l-2)+ C(i-1,j,l-2)+ C(i-1,j-1,l-2)+ C(i,j-1,l-2)+ C(i+1,j-1,l-2)+ C(i-1,j+1,l-2))) > Threshold;
       G(i,j,l)=0;      
       end
    end
end
end


for l= 1:8    
for i=2:m-l
% for i=1:m
    for j=1:n              
      C(i,j,l)= G(i,j,l);      
    end
end
end

end




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Representation of Dots for I value
 for i=9:m-8
    for j=1:n  
        for l=1:8
       if (C(i,j,l)== 0)
       I(i,j)=(l/8)*255 ;     
       end           
        end
    end
 end
% Y = 255*uint8(I);
figure, imshow(I,[]);




