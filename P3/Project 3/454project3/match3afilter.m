function fff = match3afilter(f)
[m, n] = size(f);
ff = zeros(m,n);
fff = zeros(m,n);


for i = 2:(m-1)
    for j = 2:(n-1)
        if f(i,j)>0 && f(i+1, j)> 0 && f(i-1, j)>0 && f(i,j+1 )>0 && f(i,j-1)>0
           
            ff(i,j) = 1;
        end
    end
end
figure;
subplot(1,2,1);
imshow(ff);
title('image match3a after erosion');

for i = 2:(m-1)
    for j = 2:(n-1)
            if ff(i,j)>0 || ff(i+1, j)> 0 || ff(i-1, j)>0 || ff(i,j+1 )>0 || ff(i,j-1)>0
           
            fff(i,j) = 1;
            end
    end
end
subplot(1,2,2);
imshow(fff);
title('final result');



