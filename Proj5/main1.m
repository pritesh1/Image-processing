clc;
a = imread('random1.gif');
b = imread('random2.gif');
Threshold = input('Enter the threshold value:');
e = input('Enter the epsilon value:');
N = input('Enter the iterations :');

figure,imshow('random1.gif');

% Define e , Define Threshold


[m,n] = size(b);

C= zero3d(m,n,8);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Disparity one-seven
for l= 1:7    
for i=8:m-7
    for j=1:n
       if (a(i,j)== b(i+l,j))
       C(i,j,l)= 0;
       end           
    end
end
end

I=zero(m,n);

% Disparity zero
for i=8:m-7
    for j=1:n
        if (a(i,j)== b(i,j))
        C(i,j,8)= 0;
        end       
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% l corresponds disparity
for u = 1:N

G= zero3d(m,n,8);

for l= 2:6    
for i=9:m-8
    for j=2:n-1       
     if ( ( -e*( C(i,j,l+1)+ C(i+1,j,l+1)+ C(i+1,j+1,l+1)+ C(i,j+1,l+1)+ C(i-1,j,l+1)+ C(i-1,j-1,l+1)+ C(i,j-1,l+1)+ C(i+1,j-1,l+1)+ C(i-1,j+1,l+1)     +      C(i,j,l-1)+ C(i+1,j,l-1)+ C(i+1,j+1,l-1)+ C(i,j+1,l-1)+ C(i-1,j,l-1)+ C(i-1,j-1,l-1)+ C(i,j-1,l-1)+ C(i+1,j-1,l-1)+ C(i-1,j+1,l-1))   +      C(i+1,j,l)+ C(i+1,j+1,l)+ C(i,j+1,l)+ C(i-1,j,l)+ C(i-1,j-1,l)+ C(i,j-1,l)+ C(i+1,j-1,l)+ C(i-1,j+1,l)) > Threshold);
       G(i,j,l)=0;      
    end
end
end
end


for l= 2:6    
for i=9:m-8
    for j=2:n-1              
      C(i,j,l)= G(i,j,l);      
    end
end
end

end




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Representation of Dots for I value
 for i=8:m-7
    for j=1:n  
        for l=1:8
       if (C(i,j,l)== 0)
       I(i,j)=(l/8)*255;     
       end           
        end
    end
 end
% Y = 255*uint8(I);
figure, imshow(I,[]);




