function [Q] = multiply(M,N)
[s,r]=size(M);
[r,x]=size(N);

Q= zero(s,x);
for i=1:s
    for j=1:x
        Q(i,j)=0; 
        for k=1:r
            Q(i,j)=Q(i,j)+M(i,k)* N(k,j) ;          
        end
    end
end