clear
close all
clc
format short g

syms x;
f=exp(-x);
X(1,1)=0;
X(1,2)=0.5;
e=1e-5;

k=2;
X(k,1)=k-1;
X(k,2)=subs(f,x,X(k-1,2));
X(k,3)=abs(X(k,2)-X(k-1,2));
while X(k,3)>=e
    k=k+1;
    X(k,1)=k-1;
    X(k,2)=subs(f,x,X(k-1,2));
    X(k,3)=abs(X(k,2)-X(k-1,2));
end

X