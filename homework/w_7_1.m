clear
close all
clc
format short

syms x y;
f=x^2+100*y^2;
X(1,1)=0;
X(1,2)=0;
X(1,3)=0;
xn=0.3;
h=0.1;

k=1;
while X(k,2)<xn
    k=k+1;
    X(k,1)=k-1;
    X(k,2)=X(k-1,2)+h;
    X(k,3)=X(k-1,3)+h*subs(subs(f,x,X(k-1,2)),y,X(k-1,3));
end

X