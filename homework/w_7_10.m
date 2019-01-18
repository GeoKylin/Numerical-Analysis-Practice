clear
close all
clc
format long

syms x y;
f=3*x-2*y;
X(1,1)=0;
X(1,2)=0;
X(1,3)=1;
xn=0.5;
h=0.1;

k=1;
while k<4
    k=k+1;
    X(k,1)=k-1;
    X(k,2)=X(k-1,2)+h;
    
    K0=subs(subs(f,y,X(k-1,3)),x,X(k-1,2));
    K1=subs(subs(f,y,X(k-1,3)+h/2*K0),x,X(k-1,2)+h/2);
    K2=subs(subs(f,y,X(k-1,3)+h/2*K1),x,X(k-1,2)+h/2);
    K3=subs(subs(f,y,X(k-1,3)+h*K2),x,X(k-1,2)+h);
    
    X(k,3)=X(k-1,3)+h/6*(K0+2*K1+2*K2+K3);
end

while X(k,2)<xn
    k=k+1;
    X(k,1)=k-1;
    X(k,2)=X(k-1,2)+h;
    
    X(k,3)=X(k-1,3)+h/24*(55*subs(subs(f,x,X(k-1,2)),y,X(k-1,3))...
        -59*subs(subs(f,x,X(k-2,2)),y,X(k-2,3))...
        +37*subs(subs(f,x,X(k-3,2)),y,X(k-3,3))...
        -9*subs(subs(f,x,X(k-4,2)),y,X(k-4,3)));
end

X