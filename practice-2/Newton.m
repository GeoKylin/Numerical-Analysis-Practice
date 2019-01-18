function yi=Newton(X,Y,xi)
% Newton 插值多项式，其中
% X为向量，全部的插值节点；
% Y为向量，插值节点处的函数值；
% xi为向量，被估计函数自变量；
% yi为向量，xi处的函数估计值
n=length(X);m=length(Y);%X、Y长度
if n~=m %输入的插值点与它的函数值应有相同的个数
    error('The lengths of X and Y must be equal!');%报错
    return;
end
for i=1:n %输入的插值节点必须互异
    for j=i+1:n
        if abs(X(i)-X(j))<eps %计算机所能识别的精度
            error('The data X must be unequal from each other!');%报错
            return;
        end
    end
end
C=zeros(n,n);%初始化均差矩阵
C(1,1)=Y(1);
for i=2:n %计算均差矩阵
    C(i,1)=Y(i);
    for j=2:i
        C(i,j)=(C(i,j-1)-C(i-1,j-1))/(X(i)-X(i-j+1));
    end
end
k=length(xi);%被估计点的个数
for i=1:k %第i个被估计点
    W(i,1)=1;%单项式的连乘项
    P(i,1)=W(i,1)*C(1,1);%每个单项式
    for j=2:n %第j个单项式
        W(i,j)=W(i,j-1)*(xi(i)-X(j-1));%计算连乘项
        P(i,j)=W(i,j)*C(j,j);%计算单项式
    end
    yi(i)=sum(P(i,:));%单项式叠加，计算估计值
end