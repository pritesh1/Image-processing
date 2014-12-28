% function largestComp = largestComponentnew(f)
f = imread ( 'shadow1scaled.gif' );
ff = bwlabel( f, 4);
[m,n]=size(ff);
mostFrequent = zeros(size(ff),1);

for i = 1:m
    for j = 1:n
        if ( ff(i,j) == 0 )
        else
        mostFrequent(ff(i,j)) = mostFrequent(ff(i,j))+1;
        end
    end
end

max = 0;

for i = 1:size(ff)
    if(mostFrequent(i) > max)
        max = mostFrequent(i);
        region1 = i;
    end
end
max = 0;

for j = 1:size(ff)
    if(mostFrequent(j) > max)
        max = mostFrequent(j);
        region2 = j;
    end
end
max = 0;

for k = 1:size(ff)
    if(mostFrequent(k) > max)
        max = mostFrequent(k);
        region3 = k;
    end
end
largestComp = zeros(m,n);

for i = 1:m
    for j = 1:n
        if ( ff(i,j) == region3)
            largestComp(i,j) = 255;
        end
    end
end

imshow(largestComp);






