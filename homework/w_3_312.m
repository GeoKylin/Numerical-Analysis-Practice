clear
close all
clc

a=0;
b=1;
syms x;
f='x/(4+x^2)';
n=8;

h=(b-a)/n;
s=h/6*(subs(f,x,a)+subs(f,x,b));

h1=h;
h2=h/2;
for i=1:n-1
    xi=a+h1*i;
    s=s+h/6*2*subs(f,x,xi);
    xi=a+h1*(i-1)+h2;
    s=s+h/6*4*subs(f,x,xi);
end
s=s+h/6*4*subs(f,x,b-h2);
s=vpa(s)