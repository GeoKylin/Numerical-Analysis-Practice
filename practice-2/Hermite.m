function yi=Hermite(X,Y,M,xi)
% 两点三次 Hermite 插值多项式，其中
% X为向量，全部的插值节点；
% Y为向量，插值节点处的函数值；
% M为向量，插值点处的导数值；
% xi为向量，被估计函数自变量；
% yi为向量，xi处的函数估计值。
n=length(X);m=length(Y);k=length(M);%X、Y、M的长度
if n==2&&m==2&&k==2 %X、Y、M的长度应为2
    for i=1:n %输入的插值节点必须互异
        for j=i+1:n
            if abs(X(i)-X(j))<eps %计算机所能识别的精度
                error('The data X must be unequal from each other!');%报错
                return;
            end
        end
    end
    for i=1:length(xi) %计算每个被估计点的参数和函数值
        a0(i)=(1+2*(xi(i)-X(1))/(X(2)-X(1)))*((xi(i)-X(2))/(X(1)-X(2)))^2;%参数a0
        a1(i)=(1+2*(xi(i)-X(2))/(X(1)-X(2)))*((xi(i)-X(1))/(X(2)-X(1)))^2;%参数a1
        b0(i)=(xi(i)-X(1))*((xi(i)-X(2))/(X(1)-X(2)))^2;%参数b0
        b1(i)=(xi(i)-X(2))*((xi(i)-X(1))/(X(2)-X(1)))^2;%参数b1
        yi(i)=Y(1)*a0(i)+Y(2)*a1(i)+M(1)*b0(i)+M(2)*b1(i);%估计值
    end    
else
    error('The lengths of X, Y and M must be 2!');%报错
    return;
end