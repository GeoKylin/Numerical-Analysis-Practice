clear
close all
clc
format short g

x=[0 pi/4 pi/2 3*pi/4 pi 5*pi/4 3*pi/2 7*pi/4 2*pi];
y=[0 1.3 2.5 1.2 0 -1.2 -2.5 -1.3 0];
e=ones(length(x),1);

x1=sin(x);
x2=sin(2*x);
x3=sin(3*x);

c1=x1.^2*e
c2=x1.*x2*e
c3=x1.*x3*e
c4=x2.^2*e
c5=x2.*x3*e
c6=x3.^2*e
c7=x1.*y*e
c8=x2.*y*e
c9=x3.*y*e

A=[c1 c2 c3;...
   c2 c4 c5;...
   c3 c5 c6];
B=[c7;c8;c9];
X=A\B
[A,B]