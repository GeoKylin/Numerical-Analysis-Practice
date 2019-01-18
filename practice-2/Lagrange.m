function yi=Lagrange(x,y,xi)
% Lagrange 插值多项式，其中
% x为向量，全部的插值节点；
% y为向量，插值节点处的函数值；
% xi为向量，被估计函数自变量；
% yi为向量，xi处的函数估计值
n=length(x);m=length(y);%X、Y长度
if n~=m % 输入的插值点与它的函数值应有相同的个数
    error('The lengths of X and Y must be equal!');%报错
    return;
end
for jj=1:length(xi)%对每个被估计函数自变量做计算
    p=zeros(1,n);%单项式初始化
    for k=1:n%计算每个单项式
        t=ones(1,n);%单项式的因式初始化
        for j=1:n%计算每个因式
            if j~=k%输入的插值节点必须互异
                if abs(x(k)-x(j))<eps
                    error('the DATA is error');%报错
                    return
                end
                t(j)=(xi(jj)-x(j))/(x(k)-x(j));%计算因式
            end
        end
        p(k)=prod(t);%计算单项式
    end
    yi(jj)=sum(y.*p);%计算函数估计值
end