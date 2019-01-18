clear
close all
clc
format long

syms x;
f=x^3+2*x^2+10*x-20;
X(1,1)=0;
X(1,2)=1;
e=1e-4;

X(2,1)=1;
X(2,2)=X(1,2)+subs(f,x,X(1,2));
X(2,3)=abs(X(2,2)-X(1,2));

k=2;
while X(k,3)>=e
    k=k+1;
    X(k,1)=k-1;
    X(k,2)=X(k-1,2)-subs(f,x,X(k-1,2))/(subs(f,x,X(k-1,2))-subs(f,x,X(k-2,2)))*(X(k-1,2)-X(k-2,2));
    X(k,3)=abs(X(k,2)-X(k-1,2));
end

X