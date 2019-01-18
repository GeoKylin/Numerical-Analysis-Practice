clear
close all
clc
format short

syms x y;
f=-y-x*y^2;
X(1,1)=0;
X(1,2)=0;
X(1,3)=1;
xn=0.6;
h=0.2;

k=1;
while X(k,2)<xn
    k=k+1;
    X(k,1)=k-1;
    X(k,2)=X(k-1,2)+h;
    X(k,3)=X(k-1,3)+h*subs(subs(f,x,X(k-1,2)),y,X(k-1,3));
end

X