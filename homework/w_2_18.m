clear
close all
clc
format short g

x=[1 2 43 6 9 12 16 20]
y=[5.13 3.91 3.02 2.59 2.13 2.01 1.74 1.58]
e=ones(length(x),1)

y1=log(y)
x1=log(x)

c1=x1*e
c2=x1.^2*e
c3=y1*e
c4=x1.*y1*e

A=[length(x) c1;...
   c1 c2]
B=[c3;c4]
X=A\B
[A,B]