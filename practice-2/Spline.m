function yi=Spline(X,Y,M,xi,s)
% Spline 插值多项式，其中
%  X为向量，全部的插值节点；
%  Y为向量，插值节点处的函数值；
%  M为向量，边界条件，包含两个数值；
% xi为向量，被估计函数自变量；
%  s为整数，1表示第一类边界条件，2表示第二类边界条件；
% yi为向量，xi处的函数估计值
n=length(X);%X的长度
if length(Y)~=n %输入的插值点与它的函数值应有相同的个数
    error('The lengths of X and Y must be equal!');%报错
    return;
elseif length(M)~=2 %M的长度应为2
    error('The length of M must be 2!');%报错
    return;
elseif s~=1&&s~=2 %s的值应为1或2
    error('s must be 1 or 2!');%报错
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
for i=2:n
    h(i-1)=X(i)-X(i-1);%计算h(i)
    c(i-1)=(Y(i)-Y(i-1))/h(i-1);%计算均差c(i)
end
for i=1:n-2
    u(i)=h(i)/(h(i)+h(i+1));%计算u(i)
    r(i)=1-u(i);%计算r(i)
    g(i+1)=6*(c(i+1)-c(i))/(h(i)+h(i+1));%计算g(i)
end
if s==1 %第一类边界条件
    g(1)=6*(c(1)-M(1))/h(1);
    g(n)=6*(M(2)-c(n-1))/h(n-1);
    A=zeros(n,n);%初始化系数矩阵
    A(1,1)=2;A(1,2)=1;
    A(n,n-1)=1;A(n,n)=2;
    for i=2:n-1%系数矩阵赋值
        A(i,i-1)=u(i-1);
        A(i,i)=2;
        A(i,i+1)=r(i-1);
    end
    for i=1:n%赋值常数项矩阵
        G(i,1)=g(i);
    end
    m=A\G;%求解m
else  %第二类边界条件
    m(1)=M(1);m(n)=M(2);
    A=zeros(n-2,n-2);%初始化系数矩阵
    A(1,1)=2;A(1,2)=r(1);
    A(n-2,n-3)=u(n-2);A(n-2,n-2)=2;
    for i=2:n-3%系数矩阵赋值
        A(i,i-1)=u(i);
        A(i,i)=2;
        A(i,i+1)=r(i);
    end
    gg(1)=g(2)-u(1)*M(1);gg(n-2)=g(n-1)-r(n-2)*M(2);
    for i=1:n-4
        gg(i+1)=g(i+2);
    end
    for i=1:n-2%赋值常数项矩阵
        G(i,1)=gg(i);
    end
    mm=A\G;
    m(2:n-1)=mm;%求解m
end
for i=1:length(xi)%计算每个被估计点
    for j=2:n %寻找被估计点所在区间
        if xi(i)<=X(j)
            x0=X(j-1);x1=X(j);%区间端点
            m0=m(j-1);m1=m(j);%区间端点二阶导数值
            y0=Y(j-1);y1=Y(j);%区间端点函数值
            h1=h(j-1);%区间长度
            break;
        end
    end
    yi(i)=(m0*((x1-xi(i))^3)/(6*h1))+(m1*((xi(i)-x0)^3)/(6*h1))+...
        ((y0-m0*(h1^2)/6)*(x1-xi(i))/h1)+((y1-m1*(h1^2)/6)*(xi(i)-x0)/h1);%计算估计值
end