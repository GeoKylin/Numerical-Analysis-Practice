clear
close all
clc

A=[3 0 -2;...
    0 2 1;...
    -2 1 2];
b=[7;2;5];
e=1e-4;
x0=zeros(length(b),1);

format short g
[B_J,~,fan_J,~]=Jacobi(A,b,e,x0)
[B_S,~,fan_S,~]=Seidel(A,b,e,x0)