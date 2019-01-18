function C=chaFen(X,Y)
%求均差的函数
%X是自变量数组
%Y是因变量数组

n=length(X);m=length(Y);
% 输入的插值点与它的函数值应有相同的个数
if n~=m
    error('The lengths of X and Y must be equal!');
    return;
end

for i=1:n
    for j=i+1:n
        if abs(X(i)-X(j))<eps
            error('The data X must be unequal from each other!');
            return;
        end
    end
end

C=zeros(n,n);
C(1,1)=Y(1);
for i=2:n
    C(i,1)=Y(i);
    for j=2:i
        C(i,j)=(C(i,j-1)-C(i-1,j-1))/(X(i)-X(i-j+1));
    end
end