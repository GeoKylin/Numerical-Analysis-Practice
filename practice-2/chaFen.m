function C=chaFen(X,Y)
%�����ĺ���
%X���Ա�������
%Y�����������

n=length(X);m=length(Y);
% ����Ĳ�ֵ�������ĺ���ֵӦ����ͬ�ĸ���
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