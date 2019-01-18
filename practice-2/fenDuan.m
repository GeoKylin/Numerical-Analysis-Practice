function yi=fenDuan(X,Y,xi)
% fenDuan 插值多项式，其中
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
for i=1:n-1 %将所有节点按X升序排序
    for j=i+1:n
        if X(i)>X(j)
            t=X(i);tt=Y(i);
            X(i)=X(j);Y(i)=Y(j);
            X(j)=t;Y(j)=tt;
        end
    end
end
for i=1:length(xi)%计算每个被估计点
    for j=2:n %寻找被估计点所在区间
        if xi(i)<=X(j)
            x0=X(j-1);x1=X(j);%区间端点
            y0=Y(j-1);y1=Y(j);%区间端点函数值
            break;
        end
    end
    yi(i)=(xi(i)-x1)*y0/(x0-x1)+(xi(i)-x0)*y1/(x1-x0);%计算估计值
end