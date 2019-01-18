clear
close all
clc

a=0;
b=1;
n=8;
syms x
f='x/(4+x^2)';

h=(b-a)/n;
s=h/2*(subs(f,x,a)+subs(f,x,b));

h1=h;
for i=1:n-1
    xi=a+h1*i;
    s=s+h/2*2*subs(f,x,xi);
end
s=vpa(s)