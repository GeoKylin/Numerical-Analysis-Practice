clear
close all
clc
format short

syms y;
f=8-3*y;
X(1,1)=0;
X(1,2)=0;
X(1,3)=2;
xn=0.4;
h=0.2;

k=1;
while X(k,2)<xn
    k=k+1;
    X(k,1)=k-1;
    X(k,2)=X(k-1,2)+h;
    
    K0=subs(f,y,X(k-1,3));
    K1=subs(f,y,X(k-1,3)+h/2*K0);
    K2=subs(f,y,X(k-1,3)+h/2*K1);
    K3=subs(f,y,X(k-1,3)+h*K2);
    
    X(k,3)=X(k-1,3)+h/6*(K0+2*K1+2*K2+K3);
end

X