function largestComp = Conncomp(flabel)
[m,n]=size(flabel);



biggestArea = zero(1,10000);

for i = 1:m
    for j = 1:n
        if  ( flabel(i,j) == 0 )
        else
        biggestArea(flabel(i,j)) = biggestArea(flabel(i,j))+1;
        end
    end
end

max = 0;

for i = 1:10000
    if(biggestArea(i) > max)
        max = biggestArea(i);
        reg = i;
    end
end

largestComp = zeros(m,n);

for i = 1:m
    for j = 1:n
        if ( flabel(i,j) == reg)
            largestComp(i,j) = 255;
        end
    end
end

imtool(largestComp);
imwrite(largestComp,'reg.jpg')
