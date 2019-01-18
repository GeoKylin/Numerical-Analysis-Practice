clear
close all
clc
format short

t=[0 0.9 1.9 3 3.9 5];
s=[0 10 30 50 80 110];
e=ones(length(t),1);

c1=t.^4*e/4
c2=t.^3*e/2
c3=t.^2*e
c4=s.*(t.^2)*e/2
c5=s.*t*e

A=[c1 c2;c2 c3];
B=[c4;c5];
A\B