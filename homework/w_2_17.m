clear
close all
clc
format short g

t=1:1:8;
y=[4 6.4 8 8.8 9.22 9.5 9.7 9.86];
e=ones(length(t),1);

y1=y.\1;
t1=t.\1;

c1=t1*e
c2=t1.^2*e
c3=y1*e
c4=y1.*t1*e

A=[8 c1;...
   c1 c2];
B=[c3;c4];
X=A\B
[A,B]