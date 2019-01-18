clear
close all
clc
format long

syms x;
f=1-115/(x^2);
fd=230/(x^3);
X(1,1)=0;
X(1,2)=10;
e=1e-3;

k=2;
X(k,1)=k-1;
X(k,2)=X(k-1,2)-subs(f,x,X(k-1,2))/subs(fd,x,X(k-1,2));
X(k,3)=abs(X(k,2)-X(k-1,2));
while X(k,3)>=e
    k=k+1;
    X(k,1)=k-1;
    X(k,2)=X(k-1,2)-subs(f,x,X(k-1,2))/subs(fd,x,X(k-1,2));
    X(k,3)=abs(X(k,2)-X(k-1,2));
end

X