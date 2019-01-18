function I=Guass_Laguerre(f,x,a,b,n)
%Guass_Laguerre 求积公式
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
if (abs(a)==inf&&abs(b)==inf)||(abs(a)~=inf&&abs(b)~=inf)
    error('One and only one of a and b must be Inf!');
    return;
end

xi(1,1)=1;
A(1,1)=1;
xi(2,1:2)=[3.4142136 0.5857864];
A(2,1:2)=[0.1464466 0.8535534];
xi(3,1:3)=[6.2899451 2.2942804 0.4157746];
A(3,1:3)=[0.0103893 0.2785177 0.7110930];
xi(4,1:4)=[9.3950709 4.5366203 1.7457611 0.3225477];
A(4,1:4)=[0.0005393 0.0388879 0.3574187 0.6031541];
xi(5,1:5)=[12.6408008 7.0858100 3.5964258 1.4134031 0.2635603];
A(5,1:5)=[0.0000234 0.0036118 0.0759424 0.3986668 0.5217556];
xi(6,1:6)=[15.9828740 9.8374674 5.7751436 2.9927363 1.1889321 0.2228466];
A(6,1:6)=[0.0000009 0.0002610 0.0103992 0.1133734 0.4170008 0.4589647];

format long
syms t
I=0;
if b==inf
    ch=['t+' num2str(a,'%.15f')];
    f=['exp(t)*(' char(subs(f,x,ch)) ')'];
elseif b==-inf
    ch=['-t+' num2str(a,'%.15f')];
    f=['exp(t)*(' char(subs(f,x,ch)) ')'];
elseif a==-inf
    ch=['-t+' num2str(b,'%.15f')];
    f=['-exp(t)*(' char(subs(f,x,ch)) ')'];
elseif a==inf
    ch=['t+' num2str(b,'%.15f')];
    f=['-exp(t)*(' char(subs(f,x,ch)) ')'];
end

f=simplify(sym(f))
for i=1:n
    I=I+double(A(n,i)*subs(f,t,xi(n,i)));
end