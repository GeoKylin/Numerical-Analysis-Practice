function I=Guass_Hermite(f,x,a,b,n)
%Guass_Hermite 求积公式
% f为字符型，被积函数
% x为被积变量
% a为积分下限
% b为积分上限
% n为1-6,节点数
% I为积分的估计值

if ischar(f)==0||ischar(x)==0
    error('f and x must be character!');
    return;
end
if max(size(a))>1||max(size(b))>1||max(size(n))>1
    error('The size of a, b and n must be 1!');
    return;
end
if n~=fix(n)||n<1||n>6
    error('n must be 1-6(int) !');
    return;
end
if abs(a)~=inf||abs(b)~=inf
    error('a and b both must be Inf!');
    return;
end

xi(1,1)=0;
A(1,1)=1.7724539;
xi(2,1:2)=[0.7071068 -0.7071068];
A(2,1:2)=[0.8862269 0.8862269];
xi(3,1:3)=[1.2247449 -1.2247449 0];
A(3,1:3)=[0.2954090 0.2954090 1.1816359];
xi(4,1:4)=[1.6506801 -1.6506801 0.5246476 -0.5246476];
A(4,1:4)=[0.0813128 0.0813128 0.8049141 0.8049141];
xi(5,1:5)=[2.0201829 -2.0201829 0.9585725 -0.9585725 0];
A(5,1:5)=[0.0199532 0.0199532 0.3936193 0.3936193 0.9453087];
xi(6,1:6)=[2.3506050 -2.3506050 1.3358491 -1.3358491 0.4360774 -0.4360774];
A(6,1:6)=[0.0045300 0.0045300 0.1570673 0.1570673 0.7246296 0.7246296];

format long
syms t
I=0;
if a==b
    I=0;
else
    if b==inf
        ch='t';
        f=['exp(t^2)*(' char(subs(f,x,ch)) ')'];
    elseif b==-inf
        ch='-t';
        f=['-exp(t^2)*(' char(subs(f,x,ch)) ')'];
    end
    f=simplify(sym(f));
    for i=1:n
        I=I+double(A(n,i)*subs(f,t,xi(n,i)));
    end
end