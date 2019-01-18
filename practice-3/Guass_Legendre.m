function I=Guass_Legendre(f,x,a,b,n)
%Guass_Legendre 求积公式
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
if abs(a)==inf||abs(b)==inf
    error('a and b can not be Inf!');
    return;
end

xi(1,1)=0;
A(1,1)=2;
xi(2,1:2)=[0.5773503 -0.5773503];
A(2,1:2)=[1 1];
xi(3,1:3)=[0.7745967 -0.7745967 0];
A(3,1:3)=[0.5555556 0.5555556 0.8888889];
xi(4,1:4)=[0.8611363 -0.8611363 0.3399810 -0.3399810];
A(4,1:4)=[0.3478548 0.3478548 0.6521452 0.6521452];
xi(5,1:5)=[0.9061798 -0.9061798 0.5384693 -0.5384693 0];
A(5,1:5)=[0.2369269 0.2369269 0.4786287 0.4786287 0.5688889];
xi(6,1:6)=[0.9324695 -0.9324695 0.6612094 -0.6612094 0.2386192 -0.2386192];
A(6,1:6)=[0.1713245 0.1713245 0.3607616 0.3607616 0.4679139 0.4679139];

format long
syms t
ch=[num2str((b-a)/2,'%.15f') '*t+' num2str((b+a)/2,'%.15f')];
f=subs(f,x,ch);
f=simplify(f);
I=0;
for i=1:n
    I=I+double(A(n,i)*subs(f,t,xi(n,i)));
end
I=(b-a)/2*I;